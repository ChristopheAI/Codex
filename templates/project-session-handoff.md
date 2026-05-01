# Project Session Handoff

Use this file to make the project resumable from another Codex thread.

## Current Project Purpose

Describe what this project does and who it is for.

## Current V1 Scope

Describe the smallest useful version currently being built.

## V1 Status

- Status: `<not started / in progress / complete / paused>`
- Validation command:
- Last validation result:
- Closeout recommendation: `<stop / polish / extend>`
- Residual gaps:

## Latest Durable Checkpoint

Update this section at the end of meaningful sessions. Verify exact state with
`git status --short --branch` and `git log --oneline -5`.

- Current branch:
- Latest local commit:
- Latest pushed commit:
- What was validated:
- Known gaps:
- Next recommended action:

## Active Markers

Use this table when a user refers to a marker, UUID, task ID, run ID, or session
ID that is not a git commit.

| Marker | Type | Meaning | How To Resume |
| --- | --- | --- | --- |
| `<marker>` | `<git commit / Codex session / task / external run / note>` | `<meaning>` | `<next action>` |

Do not assume a UUID is a git commit. Resolve it before validating.

## End-Of-Session Checklist

- [ ] Record latest branch and commit state.
- [ ] Record validation commands and outcomes.
- [ ] Record marker meanings introduced in chat.
- [ ] Record the next smallest action.
- [ ] Keep this file short enough for a new thread to read quickly.
