# Session Handoff

Use this file to make a Codex thread resumable from another thread.

Chat context is temporary. Repository context is durable. If a future Codex
session needs to understand where to continue, write the handoff here before
ending the session.

## Current Repository Purpose

This repo is Christophe's Codex project starter kit.

It is not primarily a notes repo. It turns AI engineering lessons into reusable
project defaults, templates, validation scripts, and project practice.

## Current Operating Model

```text
brief -> spec -> task -> baseline commit -> think first -> build -> verify -> review -> ship -> reflect
```

For AI systems, also use:

- `docs/ai-system-defaults.md`
- `templates/ai-system-spec.md`

## Latest Durable Checkpoint

Update this section at the end of meaningful sessions. Always verify exact
commit state with `git status --short --branch` and `git log --oneline`.

- Latest pushed branch: `origin/main`
- Latest pushed commit before this handoff update:
  - `3e548ec docs: extract Owain Skool workflow gaps`
- Active project or experiment: fresh GitHub clone validation plus Timezone
  Agent starter-kit learnings.
- What was validated:
  - A new Codex thread read `AGENTS.md`, this handoff file,
    `docs/validation-protocol.md`, `docs/starter-kit.md`, and the git log.
  - It correctly identified this repo as Christophe's reusable Codex starter
    kit, not a notes repo.
  - It correctly identified `main` as ahead of `origin/main` by one local
    commit.
  - It correctly treated UUIDs and markers as values that must be resolved
    before validation, not automatically as git commits.
  - It proposed the expected repository-health checks.
  - A separate empty `timezone-agent` folder used the starter kit to create a
    project brief, AI system spec, task plan, and Task 1 implementation without
    starting Task 2.
  - The experiment revealed that planning artifacts must be committed as a
    baseline before the first implementation task.
  - A fresh clone from `https://github.com/ChristopheAI/Codex.git` at
    `/tmp/codex-starter-fresh.0HLi0S/Codex` saw latest commit `3e548ec`, passed
    `sh scripts/validate-starter.sh`, and created `docs/project-brief.md` with
    `sh scripts/new-project.sh`.
- Known gaps:
  - Handoff docs can become stale after pushes unless updated as part of the
    session closeout.
  - The fresh-start flow creates a project brief, but does not yet scaffold
    project-local validation defaults like `scripts/validate.sh`,
    `.gitignore`, or a project-specific handoff file.
  - No active user-defined markers are currently documented.
- Next recommended action:
  - Backport the Timezone Agent closeout pattern into starter-kit defaults:
    project-local `.gitignore`, `scripts/validate.sh`, `docs/session-handoff.md`,
    and web/API smoke-test guidance.
  - Keep validating from a fresh clone after each starter-kit workflow change.

## Active Context Markers

Use this table when a user refers to a marker, UUID, task ID, run ID, or session
ID that is not a git commit.

| Marker | Type | Meaning | How To Resume |
| --- | --- | --- | --- |
| `<marker>` | `<git commit / Codex session / task / external run / note>` | `<meaning>` | `<next action>` |

Do not assume a UUID is a git commit. Resolve it using this file,
`docs/validation-protocol.md`, the git log, or explicit user context.

## Handoff Prompt For A New Codex Thread

```text
Read AGENTS.md, docs/session-handoff.md, docs/validation-protocol.md,
docs/starter-kit.md, and the latest git log.

Summarize:
- the repo purpose
- the latest durable checkpoint
- any active marker meanings
- what should be validated next

Do not implement until the continuation point is clear.
```

## End-Of-Session Update Checklist

- [ ] Record the latest commit or branch state.
- [ ] Record what was validated and how.
- [ ] Record any marker meanings introduced in chat.
- [ ] Record the next smallest action.
- [ ] Keep this file short enough that a new thread can read it quickly.
