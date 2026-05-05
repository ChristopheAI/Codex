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
2. Run `sh scripts/new-project.sh` to create the project brief, handoff file,
   control-plane files, validation script, production verification placeholder,
   and `.gitignore`.
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
11. Update `docs/session-handoff.md` with the actual baseline commit.
12. Build through the loop in `docs/implementation-loop.md`.
13. Review with `templates/review-checklist.md`.
14. After each durable task commit, update `docs/session-handoff.md`.
15. Close out V1 with `templates/reflection.md`.
16. Decide whether to stop, polish, or extend.
17. Record only the learnings that should change future project defaults.

## Bootstrap Checklist

- [ ] Project name and purpose are clear.
- [ ] Target user or business problem is written down.
- [ ] Success criteria are testable.
- [ ] Out-of-scope items are explicit.
- [ ] Tech stack is chosen intentionally.
- [ ] `AGENTS.md` reflects the project, not this starter repo.
- [ ] First task is small enough to build and review.
- [ ] `scripts/validate.sh` is adapted to the project.
- [ ] `scripts/project-status.mjs` gives a useful control-plane summary.
- [ ] `docs/ops/production-checklist.md` records production posture or says
      production does not exist yet.
- [ ] `scripts/verify-production.mjs` is adapted once production exists.
- [ ] Verification command or manual check is known.
- [ ] Handoff checkpoint rule is understood after every durable commit.
- [ ] V1 closeout path is known: handoff update plus reflection.

## What To Copy Into A New Project

Minimum:

```text
AGENTS.md
docs/new-project.md
docs/implementation-loop.md
docs/ai-system-defaults.md
docs/session-handoff.md
docs/validation-protocol.md
docs/codex-desktop-ui-map.md
docs/codex-context-compaction.md
docs/codex-permissions-guardrails.md
docs/codex-primitives-chooser.md
docs/codex-skills-playbook.md
docs/codex-automations-playbook.md
docs/project-control-plane.md
scripts/new-project.sh
scripts/validate-starter.sh
templates/project-brief.md
templates/spec.md
templates/ai-system-spec.md
templates/plan.md
templates/task.md
templates/github-issue.md
templates/review-checklist.md
templates/project-agents.md
templates/project-production-checklist.md
templates/project-status.mjs
templates/project-gitignore
templates/project-session-handoff.md
templates/project-validate.sh
templates/project-verify-production.mjs
templates/reflection.md
```

Optional:

```text
docs/codex-full-course-coverage.md
docs/codex-desktop-operating-model.md
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
  -> sh scripts/validate.sh
  -> node scripts/project-status.mjs
  -> self-review and fresh review
  -> commit
  -> handoff checkpoint update
  -> V1 closeout
  -> stop, polish, or extend
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
