# Owain Skool Gap Extraction

Date: 2026-05-01

This is a synthesis of Owain Lewis's AI Engineer Skool material into starter-kit
improvements. It is not a transcript or course copy. The goal is to turn missed
lessons into durable defaults for new Codex projects.

## Main Correction

The starter kit already captured the high-level lifecycle, but it was still too
light on production AI engineering details.

The missing emphasis is:

- requirements, specs, tickets, and plans have different jobs
- verification must be stacked, not only "run tests"
- AI systems need evals, traces, and production hardening from the start
- RAG should start with the simplest retrieval shape that works
- external actions need dry-run and human approval paths
- repeated mistakes should change templates, not just the current task

## Workflow Gaps

Owain's workflow separates these concerns:

- Ticket or requirement: what should be true and why it matters.
- Spec: how this change fits the current codebase.
- Plan: ordered, small, reviewable slices.
- Task: one outcome with acceptance criteria and a verify command.
- Review: checks judgment, not just test results.

The starter kit should keep this separation clear even when the artifacts live
in one file for small projects.

## Spec Gaps

Specs should stay short. If a spec grows long, split the feature.

A good spec should:

- separate requirements from design decisions
- include explicit out-of-scope boundaries
- reference real files and patterns in the current codebase
- surface assumptions before code exists
- make technical decisions visible with short reasons
- list invariants that must not break
- define a concrete testing strategy, not just "write tests"

The agent can structure messy input, but the human decides scope.

## Task Gaps

Tasks should be sized against three limits:

- the agent can execute the task reliably
- review can catch problems in the diff
- rollback/debugging stays cheap

Even inside one task, prefer smaller sequential steps that each end in a
runnable state. A task can be correctly scoped and still too much for one
generation.

## Review Gaps

For non-trivial work, use two review moments:

- spec review before execution
- output review after execution

Output review should check for technical decisions that appeared in code but
were not in the spec, broken invariants, scope creep, security issues, and test
theatre.

Fresh reviewer context matters. The implementing agent has context bias.

## Hooks And Verification Gaps

Instruction files are suggestions; hooks are guardrails.

Useful hook ideas:

- stop hook that runs the project validation command
- pre-action hook that blocks force push and secret file writes
- formatting hook after edits

Verification should stack several signals when practical:

- unit tests
- type/build checks
- lint/format checks
- curl/API checks
- browser smoke checks
- health checks
- logs/traces review for AI paths

## AI System Gaps

AI engineering is applied software engineering around unreliable models.

Defaults to add:

- prompt templates should be versioned and testable
- context should be managed deliberately: static instructions, dynamic context,
  retrieved content, and conversation history are different inputs
- structured outputs should be used whenever code consumes model output
- unit tests check structure and constraints, not prose equality
- manual evals judge quality, accuracy, tone, safety, and usefulness
- LLM-as-judge only becomes trusted after human alignment checks
- traces should capture model calls, tool calls, retrieval, latency, tokens,
  cost, errors, inputs, and outputs where safe

## RAG Gaps

Start with the least complex retrieval strategy:

1. load the full file when the corpus fits in context
2. use document-oriented retrieval when documents are coherent units
3. use vector search when many chunks need semantic lookup
4. use hybrid search when exact terms, IDs, dates, and acronyms matter
5. add reranking only when retrieval quality needs the extra cost/latency
6. use agentic RAG only when retrieval strategy must be chosen dynamically

Chunking is a tradeoff, not a requirement. If a document is meant to be read
whole, let the agent find it and read it whole.

## Production Gaps

A working local AI app is not production-ready until it has:

- environment-based config
- secret handling
- connection pooling when databases are used
- caching for expensive embedding/model calls
- graceful error behavior
- health checks
- structured logging and traces
- CORS and deployment config when a web app has separate frontend/backend
- smoke tests for served UI and API endpoints
- deployment review for Docker, CI/CD, and infrastructure

## External Action Gaps

For external writes, use dry-run first.

Examples:

- classify emails before applying labels
- draft replies before sending
- preview database changes before writing
- run deployment checks before promoting

The model proposes. The human approves risky actions.

## Context Compression Gap

Agent instructions should be compact. Every repeated rule competes for model
attention.

When an instruction grows, compress it:

- merge overlapping rules
- remove repeated preamble
- keep paths, exact commands, and hard-earned edge cases
- prefer bullets for rule lists
- keep only examples that clarify a real edge case

## Concrete Starter Kit Changes

This extraction should change future defaults by updating:

- `docs/ai-system-defaults.md`
- `docs/implementation-loop.md`
- `docs/owain-operating-model.md`
- `templates/spec.md`
- `templates/ai-system-spec.md`
- `templates/review-checklist.md`

