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

## How This Repo Should Be Used

For every new project:

1. Start from this repository structure.
2. Fill in `templates/project-brief.md`.
3. Adapt `AGENTS.md` to the project.
4. Write a spec when decisions matter.
5. Break the work into small reviewable tasks.
6. Build with Codex.
7. Test, review, and reflect before moving on.

See [docs/starter-kit.md](docs/starter-kit.md) for the full starter workflow.

## Operating Model

The core workflow follows the pattern Owain Lewis teaches:

```text
brief -> spec -> plan -> build -> test -> review -> ship -> reflect
```

Codex is strongest when the work is shaped well before implementation starts.
The goal is to give the agent small, reviewable, verifiable tasks and then
hold the output to professional software standards.

## Repository Map

```text
AGENTS.md                 Base instructions for Codex
docs/                     Starter workflow, roadmap, operating models
templates/                Project brief, specs, plans, review checklists
learnings/                Supporting synthesis that improves the starter kit
projects/                 Example or proof projects built end to end
```

## Current Focus

1. Make this repo a reliable starter kit for every new project.
2. Convert Owain's AI Engineer material into practical engineering defaults.
3. Add example projects that prove the workflow works.
4. Add deployment, eval, observability, and client-ready patterns over time.

## Principles

- Starter kit first, learnings second, portfolio third.
- Prefer principles over tool tricks.
- Use specs when decisions matter.
- Keep agent instructions compact.
- Test behavior that matters.
- Review AI-generated code like code from a junior engineer.
- Ship small vertical slices.
- Reflect after each project and improve the workflow.
