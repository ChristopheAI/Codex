# Codex Primitives Chooser

Use this when deciding which Codex surface or capability fits a task.

## Missing-Piece Rule

Ask what is missing:

| Missing Piece | Reach First For |
| --- | --- |
| One-off answer or edit | Prompt |
| Repeatable procedure | Skill |
| Packaged capability | Plugin |
| Reliable external access | API, SDK, CLI, or MCP |
| Browser or desktop control | Computer Use |
| Independent side lane | Subagent |
| Isolated implementation workspace | Worktree |
| Remote async work | Cloud task |
| Scheduled repeated work | Automation |

Power is not the goal. Fit is the goal.

## Prompt

Use a prompt when:

- the task is one-off
- the output is small
- the risk is low
- no reusable process is needed

Example:

```text
Summarize this PDF into five project rules and three follow-up tasks.
```

## Skill

Use a skill when:

- the workflow repeats
- output shape matters
- house standards matter
- you want Codex to follow a procedure without re-explaining it

Example:

```text
Use the project-closeout skill to update handoff, run validation, and draft the
reflection.
```

## Plugin

Use a plugin when:

- someone has packaged the capability
- auth and integration are handled
- the workflow maps to a known app or service

Pattern:

```text
plugin for access, skill for procedure
```

## API, SDK, CLI, Or MCP

Use direct access when:

- reliable structured operations matter
- browser control would be brittle
- the task must be repeatable
- the system exposes a stable interface

Use MCP when Codex needs model-readable tools and schemas around that access.

## Computer Use

Use Computer Use when the screen is the tool:

- logged-in sites without clean APIs
- desktop apps
- visual UI bugs
- workflows that require browser/session state
- inspection of third-party dashboards

Stay present for credentials, payments, account settings, production data, and
other high-impact actions.

## Subagent

Use a subagent when work can run in parallel and return a bounded result.

Give every subagent:

- role
- scope
- output shape
- boundary

Keep one main thread responsible for integration.

## Worktree

Use a worktree when the task needs isolated files, dependencies, commands, or a
separate dev server.

Good for:

- independent features
- risky spikes
- parallel implementation tracks
- PR-sized work

Avoid worktrees when the product direction or foundational files are still
changing quickly.

## Cloud Task

Use a cloud task when remote async work is useful and review can happen later.

Prepare:

- repo and branch
- setup commands
- secrets or environment access
- verification command
- expected output
- review criteria

Do not assume cloud work has your local auth, servers, files, or state.

## Automation

Use automation when the same workflow should recur.

Good automation tasks:

- triage open issues weekly
- check stale PRs
- summarize project status
- run scheduled research
- remind the current thread to continue later

Every automation needs a clear output shape and permission story.
