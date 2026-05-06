# Starter Kit Roadmap

This roadmap turns the repo into a reusable starting point for new AI and
software projects.

## Phase 1: Starter Kit Foundation

Goal: make the repo useful as the default base for any new project.

- Set up `AGENTS.md`.
- Create project brief, spec, plan, and review templates.
- Document the new-project workflow.
- Keep learnings secondary to starter-kit improvements.
- Learn local vs worktree workflows.

Evidence:

- A new project can be started from this repo without reinventing process.
- The first project brief can be filled in from a template.

## Phase 2: Software Engineering Discipline

Goal: use AI without skipping engineering judgment.

- Practice requirements and specs.
- Break work into small vertical slices.
- Add meaningful tests.
- Review generated code before accepting it.
- Keep commits scoped and readable.
- Add hooks or repeatable checks where agents must not skip verification.

Evidence:

- A small app built through spec -> task -> verify -> review -> commit.

## Phase 3: AI Project Defaults

Goal: add reusable defaults for common AI application patterns.

- Model calls and structured outputs.
- Tool calling.
- Workflows vs agents.
- RAG with PostgreSQL and pgvector.
- Intent classification and routing.
- Streaming responses.
- Evals and observability defaults.

Evidence:

- Starter templates and examples cover the first AI system pattern.
- `docs/ai-system-defaults.md` guides pattern choice before implementation.
- AI project lessons are placed on the maturity ladder in
  `docs/learning-intake.md` before becoming templates or rules.

## Phase 4: Production Readiness

Goal: make the starter kit production-minded by default.

- Environment configuration.
- Deployment target.
- Logging and monitoring.
- Error handling and retries.
- Evals and manual test cases.
- Cost and latency awareness.
- Per-client billing and ownership clarity for client work.
- Background jobs and scheduled automations.
- CI plus deployment smoke checks.

Evidence:

- Deployed project with a runbook and smoke tests.

## Phase 5: Portfolio And Client Readiness

Goal: show capability clearly.

- Document the problem solved.
- Show architecture and tradeoffs.
- Include screenshots or demo links.
- Add setup instructions.
- Add limitations and next steps.

Evidence:

- One project that can be shown to a mentor, client, or employer.
