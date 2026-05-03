# Codex Permissions And Guardrails

Codex can read files, edit files, run commands, use tools, and interact with
connected services. Treat that power as useful but supervised.

## Default Posture

Use the least permission that lets the task move.

Good defaults:

- keep work scoped to the current project
- inspect commands before broad writes
- approve external writes deliberately
- run verification before trusting output
- review diffs before staging or committing

## Full Access

Full access is for moments when you understand the blast radius.

Use it only when:

- the task is well scoped
- the repo has a clean Git state
- destructive commands are protected
- validation commands are known
- you are present enough to inspect results

Avoid full access for:

- production data
- secrets
- payments
- auth changes
- migrations
- ambiguous cleanup tasks
- commands outside the project tree

## Terminal Basics

The Codex terminal is a real shell.

Prefer:

- `git status --short --branch`
- `git diff --check`
- project validation scripts
- focused `rg` searches
- explicit file paths

Avoid:

- broad destructive commands
- unexplained recursive deletes
- force pushes
- silent environment changes
- commands that mix unrelated actions

## Git Safety

Before file changes:

```bash
git status --short --branch
```

Before commit:

```bash
git diff --check
sh scripts/validate.sh
```

For this starter kit:

```bash
sh scripts/validate-starter.sh
```

Stage only the intended files. Do not use broad staging when unrelated changes
are present.

## Hooks And Command Guards

Approval prompts are useful, but they are not a complete safety model.

For serious local work, consider:

- shell hooks for pre-tool checks
- destructive command protection
- project-specific validation scripts
- branch protection and PR review
- dry-run modes for external writes

The rule is simple: if a command can damage data, history, money, accounts, or
production systems, it needs a guardrail or explicit human approval path.

## External Writes

External writes include:

- sending emails
- updating production databases
- writing to SaaS tools
- deploying
- pushing branches
- closing issues
- changing calendar events

Prefer dry runs, drafts, or review steps first. Real execution should be
explicit.
