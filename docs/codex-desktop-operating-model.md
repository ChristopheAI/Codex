# Codex Desktop Operating Model

## Purpose

Translate the five-part Codex Desktop course into the Maximize Codex workflow.

This document is the bridge between the starter-kit lifecycle and the actual
Codex app surface. The goal is not to collect course notes. The goal is to make
Codex Desktop easier to use as a disciplined project workspace.

## The Merge

Maximize Codex provides the lifecycle:

```text
brief -> spec -> plan -> baseline commit -> build -> test -> review -> ship -> reflect
```

Codex Desktop provides the execution surface:

```text
projects -> threads -> terminal -> plugins -> skills -> MCPs -> subagents
-> worktrees -> automations -> browser previews -> review UI
```

Together they form the working model:

```text
clear project intent -> right Codex surface -> small verifiable task
-> inspected diff -> shipped outcome -> durable handoff
```

## Five-Part Map

1. Foundations
   Make Codex legible: projects, threads, settings, terminal, context windows,
   compaction, and voice-driven steering.

2. Local Agent Basics
   Make Codex useful without making it reckless: permissions, guardrails,
   `AGENTS.md`, terminal basics, plugins, computer use, skills, MCPs, and
   subagents.

3. Interface Choice
   Choose the smallest surface that fits the missing piece: prompt, skill,
   plugin, API, MCP, computer use, subagent, worktree, cloud task, or
   automation.

4. Plan To Work Queue
   Convert project intent into durable, reviewable units: specs, tasks, GitHub
   issues, worktrees, automations, and stack constraints.

5. Build And Ship
   Build a real vertical slice, verify it locally, review the diff, deploy it,
   smoke test the live surface, and capture follow-up hardening work.

## Decision Ladder

Reach for the lightest useful layer:

```text
prompt -> skill -> subagent -> worktree thread -> cloud task -> automation
```

Use a prompt when the work is one-off and low risk.

Use a skill when the procedure repeats or has house standards.

Use a subagent when there are independent side lanes that can run in parallel
and return concise results to the main thread.

Use a worktree thread when the implementation needs isolated files, commands,
dependencies, or a separate dev-server context.

Use a cloud task when remote asynchronous work is useful and the result can be
reviewed later.

Use an automation when the same check or workflow should run on a schedule.

## Access vs Workflow

Keep access and workflow separate:

| Layer | Examples | Job |
| --- | --- | --- |
| Access | API, SDK, CLI, MCP, plugin, computer use | Reach the system |
| Workflow | `AGENTS.md`, skill, template, checklist, task plan | Do the job the right way |

Practical rule:

```text
plugin/API/MCP/computer use = access layer
skill/AGENTS.md/templates = workflow layer
```

The durable pattern is to choose the cleanest access layer, then encode the
repeatable procedure as a skill, project rule, or template.

## Project Rules

- Start with a filled project brief.
- Do not ask Codex to build before scope and success criteria are clear.
- Encode repeated corrections in `AGENTS.md`.
- Use specs when behavior, architecture, data shape, deployment, or failure
  handling has decisions worth reviewing.
- Use skills for repeatable procedures.
- Use plugins, APIs, MCPs, or computer use for access, not for project judgment.
- Use subagents only for independent side work with a clear return shape.
- Use worktrees for independent implementation lanes.
- Use browser verification for UI and deployed surfaces.
- Use automations for recurring checks and reminders.
- Use live smoke tests after deployment.
- Keep task slices small enough to verify, review, and roll back.

## Build Loop In Codex Desktop

Use this loop for non-trivial work:

```text
task -> think first -> implement -> verify -> self-review
-> fresh review -> commit -> handoff checkpoint
```

Codex Desktop supports the loop through:

- project instructions in `AGENTS.md`
- local terminal commands for verification
- browser previews for UI checks
- review UI for diffs
- worktrees for isolated implementation lanes
- automations for recurring follow-up
- session handoff files for durable continuation

## Shipping Checklist

Before calling an agent-built app shipped:

- The project brief and task outcome are still aligned.
- The diff was reviewed for correctness, scope creep, hidden contracts, and
  missing tests.
- The strongest practical verification command passed.
- UI flows were checked in a browser when relevant.
- The live URL was smoke tested after deployment when relevant.
- Follow-up production hardening was captured as tasks, not left as chat memory.
- `docs/session-handoff.md` records the latest meaningful checkpoint.

## Reflection

After each durable project commit, update `docs/session-handoff.md` with:

- the actual latest meaningful commit
- the validation result
- known gaps
- the next recommended action

Capture learnings only when they improve future behavior:

- update a template
- add or compress an `AGENTS.md` rule
- improve a validation command
- add a checklist item
- change project practice

## Related Docs

- `docs/codex-full-course-coverage.md`
- `docs/starter-kit.md`
- `docs/codex-app-workflow.md`
- `docs/implementation-loop.md`
- `docs/owain-operating-model.md`
- `docs/session-handoff.md`
- `docs/validation-protocol.md`
