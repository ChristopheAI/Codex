# Codex Project Starter Kit

This repo is Christophe's reusable starter kit for AI and software projects
built with Codex.

## Goal

Make every new project start with a strong default workflow: brief, spec, plan,
build, test, review, ship, and reflect.

Learning notes are secondary. They should improve the starter kit or future
project execution.

## Workflow

Default lifecycle:

```text
brief -> spec -> plan -> baseline commit -> build -> test -> review -> ship -> reflect
```

Use the lightest useful process:

- Tiny, obvious change: implement directly, then verify.
- Task with decisions or invariants: write or update a spec first.
- Multi-step work: create a plan with small reviewable tasks.
- Code changes: verify with the strongest practical checks.
- Completed work: summarize what changed and what remains.

## Repository Structure

- `docs/`: starter workflow, operating models, roadmaps, and durable notes.
- `templates/`: reusable task, spec, plan, and review templates.
- `learnings/`: synthesized lessons that improve the starter kit.
- `projects/`: real AI systems and exercises built end to end.

## Starter Kit Rules

- A new project begins with a filled `docs/project-brief.md`.
- Do not ask Codex to build before the project brief is clear.
- `AGENTS.md` should be adapted from the project brief, not from vibes.
- Specs are required when behavior, architecture, data shape, deployment, or
  failure handling has decisions worth reviewing.
- Plans should split work into small tasks that Codex can execute, a human can
  review, and Git can roll back.
- Project planning artifacts should be committed as the planning baseline before
  the first implementation task.
- Each task should have one outcome, no more than three acceptance criteria, a
  concrete verify command, and explicit out-of-scope boundaries.
- Repeated corrections should become reusable project rules in `AGENTS.md`.
- AI projects should use `docs/ai-system-defaults.md` and
  `templates/ai-system-spec.md` before implementation.
- Prefer the simplest AI pattern that works: SDK call, then workflow, then
  agent only when the path is genuinely unknown.
- Cross-thread context belongs in `docs/session-handoff.md`, not only in chat.
- After every durable project commit, update `docs/session-handoff.md` with the
  actual latest meaningful commit, validation result, known gaps, and next
  recommended action before expanding scope.
- When asked to validate from a marker, use `docs/validation-protocol.md` and
  resolve the marker before running generic checks.
- Learnings should end with a concrete change to templates, docs, workflow, or
  project practice.
- Keep agent-facing context compressed. Remove repeated rules and padding, but
  keep exact commands, paths, constraints, and hard-earned edge cases.
- External writes should have a dry-run or human approval path before real
  execution.

## New Project Sequence

1. Copy `templates/project-brief.md` to `docs/project-brief.md`.
2. Fill in the brief before coding.
3. Update `AGENTS.md` so Codex understands the project.
4. Create a spec only for decisions that need review.
5. Create a small task plan.
6. Commit `docs/project-brief.md`, specs, and the task plan as the planning
   baseline.
7. Build the first vertical slice.
8. Verify, self-review, and fresh-review before expanding scope.

## New Thread Sequence

1. Read `AGENTS.md`.
2. Read `docs/session-handoff.md`.
3. Read `docs/validation-protocol.md`.
4. Check `git status --short --branch` and the latest git log.
5. Summarize the continuation point before changing files.

## Implementation Loop

Default loop for non-trivial work:

```text
task -> think first -> implement -> verify -> self-review -> fresh review -> commit
```

Use `docs/implementation-loop.md` for the full workflow. If the agent starts
guessing, looping, or expanding scope, stop and improve the spec or task.

## Style

- Keep instructions compact and concrete.
- Prefer existing repo patterns once projects exist.
- Do not add process for its own sake.
- Make small safe changes that are easy to review and roll back.
- Document assumptions when a decision is not yet proven.

## Quality Bar

- Every non-trivial build should have a verification step.
- Verification commands should be listed in `AGENTS.md` for each real project.
- Tests should cover behavior, edge cases, and failure paths that matter.
- Tests should avoid theatre: they should prove behavior, not just assert that a
  mock was called.
- Reviews should prioritize correctness, scope control, security, and hidden
  contract changes.
- Non-trivial work should get spec review before execution and output review
  after execution.
- Hooks should enforce checks that the agent must not skip.
- AI systems should define observability, evals, and no-answer behavior before
  production use.
- Reflection notes should capture what changed in the workflow, not just what
  was built.
