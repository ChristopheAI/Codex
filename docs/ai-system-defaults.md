# AI System Defaults

Use this when a project includes LLMs, agents, RAG, or AI-powered workflows.

The default is not "build an agent." The default is to choose the simplest
system that solves the business problem reliably.

## First Decision: Should This Use AI?

Use regular software first when a rule, database query, search index, or simple
form can solve the problem.

Use AI when the work needs judgment over messy language, extraction from
unstructured content, summarization, classification, semantic retrieval, or
reasoning across context.

Document why AI is needed in the spec. If the reason is vague, tighten the
problem before building.

## Pattern Choice

Choose the lightest pattern that fits.

| Pattern | Use When | Avoid When |
| --- | --- | --- |
| SDK call | One input, one output, no multi-step decision | The task needs state, branching, or tools |
| Workflow | The steps are known in advance and reliability matters | The path changes based on exploration |
| Agent | The system must decide what to do next | The flow can be drawn as a predictable pipeline |

Most production systems should be workflows with occasional agent-like
components, not open-ended agents everywhere.

## Structured Outputs

Use structured outputs whenever code consumes a model response.

Defaults:

- Define a schema before writing the prompt.
- Use clear field names.
- Use enums for constrained values.
- Make missing data explicit with optional fields.
- Add validation for business rules the schema cannot express.
- Keep schemas small enough that the model can follow them reliably.

Do not parse free-form prose when a schema would make the contract explicit.

## Tool Design

Tools are APIs for the model. Design them like APIs.

Defaults:

- One tool, one purpose.
- Clear description of when to use the tool.
- Typed and validated inputs.
- Structured return values.
- Errors returned as data the model can reason about.
- Logging for tool name, arguments, result status, latency, and failures.

Keep tool lists small. Too many choices make model behavior harder to predict.

## Human In The Loop

Require approval before risky actions.

Always gate:

- sending emails or messages
- writing to databases or external services
- modifying files outside the expected project scope
- running shell commands in user-controlled environments
- purchases, payments, account changes, or permission changes

Start strict. Relax only with explicit allowlists, audit logs, and evidence that
the pattern is safe.

## RAG Strategy

Start simple and add retrieval complexity only when there is evidence.

1. Direct context: if the content fits in the prompt, load it directly.
2. Document-oriented retrieval: if documents are coherent units, index document
   names and summaries, then read the full document.
3. Vector search: use embeddings when semantic similarity is needed across many
   chunks or documents.
4. Hybrid search: combine vector search with keyword search when exact terms,
   IDs, policy numbers, dates, or acronyms matter.
5. Agentic RAG: give the agent retrieval tools only when it must choose the
   retrieval strategy dynamically.

Production RAG should define:

- document source and refresh process
- chunking or document-read strategy
- retrieval method
- citations or source reporting
- no-answer behavior
- evaluation set for answer quality and retrieval relevance

## Query Routing

Do not send every query through retrieval by default.

Use intent classification when the system has a focused domain, off-topic
queries are common, or retrieval cost and latency matter.

Route before retrieval:

- domain question -> retrieval pipeline
- greeting -> direct response
- clarification -> ask a clarifying question
- off-topic -> boundary response

Use structured outputs for classification.

## Production Defaults

A production-minded AI app should define:

- environment-based configuration
- secret handling
- logging and structured traces
- health checks
- cost and latency tracking
- caching for expensive repeated operations
- graceful error behavior
- streaming strategy when response latency matters
- deployment target and smoke test

For chat systems, source citations and "I do not know" behavior matter more
than confident guesses.

## Evals And Observability

AI systems need both tests and evaluation.

Use three layers:

- Unit tests for structure, routing, tool behavior, and deterministic contracts.
- Manual evals for quality, tone, accuracy, usefulness, and safety.
- LLM-as-judge for scale, only after checking alignment with human ratings.

Trace each request through model calls, tool calls, retrieval, latency, token
usage, cost, and errors. Without traces, debugging AI behavior becomes guesswork.

Manual eval failures should become automated checks when possible.

## First AI Slice

The first AI slice should prove one useful behavior end to end.

Good first slices:

- one structured extraction
- one classified workflow path
- one tool-calling loop with a safe read-only tool
- one RAG question answered with citations
- one eval set running against a small golden dataset

Avoid starting with a fully autonomous agent, full UI, full deployment, and
complex retrieval all at once.
