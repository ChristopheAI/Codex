# Codex Implementation Loop

This is the default loop once a project brief, spec, and task are clear.

## Core Loop

```text
task -> think first -> implement -> verify -> self-review -> human/reviewer review -> commit
```

Codex is the execution layer. The workflow is the product discipline around it.

## Good Delegation

Before implementation, Codex should have:

- `AGENTS.md` with stack, commands, conventions, and constraints.
- `docs/project-brief.md` with product context and V1 scope.
- A spec when decisions, contracts, or failure behavior matter.
- A task with one outcome, acceptance criteria, and a verify command.
- A planning baseline commit containing the brief, specs, plan, and relevant
  project instructions.

If Codex has to guess, tighten the input before expanding the code.

Keep the artifacts honest:

- Requirements describe outcomes and user/business value.
- Specs describe the approach in this codebase.
- Tasks describe one reviewable outcome.

For small work, these can share one file or chat prompt. For work that matters,
keep the mental separation so the agent does not turn assumptions into code.

## Planning Baseline

Commit planning artifacts before the first implementation task.

This baseline should include:

- `docs/project-brief.md`
- the active spec or AI system spec
- the active task plan
- project-specific `AGENTS.md` updates

Then each implementation task can be reviewed against the committed source of
truth. Do not let the first code commit become the first durable record of the
project intent.

## Think First

Use a planning pause before code when the task:

- touches multiple files or systems
- has tradeoffs
- could be interpreted more than one way
- affects architecture, data shape, security, deployment, or agent behavior

Prompt:

```text
Read AGENTS.md, docs/project-brief.md, the active spec, and this task.
Tell me what you will change, what you will not touch, and how you will verify it.
Do not implement yet.
```

Skip this pause for tiny obvious changes or when the task is already fully
specified.

For larger tasks, split the generation inside the task as well. Ask Codex to
finish one runnable step, verify it, and then continue. A task can be scoped
correctly and still be too much for one generation.

## Verification

Every task needs a way for Codex to check its own work.

Use the strongest practical checks:

- tests for behavior and failure paths
- type checks or builds
- linting or formatting
- API checks with curl or HTTP clients
- browser checks for UI flows
- starter validation for this repo

For a real project, put the exact commands in `AGENTS.md` so every agent knows
how to prove work is correct.

For web apps, include a smoke check that starts the server, loads the main page,
and exercises the smallest useful API or UI path. For AI paths, include at
least one check that proves the model boundary, tool call, or safe fallback is
observable.

## Hooks

Instruction files are guidance. Hooks are guardrails.

Add hooks when a command must run automatically or an action must be blocked.
Useful defaults:

- Stop hook: run the relevant test or build command before the agent can finish.
- Pre-action hook: block force pushes, secret edits, or unsafe file writes.
- Post-action hook: format code after changes.
- External-action gate: force dry-run or human approval before sending,
  labeling, uploading, writing to production data, or deploying.

Keep hooks deterministic and project-specific. They should enforce the workflow,
not replace review.

## Review Layers

Use three layers for non-trivial agent work:

- Self-review: the implementing agent reviews its own diff before handing off.
- Automated review: CI or a review tool checks every pull request.
- Fresh review: you or a separate reviewer agent reads the diff without the
  implementer's context bias.

Review should check spec compliance, correctness, security, test quality, and
scope control.

Non-trivial work also gets spec review before execution. Check that the spec
surfaces decisions, invariants, file paths, and out-of-scope boundaries before
Codex writes code.

## Recovery

When Codex fails, first assume the input is too weak.

Use this recovery loop:

1. Stop the implementation loop.
2. Ask whether this is a spec problem, task-size problem, or environment issue.
3. Tighten the spec or task.
4. Add a reusable rule to `AGENTS.md` if the correction may recur.
5. Clear polluted context when needed and rerun with better input.

Do not keep feeding the same vague task back into the agent.

If the same class of mistake repeats, fix the template or `AGENTS.md`. If review
keeps missing issues, tighten the review checklist. If tasks keep sprawling,
tighten the planning template.

## Context Compression

Agent context should be compact and high-signal.

When instructions grow:

- merge duplicate rules
- remove preamble that does not change behavior
- keep exact commands, paths, and hard-earned edge cases
- prefer bullets for rule lists
- keep examples only when they clarify an edge case

Every word competes for the model's attention.

## Tools

Prefer tools in this order:

1. Existing project commands and CLIs.
2. Small project scripts when a check should be repeatable.
3. External MCPs or services only when the task genuinely needs them.

The goal is repeatable verification, not tool collection.

## Worktrees

Use Worktree mode for isolated implementation tasks, risky changes, or parallel
slices.

Use Local mode for supervised docs, templates, and starter-kit updates.

Only run tasks in parallel when they are independent, do not touch the same
files, and do not depend on an early foundation that is still changing.
