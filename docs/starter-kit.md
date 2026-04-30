# Starter Kit Workflow

This repository exists so every new AI or software project starts from a strong
default process.

The goal is not to collect notes. The goal is to make better projects easier to
start.

## When Starting A New Project

1. Create a new repo or folder from this starter kit.
2. Copy or adapt `AGENTS.md`.
3. Fill in `templates/project-brief.md`.
4. Decide whether the first task needs a spec.
5. Use `templates/spec.md` for decisions, invariants, data shapes, or failure
   behavior.
6. Use `templates/plan.md` when the work needs multiple small tasks.
7. Build with Codex.
8. Review with `templates/review-checklist.md`.
9. Record only the learnings that should change future project defaults.

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
templates/project-brief.md
templates/spec.md
templates/plan.md
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
  -> task plan
  -> Codex implementation
  -> tests/checks
  -> review
  -> commit
  -> reflection
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
