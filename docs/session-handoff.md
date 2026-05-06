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
brief -> spec -> task -> baseline commit -> think first -> build -> verify
-> review -> commit -> handoff checkpoint -> closeout -> stop/polish/extend
```

For AI systems, also use:

- `docs/ai-system-defaults.md`
- `templates/ai-system-spec.md`
- `docs/ai-project-sop.md`
- `docs/learning-intake.md`

## Latest Durable Checkpoint

Update this section at the end of meaningful sessions. Always verify exact
commit state with `git status --short --branch` and `git log --oneline`.

- Current branch: `codex/operating-base-sop`
- Latest pushed branch before this publishing flow: `origin/main`
- Latest meaningful local checkpoint before this handoff update:
  - `147fe18 docs: add operating base SOP workflow`
- Active project or experiment: Codex Operating Base now has an agent-readable
  SOP workflow, a learning-intake filter, and a new-project smoke test.
- What was validated:
  - Added `docs/ai-project-sop.md` as the compact standard operating procedure
    for starting AI/software projects with Codex App.
  - Added `docs/learning-intake.md` to route Skool/Owain/Codex insights through
    five reinforcement tracks: SOP, templates, production readiness, smoke
    tests, and feedback loop.
  - Added `scripts/smoke-new-project.sh` to bootstrap a temporary project,
    fill a minimal planning baseline, update handoff, and verify that
    `node scripts/project-status.mjs` can resume from repository files.
  - Updated README, starter workflow, validation protocol, roadmap, starter
    validation, and project handoff template to include the SOP/intake/smoke
    workflow.
  - Fresh checks:
    - `sh scripts/validate-starter.sh`
    - `sh scripts/smoke-new-project.sh`
    - `git diff --check`
    - `sh -n scripts/new-project.sh`
    - `sh -n scripts/smoke-new-project.sh`
    - `sh -n scripts/validate-starter.sh`
- Known gaps:
  - The SOP/intake work is being published from
    `codex/operating-base-sop`; it is not merged to `main` yet.
  - Production readiness is still a documented track, not yet a full dedicated
    production AI SOP.
  - No active user-defined markers are currently documented.
- Next recommended action:
  - Push `codex/operating-base-sop` and open a draft PR.
  - Review whether `templates/ai-system-spec.md` should be strengthened next
    for evals, monitoring, and production operations.

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
docs/ai-project-sop.md, docs/learning-intake.md, docs/starter-kit.md, and the
latest git log.

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
