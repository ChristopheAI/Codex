# Codex AI Engineering OS

This repo is Christophe's personal AI engineering operating system.

## Goal

Use Codex to learn and practice professional AI engineering: specs, planning,
implementation, testing, review, deployment, and reflection.

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

- `docs/`: durable operating models, roadmaps, and design notes.
- `templates/`: reusable task, spec, plan, and review templates.
- `learnings/`: synthesized lessons from courses, videos, Skool, and practice.
- `projects/`: real AI systems and exercises built end to end.

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
