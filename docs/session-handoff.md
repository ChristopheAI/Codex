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

## Latest Durable Checkpoint

Update this section at the end of meaningful sessions. Always verify exact
commit state with `git status --short --branch` and `git log --oneline`.

- Latest pushed branch: `origin/main`
- Latest pushed commit:
  - `c188274 docs: update codex desktop handoff`
- Latest meaningful local checkpoint before this handoff update:
  - `780b1e2 docs: expand codex course coverage`
- Active project or experiment: broader Codex full course coverage extraction
  into starter-kit docs and templates.
- What was validated:
  - Added `docs/codex-full-course-coverage.md` to map all 24 PDF sections to
    starter-kit coverage and remaining external/current-docs boundaries.
  - Added course-derived docs for Desktop UI, context/compaction, permissions,
    primitive choice, skills, and automations.
  - Added `templates/github-issue.md` for one-outcome, verifiable GitHub
    issues.
  - Updated `README.md`, `docs/starter-kit.md`, and
    `scripts/validate-starter.sh` so the new coverage layer is discoverable and
    validated.
  - Fresh checks for the expanded Codex course coverage:
    - `git diff --check`
    - `sh scripts/validate-starter.sh`
    - `sh -n scripts/validate-starter.sh && sh -n scripts/new-project.sh &&
      sh -n templates/project-validate.sh`
    - fresh-start copy check in `/tmp/maximize-codex-full-course.99iE0v`
- Known gaps:
  - `780b1e2` and this handoff update are local until intentionally pushed.
  - The repo now distills broad PDF coverage, but it intentionally does not
    mirror the course slide-by-slide or freeze changing details such as pricing,
    model availability, platform limits, or external setup screens.
  - No active user-defined markers are currently documented.
- Next recommended action:
  - Push the expanded course coverage commits to `origin/main`.
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
