#!/usr/bin/env node
import { execFile } from "node:child_process";
import { existsSync } from "node:fs";
import { readFile } from "node:fs/promises";
import { fileURLToPath } from "node:url";
import { promisify } from "node:util";

const execFileAsync = promisify(execFile);

const docs = [
  "AGENTS.md",
  "docs/session-handoff.md",
  "docs/ops/production-checklist.md",
];

export function parseGitState({ statusOutput, logOutput }) {
  const [branchLine = "", ...changeLines] = statusOutput
    .split("\n")
    .map((line) => line.trimEnd())
    .filter(Boolean);
  const branchMatch = branchLine.match(/^## ([^.]+)(?:\.\.\.([^\s]+))?/);

  return {
    branch: branchMatch?.[1] || "unknown",
    tracking: branchMatch?.[2] || "",
    clean: changeLines.length === 0,
    changes: changeLines.map((line) => line.trimStart()),
    latestCommit: logOutput.trim(),
  };
}

function firstBacktickValue(line) {
  return line.match(/`([^`]+)`/)?.[1] || "";
}

function firstParagraphAfterHeading(markdown, heading) {
  const lines = markdown.split("\n");
  const index = lines.findIndex((line) => line.trim() === heading);
  if (index === -1) return "";

  for (const line of lines.slice(index + 1)) {
    const trimmed = line.trim();
    if (!trimmed) continue;
    if (trimmed.startsWith("## ")) return "";
    return trimmed.replace(/^\d+\.\s+/, "");
  }

  return "";
}

export function extractHandoffSummary(markdown) {
  const lines = markdown.split("\n");

  return {
    latestCheckpoint: firstBacktickValue(lines.find((line) => line.includes("Latest meaningful project commit")) || ""),
    productionDeployment: firstBacktickValue(lines.find((line) => line.includes("Production deployment")) || ""),
    nextAction: firstParagraphAfterHeading(markdown, "## Next Recommended Action"),
  };
}

export function formatProjectStatus({ git, handoff, validationOk, productionOk }) {
  const tracking = git.tracking ? ` tracking ${git.tracking}` : "";
  const changes = git.clean ? "clean" : `${git.changes.length} pending change(s)`;
  const validation = validationOk ? "OK" : "FAILED";
  const production = productionOk === null ? "not configured" : productionOk ? "OK" : "FAILED";

  return [
    "Project Control Plane",
    "",
    "Git",
    `- Branch: ${git.branch}${tracking}`,
    `- Latest commit: ${git.latestCommit || "unknown"}`,
    `- Working tree: ${changes}`,
    "",
    "Validation",
    `- Project validation: ${validation}`,
    `- Production verification: ${production}`,
    `- Production deployment: ${handoff.productionDeployment || "not recorded"}`,
    "",
    "Handoff",
    `- Latest checkpoint: ${handoff.latestCheckpoint || "see git log"}`,
    `- Next action: ${handoff.nextAction || "review docs/session-handoff.md"}`,
    "",
    "Docs",
    ...docs.map((doc) => `- ${doc}`),
  ].join("\n");
}

async function run(command, args) {
  const { stdout, stderr } = await execFileAsync(command, args, {
    env: { ...process.env, CI: "1" },
    maxBuffer: 10 * 1024 * 1024,
  });
  return `${stdout}${stderr}`;
}

async function runOptional(command, args) {
  try {
    await run(command, args);
    return true;
  } catch (error) {
    const output = `${error.stdout || ""}${error.stderr || ""}`.trim();
    if (output) console.error(output);
    return false;
  }
}

async function runStatus() {
  const [statusOutput, logOutput, handoffMarkdown] = await Promise.all([
    run("git", ["status", "--short", "--branch"]),
    run("git", ["log", "-1", "--oneline"]),
    readFile("docs/session-handoff.md", "utf-8"),
  ]);

  const validationOk = await runOptional("sh", ["scripts/validate.sh"]);
  const productionOk = existsSync("scripts/verify-production.mjs")
    ? await runOptional("node", ["scripts/verify-production.mjs"])
    : null;

  console.log(
    formatProjectStatus({
      git: parseGitState({ statusOutput, logOutput }),
      handoff: extractHandoffSummary(handoffMarkdown),
      validationOk,
      productionOk,
    }),
  );

  if (!validationOk || productionOk === false) process.exitCode = 1;
}

const isEntrypoint = process.argv[1] && fileURLToPath(import.meta.url) === process.argv[1];
if (isEntrypoint) {
  runStatus().catch((error) => {
    console.error(error instanceof Error ? error.message : error);
    process.exitCode = 1;
  });
}
