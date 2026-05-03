# Codex Context And Compaction

Codex work depends on context quality. Long threads can be useful, but they also
accumulate stale decisions, tool output, and abandoned paths.

## Context Sources

Context comes from:

- user messages
- assistant replies
- files Codex reads
- terminal output
- browser or tool observations
- plugin, MCP, and app data
- `AGENTS.md`
- active skills
- handoff and validation docs

The more context you load, the more deliberate you must be about what should
survive.

## When To Continue The Same Thread

Continue the same thread when:

- the current task is still active
- the latest plan is still correct
- the important files are already in context
- the next action depends on recent tool output

## When To Compact

Compact when:

- the task is not done but the thread is long
- the plan is stable
- the important file paths, decisions, and checks can be summarized
- the remaining work is clear

Useful compaction instruction:

```text
Compact this thread, but preserve the goal, current plan, important file paths,
validation commands, latest git state, known gaps, and next recommended action.
Drop abandoned approaches and noisy tool output.
```

## When To Start Fresh

Start a fresh thread when:

- the previous thread mixed too many tasks
- the model is repeating stale assumptions
- the next task is independent
- you need an unbiased review
- the durable docs explain the continuation point better than chat memory

Fresh threads should begin with:

```text
Read AGENTS.md, docs/session-handoff.md, docs/validation-protocol.md, and the
latest git log. Summarize the continuation point before changing files.
```

## Handoff Before Context Loss

Before ending a meaningful session or changing scope, update
`docs/session-handoff.md` with:

- latest meaningful commit
- validation result
- known gaps
- next recommended action

Chat memory is temporary. Repository context is durable.

## Voice And Rich Prompts

Voice can help when the task needs background, nuance, or constraints.

Use voice for:

- explaining why the task matters
- listing edge cases
- narrating desired workflow
- giving examples of good and bad outputs

Slow down and type when:

- exact commands matter
- file paths must be precise
- acceptance criteria are contractual
- secrets, credentials, or destructive actions are involved
