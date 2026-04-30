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
brief -> spec -> plan -> build -> test -> review -> ship -> reflect
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
- Each task should have one outcome, no more than three acceptance criteria, a
  concrete verify command, and explicit out-of-scope boundaries.
- Repeated corrections should become reusable project rules in `AGENTS.md`.
- Learnings should end with a concrete change to templates, docs, workflow, or
  project practice.

## New Project Sequence

1. Copy `templates/project-brief.md` to `docs/project-brief.md`.
2. Fill in the brief before coding.
3. Update `AGENTS.md` so Codex understands the project.
4. Create a spec only for decisions that need review.
5. Create a small task plan.
6. Build the first vertical slice.
7. Verify, self-review, and fresh-review before expanding scope.

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
- Hooks should enforce checks that the agent must not skip.
- Reflection notes should capture what changed in the workflow, not just what
  was built.
