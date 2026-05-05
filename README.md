# Codex Project Starter Kit

This repository is my reusable starting point for new AI and software projects
built with Codex.

It is not primarily a notes repo. Notes are useful only when they improve the
starter kit, the workflow, or the quality of future projects.

## Purpose

- Start new projects with a professional Codex-ready structure.
- Reuse the same spec, plan, review, and project brief workflow every time.
- Turn AI engineering lessons into reusable project defaults.
- Build production-minded AI systems, not tutorial-only demos.
- Preserve enough context that a new Codex thread can continue without guessing.

## How This Repo Should Be Used

The first move is always the project brief. Do not start by asking Codex to
build the app.

For every new project:

1. Start from this repository structure.
2. Run `sh scripts/new-project.sh` to create the project brief, handoff file,
   validation script, and `.gitignore`.
3. Adapt `AGENTS.md` to the project using the brief as source of truth.
4. Write a spec when decisions matter.
5. Use the AI system spec when the project includes LLMs, RAG, tools, or agents.
6. Break the work into small reviewable tasks.
7. Commit the planning docs as the project baseline.
8. Make `sh scripts/validate.sh` prove the current task and V1 behavior.
9. Build with Codex.
10. Test, review, commit, and close out V1 before moving on.

See [docs/new-project.md](docs/new-project.md) for the exact start sequence.

## New Thread Handoff

Before continuing from another Codex thread, read:

- `AGENTS.md`
- `docs/session-handoff.md`
- `docs/validation-protocol.md`
- the latest git log

Markers, UUIDs, task IDs, and session IDs are not automatically git commits.
Resolve the marker first, then validate the intended scope.

## Operating Model

The core workflow follows the pattern Owain Lewis teaches:

```text
brief -> spec -> task -> baseline commit -> think first -> build -> verify -> review -> ship -> reflect
```

Codex is strongest when the work is shaped well before implementation starts.
The goal is to give the agent small, reviewable, verifiable tasks and then
hold the output to professional software standards.

See [docs/codex-desktop-operating-model.md](docs/codex-desktop-operating-model.md)
for how that lifecycle maps onto the Codex Desktop app surface.
See [docs/codex-full-course-coverage.md](docs/codex-full-course-coverage.md)
for the gap map between the five-part course and this starter kit.

## Repository Map

```text
AGENTS.md                 Base instructions for Codex
docs/                     New-project workflow, roadmap, operating models
docs/project-control-plane.md
                          Reusable status, handoff, validation, and production cockpit
docs/patterns/            Reusable production and project patterns
templates/                Project brief, specs, plans, review checklists
learnings/                Supporting synthesis that improves the starter kit
projects/                 Example or proof projects built end to end
examples/                 Filled-in examples of the starter workflow
```

## Current Focus

1. Make this repo a reliable starter kit for every new project.
2. Convert Owain's AI Engineer material into practical engineering defaults.
3. Add example projects that prove the workflow works.
4. Add deployment, eval, observability, and client-ready patterns over time.
5. Extract proven Bavast/Vercel practices into reusable project defaults.
6. Give every serious project a control plane: `AGENTS.md`, handoff, ops
   checklist, validation, production verification, and one status command.

## Principles

- Starter kit first, learnings second, portfolio third.
- Prefer principles over tool tricks.
- Use specs when decisions matter.
- Use the simplest AI pattern that solves the problem.
- Slice work into one-outcome tasks.
- Commit planning artifacts before the first implementation task.
- Keep agent instructions compact.
- Give agents concrete verification commands.
- Treat V1 as incomplete until `sh scripts/validate.sh` proves tests and smoke
  checks in one command.
- After V1, decide deliberately: stop, polish, or extend.
- Evaluate AI quality with tests, manual examples, and traces.
- Make handoffs explicit when work must continue across Codex threads.
- Review AI-generated code like code from a junior engineer.
- Ship small vertical slices.
- Reflect after each project and improve the workflow.
