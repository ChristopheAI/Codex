# Starting A New Project

This is the exact first workflow for any new project created from this starter
kit.

## Rule

Do not start with code.

Start with the project brief.

Use `docs/ai-project-sop.md` as the agent-readable standard operating
procedure for this workflow. It compresses the project brief, control plane,
spec, plan, validation, review, handoff, and closeout rules into one document
that Codex can read before starting a new project.

## Step 1: Create The Project Brief

Copy the template:

```bash
mkdir -p docs
cp templates/project-brief.md docs/project-brief.md
```

Or use the starter script:

```bash
sh scripts/new-project.sh
```

The starter script creates:

- `docs/project-brief.md`
- project-specific `AGENTS.md`
- `docs/session-handoff.md`
- `docs/ops/production-checklist.md`
- `scripts/project-status.mjs`
- `scripts/validate.sh`
- `scripts/verify-production.mjs`
- `.github/workflows/ci.yml`
- `.gitignore`

Then fill it in.

The brief should answer:

- What are we building?
- Who is it for?
- What problem does it solve?
- What is V1?
- What is out of scope?
- How will we know it works?

## Step 2: Adapt AGENTS.md

Update `AGENTS.md` so Codex knows the project-specific context:

- what the product does
- what stack is being used
- where the project brief lives
- `sh scripts/validate.sh` as the project validation command
- what is out of scope

Keep it short. Reference source files instead of duplicating them.

For resumability, keep the Project Control Plane files aligned:

- `AGENTS.md`
- `docs/session-handoff.md`
- `docs/ops/production-checklist.md`
- `scripts/project-status.mjs`

See `docs/project-control-plane.md` for the pattern.

## Step 3: Decide Whether A Spec Is Needed

Use `templates/spec.md` when the task includes decisions about:

- architecture
- API shape
- database or data model
- error behavior
- deployment
- security or privacy
- agent behavior

Skip the spec for tiny, obvious changes.

If the project uses LLMs, RAG, tool calling, workflows, or agents, also use
`templates/ai-system-spec.md`. Start from `docs/ai-system-defaults.md` and
choose the simplest pattern that solves the problem.

## Step 4: Plan The First Slice

Use `templates/plan.md` when the work needs multiple steps.

Prefer a small vertical slice over a layer-by-layer plan. A good first slice
can be built, run, reviewed, and improved.

Each task should have:

- one outcome
- three acceptance criteria or fewer
- a concrete verification command or manual check
- clear out-of-scope boundaries
- a natural commit boundary

Use `templates/task.md` when handing one task to Codex.

Before the first implementation task, edit `scripts/validate.sh` so it contains
the strongest practical checks for this project. Keep it simple at first, then
expand it as the project gains tests, API checks, UI smoke checks, evals, or
deployment checks.

If the project has production or will soon have production, also adapt
`scripts/verify-production.mjs` and `docs/ops/production-checklist.md`.
For Node projects, expose `node scripts/project-status.mjs` as `npm run status`.

Adapt `.github/workflows/ci.yml` once the stack is known. The default workflow
runs `sh scripts/validate.sh`; add Node, Python, browser, database, or service
setup before that validation step as needed.

## Step 5: Commit The Planning Baseline

Before implementation, commit the planning artifacts that define the work.

At minimum, commit:

- `docs/project-brief.md`
- the active spec, if one exists
- `docs/ai-system-spec.md`, if the project uses AI
- the active task plan
- project-specific `AGENTS.md` updates
- `docs/session-handoff.md`
- `docs/ops/production-checklist.md`
- control-plane scripts under `scripts/`
- `.github/workflows/ci.yml`

Suggested commit message:

```text
docs: add project planning baseline
```

This keeps the source of truth in Git before the first code commit. A Task 1
implementation commit should never be the first durable record of what the
project is supposed to do.

After this commit exists, update `docs/session-handoff.md` with the actual
planning baseline commit hash, validation result, known gaps, and next
recommended action. If that requires a tiny follow-up docs commit, keep it
limited to the handoff file.

Before continuing in a later thread, run:

```bash
node scripts/project-status.mjs
```

## Step 6: Build With Codex

Only now should Codex start implementing.

Good first prompt:

```text
Read AGENTS.md, docs/ai-project-sop.md, and docs/project-brief.md.
Create a spec for the first build slice if decisions need to be surfaced.
Otherwise create a small task plan for the first vertical slice.
Do not implement yet.
```

Then review the plan before building.

After each durable implementation commit, update `docs/session-handoff.md`
before starting another task. Record the actual meaningful commit hash, what
was validated, what remains risky or incomplete, and the next smallest action.
Handoff-only commits should not create an infinite loop; they exist to make the
previous meaningful checkpoint resumable.

## Step 7: Verify And Review

Before accepting the work:

- run `sh scripts/validate.sh`
- let the implementing agent self-review the diff
- review the diff
- compare against the project brief
- update docs or templates if the workflow learned something useful

For this starter-kit repo, run:

```bash
sh scripts/validate-starter.sh
```

For non-trivial work, use the loop in
`docs/implementation-loop.md`: task, think first, implement, verify, review,
commit.

V1 is not done until one project-local command proves the relevant behavior:

```bash
sh scripts/validate.sh
```

For a web app, that command should include a local server smoke check. For an
AI system, it should include at least one deterministic boundary check for tool
calls, fallback behavior, eval examples, or traces.

## Step 8: Close Out V1

When the brief and plan appear satisfied, stop and close the loop before adding
features.

Ask Codex to report:

- whether V1 scope is satisfied
- what validation proves it
- what residual gaps remain
- whether the project should stop, polish, or extend

Then update:

- `docs/session-handoff.md` with V1 status, latest commits, validation result,
  residual gaps, and closeout recommendation
- `docs/reflection.md` from `templates/reflection.md`

Do not treat polish as automatic. If V1 is complete and the project was a
workflow test, stopping is often the right move.

## Codex App Modes

Use Local mode for:

- editing the starter kit
- small supervised changes
- reviewing docs and templates

Use Worktree mode for:

- implementation tasks
- risky experiments
- parallel feature slices
- anything that should not touch the main checkout until reviewed
