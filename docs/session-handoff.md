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
- Latest pushed commit: `06318f5 Add AI system project defaults`
- Latest local checkpoint before this handoff update:
  - `9a64ca8 Update session handoff checkpoint`
  - `2c75b4f Add thread handoff protocol`
- Active project or experiment: fresh Codex thread plus Timezone Agent starter
  kit validation.
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
- Known gaps:
  - Local handoff/workflow commits are not pushed until intentionally published.
  - No active user-defined markers are currently documented.
- Next recommended action:
  - Run repository-health validation.
  - In `timezone-agent`, commit the planning docs as the baseline before
    continuing to Task 2.
  - Continue validating the full brief/spec/task/build/verify/review loop on
    the Timezone Agent project.

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
