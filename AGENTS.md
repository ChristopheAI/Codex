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

- A new project begins with `templates/project-brief.md`.
- `AGENTS.md` should be copied and adapted for project-specific context.
- Specs are required when behavior, architecture, data shape, deployment, or
  failure handling has decisions worth reviewing.
- Plans should split work into small tasks that Codex can execute, a human can
  review, and Git can roll back.
- Learnings should end with a concrete change to templates, docs, workflow, or
  project practice.

## Style

- Keep instructions compact and concrete.
- Prefer existing repo patterns once projects exist.
- Do not add process for its own sake.
- Make small safe changes that are easy to review and roll back.
- Document assumptions when a decision is not yet proven.

## Quality Bar

- Every non-trivial build should have a verification step.
- Tests should cover behavior, edge cases, and failure paths that matter.
- Reviews should prioritize correctness, scope control, security, and hidden
  contract changes.
- Reflection notes should capture what changed in the workflow, not just what
  was built.
