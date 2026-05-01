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
  - `2b85d2c docs: update closeout handoff checkpoint`
- Latest meaningful local checkpoint before this handoff update:
  - `45a528d docs: require handoff checkpoints after durable commits`
- Active project or experiment: repeated handoff checkpoint backport from
  `meeting-cost-calculator` and `simple-invoice-tracker`.
- What was validated:
  - `meeting-cost-calculator` needed a handoff fix after Task 1.
  - `simple-invoice-tracker` needed a handoff fix after the planning baseline
    and again after Task 1.
  - `45a528d` backports that repeated learning into `AGENTS.md`,
    `docs/new-project.md`, `docs/implementation-loop.md`,
    `docs/starter-kit.md`, `templates/project-session-handoff.md`, and
    `scripts/validate-starter.sh`.
  - Fresh checks for the handoff checkpoint backport:
    - `git diff --check`
    - `sh scripts/validate-starter.sh`
    - `sh -n scripts/validate-starter.sh && sh -n scripts/new-project.sh &&
      sh -n templates/project-validate.sh`
    - fresh-start copy check in `/tmp/codex-handoff-check.*`
- Known gaps:
  - `45a528d` and this handoff update are local until intentionally pushed.
  - Existing project smoke checks are still project-specific; the starter kit
    provides the pattern, not a universal browser runner.
  - No active user-defined markers are currently documented.
- Next recommended action:
  - Push the starter-kit handoff checkpoint commits when the user explicitly
    asks.
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
