# Codex App Workflow

This starter kit is designed to work well in the Codex desktop app.

## Local Mode

Use Local mode when the task should happen directly in the current checkout.

Good for:

- editing templates
- updating docs
- small fixes
- reviewing the starter kit itself

Local mode is supervised. Keep the scope small and inspect the diff before
committing.

## Worktree Mode

Use Worktree mode when Codex should work in isolation.

Good for:

- implementing a feature
- trying a risky approach
- running multiple tasks in parallel
- building a project slice while keeping `main` clean

The review loop is:

```text
brief -> spec -> task -> think first -> implement -> verify -> review -> commit
```

Only run multiple worktrees in parallel when the tasks are independent, do not
touch the same files, and do not depend on an early foundation that is still
changing.

## First Prompt For A New Project

```text
Read AGENTS.md and docs/project-brief.md.
Summarize the product, V1 scope, and first build slice.
Tell me whether the first slice needs a spec before implementation.
Do not write code yet.
```

This keeps Codex in engineering mode instead of jumping straight to generation.

## Think-First Prompt For A Task

Use this before implementation when a task touches multiple files, has
tradeoffs, or could be interpreted in more than one way.

```text
Read AGENTS.md, docs/project-brief.md, the active spec, and the current task.
Tell me what you will change, what you will not touch, and how you will verify it.
Do not implement yet.
```

## Review Prompt

```text
Review the current diff against docs/project-brief.md and the active spec.
Focus on correctness, scope creep, missing tests, error behavior, and hidden
contract changes. Findings first.
```

Use fresh review for non-trivial work. The implementing agent should self-review
first, then a human or separate reviewer agent should review the diff with less
context bias.

## Verification Commands

Every project should list its real verification commands in `AGENTS.md`.

For this starter kit:

```bash
sh scripts/validate-starter.sh
git diff --check
```

## Expansion Rule

Do not expand the project until the first slice is verified.

After each slice:

1. Check the behavior.
2. Review the diff.
3. Update the plan.
4. Decide the next smallest useful slice.
