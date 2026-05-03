# Codex Automations Playbook

Automations turn repeated Codex work into scheduled or delayed runs.

## When To Use Automation

Use automation when:

- the task repeats
- the timing matters
- the output shape is predictable
- Codex can complete without live back-and-forth
- permissions and context are available at runtime

Do not automate vague work.

## Thread Wakeup vs Project Automation

Use a thread wakeup when:

- the current conversation should resume later
- the delay is short
- the next action depends on this thread's context

Use a project automation when:

- the task should run independently
- the target repo or workspace is clear
- scheduled execution matters
- the automation should survive beyond this chat

## Automation Prompt Shape

An automation prompt should include:

- task
- scope
- inputs
- output format
- constraints
- what not to do
- what counts as a meaningful finding

Example:

```text
Review open GitHub issues. Group them into ready, blocked, unclear, and
candidate-parallel work. Recommend the next issue to work on. Do not implement,
close issues, or edit code. Report only meaningful findings or one clear next
action.
```

## Permission Checklist

Before relying on an automation, check:

- can Codex see the selected project?
- can it access required files?
- can it use the required plugin, app, MCP, or network resource?
- are credentials available in the automation environment?
- can it finish without approval back-and-forth?
- is the output shape testable?

## Good Automation Uses

- weekly issue triage
- stale branch or PR review
- recurring research brief
- scheduled project health check
- remind this thread to continue later
- monitor whether a known external event has happened

## Bad Automation Uses

- ambiguous product decisions
- production writes without review
- payments, auth, or secrets changes
- tasks requiring interactive approvals
- fragile browser flows with unclear success criteria
- anything where "no news" and "failed to check" look the same

## Test Before Trust

Before enabling a recurring automation:

1. Run the task once manually.
2. Inspect the output.
3. Tighten the prompt.
4. Confirm permissions.
5. Start with the smallest useful cadence.

Automation does not remove review. It moves the review to the output.
