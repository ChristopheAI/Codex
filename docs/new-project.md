# Starting A New Project

This is the exact first workflow for any new project created from this starter
kit.

## Rule

Do not start with code.

Start with the project brief.

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
- what commands verify the work
- what is out of scope

Keep it short. Reference source files instead of duplicating them.

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

## Step 5: Commit The Planning Baseline

Before implementation, commit the planning artifacts that define the work.

At minimum, commit:

- `docs/project-brief.md`
- the active spec, if one exists
- `docs/ai-system-spec.md`, if the project uses AI
- the active task plan
- project-specific `AGENTS.md` updates

Suggested commit message:

```text
docs: add project planning baseline
```

This keeps the source of truth in Git before the first code commit. A Task 1
implementation commit should never be the first durable record of what the
project is supposed to do.

## Step 6: Build With Codex

Only now should Codex start implementing.

Good first prompt:

```text
Read docs/project-brief.md and AGENTS.md.
Create a spec for the first build slice if decisions need to be surfaced.
Otherwise create a small task plan for the first vertical slice.
Do not implement yet.
```

Then review the plan before building.

## Step 7: Verify And Review

Before accepting the work:

- run the relevant checks
- let the implementing agent self-review the diff
- review the diff
- compare against the project brief
- update docs or templates if the workflow learned something useful

Run the starter validation:

```bash
sh scripts/validate-starter.sh
```

For non-trivial work, use the loop in
`docs/implementation-loop.md`: task, think first, implement, verify, review,
commit.

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
