# AI Project SOP

Use this standard operating procedure when starting a new AI or software
project with Codex App.

The purpose is consistency. A project should begin with clear intent, durable
context, a small first slice, and a validation path before Codex writes
implementation code.

## Operating Principle

Codex works best when the project has a small control plane:

- `AGENTS.md`: what the agent must know every session.
- `docs/project-brief.md`: what the project is for.
- `docs/session-handoff.md`: where the next thread should continue.
- `scripts/validate.sh`: the local proof command.
- `scripts/project-status.mjs`: the state summary.
- `docs/ops/production-checklist.md`: production posture and risks.

Do not rely on chat history as the project source of truth.

When an outside lesson should change future behavior, route it through
`docs/learning-intake.md` before expanding the SOP or templates.

## Required Inputs

Before implementation, define:

- Project name
- One-line purpose
- Primary user
- V1 outcome
- In-scope work
- Out-of-scope work
- Success criteria
- Proposed stack
- First build slice
- Verification command or manual check

If the project uses LLMs, RAG, tools, workflows, or agents, also define:

- Why AI is needed
- The simplest useful AI pattern
- Model/provider assumptions
- Structured output contracts, if code consumes model output
- Tool boundaries and approval gates
- No-answer or fallback behavior
- Evaluation examples
- Observability needs

Use `docs/ai-system-defaults.md` and `templates/ai-system-spec.md` for those
decisions.

## Standard Defaults

Use these defaults unless the project brief gives a reason to diverge:

- Start with a filled project brief.
- Keep `AGENTS.md` compact and project-specific.
- Create a spec when behavior, architecture, data shape, deployment, security,
  or failure handling has decisions worth reviewing.
- Create a plan when work needs more than one reviewable task.
- Keep each task to one outcome, no more than three acceptance criteria, a
  concrete verify command, and explicit out-of-scope boundaries.
- Write acceptance criteria as outcomes, not implementation steps.
- Commit planning artifacts before the first implementation task.
- Verify with the strongest practical local checks.
- Update `docs/session-handoff.md` after durable project commits.
- Use dry-run or human approval before external writes.

## Procedure

### 1. Create The Project Control Plane

Run the starter script:

```bash
sh scripts/new-project.sh
```

This creates the default project files, including:

- `docs/project-brief.md`
- `AGENTS.md`
- `docs/session-handoff.md`
- `docs/ops/production-checklist.md`
- `scripts/project-status.mjs`
- `scripts/validate.sh`
- `scripts/verify-production.mjs`
- `.github/workflows/ci.yml`
- `.gitignore`

### 2. Fill The Project Brief

Complete `docs/project-brief.md` before coding.

The brief must explain what is being built, who it is for, what V1 means, what
is out of scope, and how the first slice will be verified.

If the idea is fuzzy, let Codex interview you before writing the brief. The
agent should ask about users, scope, success criteria, constraints, risks, and
failure behavior until the brief can be written without guessing.

### 3. Adapt AGENTS.md

Replace generic instructions with project-specific truth:

- purpose
- stack
- source-of-truth docs
- commands
- current constraints
- security rules
- out-of-scope boundaries

Keep it short enough to read at the start of every session.

### 4. Decide The Spec Level

Use the lightest useful process:

- Tiny obvious change: no spec.
- Bugfix: short debugging notes or a focused task.
- Small feature: brief plus task or short spec.
- Medium feature: spec plus task plan.
- New AI application: project brief, AI system spec, and task plan.

Use `templates/spec.md` for product or architecture decisions.
Use `templates/ai-system-spec.md` for model, prompt, retrieval, tool, workflow,
or agent decisions.

A useful spec separates two jobs:

- Requirements: the observable behavior, edge cases, constraints, and failure
  behavior.
- Design: the smallest set of technical decisions needed to satisfy those
  requirements in this codebase.

Every non-trivial spec should also include a testing strategy and explicit
out-of-scope boundaries.

### 5. Plan The First Slice

Use `templates/plan.md` when there are multiple steps.

Every task must have:

- one outcome
- three acceptance criteria or fewer
- one concrete verify command or manual check
- clear out-of-scope boundaries
- a natural commit boundary

Prefer a vertical slice that proves one useful behavior end to end.

### 6. Commit The Planning Baseline

Before implementation, commit the planning artifacts:

- project brief
- project-specific `AGENTS.md`
- active spec or AI system spec
- task plan
- validation script
- project status script
- production checklist, if relevant
- session handoff

Suggested commit message:

```text
docs: add project planning baseline
```

After committing, update `docs/session-handoff.md` with the actual baseline
commit, validation result, known gaps, and next recommended action.

### 7. Build One Task At A Time

For each implementation task:

1. Read the task, spec, project brief, and `AGENTS.md`.
2. Inspect the relevant code before deciding the implementation.
3. Think first when the task touches multiple files, has tradeoffs, or could be
   interpreted more than one way.
4. Make the smallest change that satisfies the task.
5. Run the task's verify command.
6. Self-review the diff.
7. Fix issues found during review.
8. Commit the task when it is independently reviewable.
9. Update `docs/session-handoff.md` before expanding scope.

If the agent goes in circles, scope creeps, or keeps making the same mistake,
stop and improve the spec, task, or `AGENTS.md`. Do not keep retrying the same
weak input.

### 8. Verify And Review

Default local checks:

```bash
node scripts/project-status.mjs
sh scripts/validate.sh
```

Add stronger checks as the project matures:

- unit tests
- API smoke tests
- browser smoke tests
- database migration checks
- AI eval examples
- tool-call boundary checks
- production verification checks

Generated code is not done when it looks plausible. It is done when the chosen
checks prove the intended behavior and the diff has been reviewed.

Treat deployment and infrastructure changes the same way as code: specify the
desired state, generate the config or commands, review for security and cost,
then run a smoke test. Do not blindly apply agent-generated infrastructure.

### 9. Ship Or Stop

At V1 closeout, decide explicitly:

- stop because V1 is complete
- polish because V1 works but quality gaps remain
- extend because a new scoped outcome is worth building

Update `docs/session-handoff.md` and create a reflection from
`templates/reflection.md`.

## Deviation Policy

Deviate from this SOP only when:

- the project has a hard requirement
- the simpler path cannot satisfy the outcome
- cost, security, privacy, or reliability demands a different approach
- the user explicitly chooses speed over process for a throwaway experiment

Record important deviations in the spec, handoff, or an ADR-style note. Include
what changed, why, the extra operational burden, and whether the deviation is
temporary.

## Agent Prompt Template

Use this when asking Codex to start a new project:

```text
Read AGENTS.md, docs/ai-project-sop.md, docs/new-project.md,
docs/ai-system-defaults.md, and templates/project-brief.md.

Help me start a new project using the starter-kit workflow.

First, create or fill docs/project-brief.md. Do not implement until the brief is
clear. If this project uses LLMs, RAG, tools, workflows, or agents, create an AI
system spec using templates/ai-system-spec.md before implementation.

Then create a small task plan with one reviewable first slice, a concrete
verification command, and explicit out-of-scope boundaries.
```

## Acceptance Checklist

A new project is ready for implementation when:

- `docs/project-brief.md` is filled.
- `AGENTS.md` is project-specific.
- The first slice is small and reviewable.
- A spec exists if decisions need review.
- An AI system spec exists if the project uses AI behavior.
- `scripts/validate.sh` has the strongest practical initial checks.
- `docs/session-handoff.md` records the continuation point.
- Planning artifacts are committed as the baseline.
- Codex has a clear first task with a verify command.
