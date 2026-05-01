# Validation Protocol

Use this when the user asks Codex to test, validate, resume, or continue from a
marker.

## Principle

Validation must prove the intended thing, not just run whatever checks are
available.

Before validating from a marker, first determine what the marker refers to.

## Marker Resolution

When the user says "validate from `<marker>`", classify the marker before
running checks.

Possible marker types:

- Git commit or ref
- GitHub branch, PR, issue, or workflow run
- Codex thread, session, task, or run ID
- External tool checkpoint
- User-defined marker from chat
- Plain text note with no machine-readable meaning

Resolution steps:

1. Check whether the marker is documented in `docs/session-handoff.md`.
2. Check whether it is a local git commit or ref.
3. Check whether it is a remote GitHub ref or workflow identifier when GitHub
   context is relevant.
4. Check local files only when the user has indicated the marker lives in the
   repo or workspace.
5. If the marker still cannot be resolved, state that clearly and ask for the
   missing source.

Do not silently treat an unresolved UUID as a git commit.

## Validation Levels

Choose the level that matches the request.

### Repository Health

Use when validating the starter kit itself.

```bash
sh scripts/validate-starter.sh
git diff --check
sh -n scripts/new-project.sh
sh -n scripts/validate-starter.sh
```

### Behavior Check

Use when a script, workflow, or feature changed.

- Run the script or feature in a temporary location.
- Check the expected success path.
- Check at least one important failure path.
- Report exact commands and outcomes.

### Continuation Check

Use when resuming from a previous session.

- Read `docs/session-handoff.md`.
- Confirm the latest git state.
- Confirm whether the referenced marker is known.
- Validate only the scope implied by that marker.

### AI System Check

Use when validating an AI feature.

- Check structured output contracts.
- Check tool input validation and error returns.
- Check no-answer or boundary behavior.
- Run manual eval examples.
- Confirm traces, costs, latency, or logs when available.

## Reporting Format

Report validation like this:

```text
Marker:
Resolved as:
Scope validated:
Commands/checks:
Result:
Gaps:
Next action:
```

If the marker is unresolved, say:

```text
I could not resolve <marker> as a git ref, documented handoff marker, or local
workspace reference. I can validate repository health, but that may not prove
the continuation point you intended.
```

## What Not To Do

- Do not claim a marker was validated if the marker was never resolved.
- Do not substitute generic repo checks for continuation validation without
  saying so.
- Do not assume chat-only context exists in a fresh thread.
- Do not rely on memory when a repo handoff file should carry the context.
