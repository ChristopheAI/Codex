#!/usr/bin/env node

// Project Production Verification
//
// Adapt this file once the project has a real production surface. Keep the
// command secret-free: print statuses, URLs, deployment ids, and env var names,
// but never print secret values, auth headers, tokens, or private user data.

const productionUrl = process.env.PROJECT_PRODUCTION_URL || "";

async function verifyProduction() {
  if (!productionUrl) {
    console.log("Project Production Verification");
    console.log("SKIP production URL is not configured.");
    console.log("Set PROJECT_PRODUCTION_URL or replace this placeholder with project-specific checks.");
    return;
  }

  const response = await fetch(productionUrl, {
    method: "HEAD",
    redirect: "manual",
  });

  const ok = response.status >= 200 && response.status < 500;
  console.log("Project Production Verification");
  console.log(`${ok ? "OK" : "FAIL"} ${productionUrl} returned ${response.status}`);

  if (!ok) {
    process.exitCode = 1;
  }
}

verifyProduction().catch((error) => {
  console.error(error instanceof Error ? error.message : error);
  process.exitCode = 1;
});
