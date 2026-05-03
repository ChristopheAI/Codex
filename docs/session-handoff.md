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
  - `1d93cd8 docs: update course coverage handoff`
- Latest meaningful local checkpoint before this handoff update:
  - `21234b0 docs: rename workflow to codex operating base`
- Active project or experiment: local workspace renamed from
  `Maximize Codex` to `Codex Operating Base`.
- What was validated:
  - Renamed local repo folder to
    `/Users/christophe/Projects/Codex Operating Base`.
  - Confirmed `/Users/christophe/Projects/Maximize Codex` no longer exists and
    the new folder contains the Git repo.
  - Confirmed `HEAD` still matches `origin/main` before the doc rename.
  - Updated `docs/codex-desktop-operating-model.md` so the workflow name matches
    Codex Operating Base.
  - Confirmed there are no remaining outdated `Maximize Codex` or old absolute
    path references outside this handoff note.
  - Fresh checks for the workspace rename:
    - `git diff --check`
    - `sh scripts/validate-starter.sh`
- Known gaps:
  - `21234b0` and this handoff update are local until intentionally pushed.
  - GitHub repository URL remains `https://github.com/ChristopheAI/Codex.git`;
    only the local workspace folder was renamed.
  - No active user-defined markers are currently documented.
- Next recommended action:
  - Push the Codex Operating Base rename commits to `origin/main`.
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
