# Owain Lewis Operating Model

This note captures workflow patterns to learn from Owain Lewis and adapt into
this repository as reusable project-starting defaults.

## Core Idea

Owain's material is not about memorizing one AI coding tool. The deeper lesson
is to use AI agents inside a professional software development lifecycle.

The agent writes code, but the engineer owns:

- problem framing
- architecture decisions
- task boundaries
- verification
- review
- deployment safety
- production quality

## The Workflow

```text
project brief
  -> task or ticket
  -> spec when decisions matter
  -> small implementation task
  -> tests and runtime checks
  -> code review
  -> commit or PR
  -> deployment
  -> monitoring and reflection
```

## Artifact Boundaries

Keep the jobs separate, even when the workflow stays lightweight:

- Requirement or ticket: what should be true and why it matters.
- Spec: how this change should fit the current codebase.
- Plan: ordered slices that can be implemented, reviewed, and rolled back.
- Task: one outcome with acceptance criteria and a concrete verify command.

Do not pre-decide technical design in the ticket when the codebase should shape
that decision. Do not let the spec become a permanent parallel source of truth.
Once the code is right, carry durable reasoning in commit messages, PR
descriptions, ADRs, or handoff notes.

## What To Copy

### 1. Blueprint-Style Skills

Owain's `blueprint` repo encodes the software lifecycle as reusable agent
skills:

- plan
- spec
- build
- tdd
- review
- refactor
- coverage
- debug
- compress
- commit

The lesson is not the exact files. The lesson is to make the process reusable.

### 2. Compact Agent Context

Use `AGENTS.md` for context the agent cannot infer:

- purpose of the repo
- workflow rules
- important conventions
- where durable docs live
- verification expectations

Avoid duplicating commands or dependency information that already exists in
source files.

### 3. Small Reviewable Tasks

Do not ask an agent to "build the whole app" unless the app is tiny. Break work
into tasks that can be executed, reviewed, and rolled back independently.

### 4. Verification Before Trust

AI-generated code is not done when it compiles in the conversation. It is done
when the relevant checks pass and the diff has been reviewed.

### 5. Context-Isolated Review

For serious work, review should happen with fresh context where possible. A
model that just wrote the code can be biased toward accepting its own choices.

Review has two moments:

- spec review before execution
- output review after execution

The output review checks whether the diff matches the task, preserves
invariants, avoids hidden technical decisions, and passes meaningful tests.

### 6. Agent Automation

The long-term direction is an agent worker loop:

```text
ticket -> claim -> worktree -> agent -> hooks -> tests -> review -> PR
```

This is advanced. The foundation is still good task shape and verification.

### 7. Production AI Defaults

AI projects need more than working prompts. They need prompt templates,
structured outputs, context management, tool validation, evals, observability,
and safe external-action paths.

For retrieval systems, start simple:

```text
file loading -> document-oriented retrieval -> vector search -> hybrid search
-> reranking -> agentic RAG
```

Add complexity only when the simpler level is insufficient.

### 8. Compact Context

Long instructions degrade agent focus. Keep `AGENTS.md`, specs, and task files
short enough that every sentence earns its place. Repeated mistakes become
rules; repeated rules should be compressed.

## Sources To Study

- https://github.com/owainlewis/blueprint
- https://github.com/owainlewis/youtube-tutorials
- https://github.com/owainlewis/agent-worker
- https://github.com/owainlewis/pi-extensions
- https://github.com/owainlewis/neo
- https://www.youtube.com/@owainlewis

## Adaptation For This Repo

This repository should become the reusable starter-kit version of that
operating model:

- `AGENTS.md` defines how Codex works here.
- `templates/` contains reusable project-starting inputs.
- `docs/` captures stable project workflow.
- `learnings/` turns consumed material into starter-kit improvements.
- `projects/` proves the workflow through shipped systems.
