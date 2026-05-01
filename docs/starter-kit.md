# Starter Kit Workflow

This repository exists so every new AI or software project starts from a strong
default process.

The goal is not to collect notes. The goal is to make better projects easier to
start.

## First Principle

The first artifact is the project brief.

Do not begin by asking Codex to build. Begin by deciding what should be true
when the project works.

## When Starting A New Project

1. Create a new repo or folder from this starter kit.
2. Copy `templates/project-brief.md` to `docs/project-brief.md`.
3. Fill in the project brief.
4. Adapt `AGENTS.md` from that brief.
5. Decide whether the first task needs a spec.
6. Use `templates/spec.md` for decisions, invariants, data shapes, or failure
   behavior.
7. Use `templates/ai-system-spec.md` for LLM, RAG, tool, workflow, or agent
   decisions.
8. Use `templates/plan.md` when the work needs multiple small tasks.
9. Use `templates/task.md` when handing one task to Codex.
10. Commit the planning artifacts as the project baseline.
11. Build through the loop in `docs/implementation-loop.md`.
12. Review with `templates/review-checklist.md`.
13. Update `docs/session-handoff.md` when another Codex thread may need to
    continue the work.
14. Record only the learnings that should change future project defaults.

## Bootstrap Checklist

- [ ] Project name and purpose are clear.
- [ ] Target user or business problem is written down.
- [ ] Success criteria are testable.
- [ ] Out-of-scope items are explicit.
- [ ] Tech stack is chosen intentionally.
- [ ] `AGENTS.md` reflects the project, not this starter repo.
- [ ] First task is small enough to build and review.
- [ ] Verification command or manual check is known.

## What To Copy Into A New Project

Minimum:

```text
AGENTS.md
docs/new-project.md
docs/implementation-loop.md
docs/ai-system-defaults.md
docs/session-handoff.md
docs/validation-protocol.md
scripts/new-project.sh
scripts/validate-starter.sh
templates/project-brief.md
templates/spec.md
templates/ai-system-spec.md
templates/plan.md
templates/task.md
templates/review-checklist.md
```

Optional:

```text
docs/owain-operating-model.md
docs/roadmap.md
learnings/
projects/
```

For a client or production-minded project, keep the workflow docs close. For a
small experiment, copy only what will actually be used.

## Project Initialization Pattern

```text
new idea
  -> project brief
  -> first spec if decisions matter
  -> AI system spec if LLMs or agents are involved
  -> task plan
  -> planning baseline commit
  -> one-outcome task
  -> think first
  -> Codex implementation
  -> verification
  -> self-review and fresh review
  -> commit
  -> handoff update
  -> reflection
```

## Thread Continuation Pattern

```text
new thread
  -> read AGENTS.md
  -> read docs/session-handoff.md
  -> read docs/validation-protocol.md
  -> inspect git state
  -> resolve any marker
  -> validate intended scope
  -> continue with the next smallest action
```

## What Learnings Are For

Learnings are inputs to the starter kit, not the main product.

A learning note should usually end with one of these:

- update a template
- add a checklist item
- change `AGENTS.md`
- add a project example
- improve a verification habit

If a note does not change future behavior, it can stay outside the repo.
