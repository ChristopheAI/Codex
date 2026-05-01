# AI System Spec: <name>

Use this alongside `templates/spec.md` when the feature depends on LLMs,
agents, RAG, or AI-powered workflows.

## Business Problem

What business or user problem requires AI judgment?

## Why AI

Why is a rule, database query, form, or regular search not enough?

## Pattern Decision

Choose one:

- SDK call
- Workflow
- Agent
- RAG
- Hybrid system

Reason:

## Inputs

- User input:
- System/context input:
- Files or documents:
- External data:

## Output Contract

What must the system return?

Schema or response shape:

```text
<schema>
```

## Model And Prompting

- Model:
- Temperature or determinism setting:
- Prompt template location:
- System instructions:
- Prompt variables:
- Static context:
- Dynamic context:
- Conversation history strategy:
- Delimiters or few-shot examples:
- Refusal or boundary behavior:

## Workflow Or Agent Loop

If workflow:

- Step 1:
- Step 2:
- Step 3:
- Branching:
- Failure behavior:

If agent:

- Goal:
- Tools:
- Max iterations:
- Exit condition:
- Cost or token budget:
- Logging:

## Tools And Actions

For each tool:

- Name:
- Purpose:
- Inputs:
- Validation:
- Return shape:
- Error return:
- Requires human approval?:

## Retrieval Or Context

Use only if the system needs external knowledge.

- Knowledge source:
- Context fits in prompt?:
- Retrieval strategy:
- Document-oriented retrieval possible?:
- Chunking strategy:
- Hybrid search needed?:
- Reranking needed?:
- Query routing:
- Citation/source behavior:
- No-answer behavior:
- Refresh/update process:

## Safety And Data

- User data handled:
- Sensitive data:
- Prompt-injection risks:
- External writes or transmissions:
- Human approval points:
- Dry-run behavior:
- Audit/logging needs:

## Evals And Observability

- Unit tests:
- Manual eval examples:
- Manual eval criteria:
- LLM-as-judge criteria:
- Human/judge alignment target:
- Trace fields:
- Cost/latency metrics:
- Health checks:
- Smoke checks:

## Verification

Concrete commands or checks:

```bash
<command>
```

## Out Of Scope

What this AI system will not do yet.
