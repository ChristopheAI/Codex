# Project Agent Guide

This file is the Project Control Plane entrypoint for Codex.

Replace this template with project-specific truth before implementation starts.
Keep it short, operational, and safe to read in every new session.

## Session Start

At the start of a new Codex session:

1. Read this file.
2. Read `docs/session-handoff.md`.
3. Read `docs/ops/production-checklist.md` before touching deployment,
   credentials, production data, or security settings.
4. Run `node scripts/project-status.mjs` when project state or next action
   matters.

## Project Facts

- Project name: `<name>`
- Purpose: `<one sentence>`
- Primary user: `<user or team>`
- Repo: `<owner/name or local path>`
- Production URL: `<none yet / url>`
- Deployment target: `<none yet / Vercel / other>`
- Main branch: `<main>`

## Current Constraints

- `<constraint 1>`
- `<constraint 2>`
- `<constraint 3>`

## Security Rules

- Never print secrets, `.env*` values, auth headers, API keys, tokens, or
  credentials.
- Do not reveal personal data, private customer data, logs, or audit contents
  unless the user explicitly asks.
- Keep production verification secret-free.
- Document any risky production action before taking it.

## Commands

Use these as the default proof surface and adapt them to the project:

```bash
node scripts/project-status.mjs
sh scripts/validate.sh
node scripts/verify-production.mjs
```

## Code Layout

- `docs/project-brief.md`: project source of truth.
- `docs/session-handoff.md`: current checkpoint and next action.
- `docs/ops/production-checklist.md`: production posture and hardening.
- `scripts/project-status.mjs`: control-plane summary.
- `scripts/validate.sh`: project validation command.
- `scripts/verify-production.mjs`: production verification command.

Add real source directories here once the stack is chosen.

## Change Discipline

- Keep changes small and rollbackable.
- Prefer existing project patterns once code exists.
- Add or update tests for non-trivial behavior.
- Update `docs/session-handoff.md` after durable project commits.
- Commit only intended files.
