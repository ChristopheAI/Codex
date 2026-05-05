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

Update this section after every durable project commit and at the end of
meaningful sessions. Verify exact state with `git status --short --branch` and
`git log --oneline -5`. Use the Project Control Plane command when available:

```bash
node scripts/project-status.mjs
```

- Current branch:
- Latest meaningful project commit:
- Latest handoff/checkpoint update:
- Latest pushed commit:
- Validation command and result:
- Production deployment:
- Production verification command and result:
- Known gaps:
- Next recommended action:

Use "Latest meaningful project commit" for planning baseline, implementation,
review, or closeout commits. A handoff-only commit can be recorded separately;
do not create an infinite loop just to record the handoff commit itself.

## Next Recommended Action

Write the next smallest safe action here. Keep it concrete enough that a new
Codex session can continue without reconstructing chat context.

`<next action>`

## Control Plane

Read these first in a new session:

- `AGENTS.md`
- `docs/session-handoff.md`
- `docs/ops/production-checklist.md`

Then run:

```bash
node scripts/project-status.mjs
```

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
- [ ] Confirm the handoff reflects the latest meaningful project commit.
- [ ] Keep this file short enough for a new thread to read quickly.
