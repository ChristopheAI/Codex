# Project Brief: Support FAQ RAG

## One-Line Purpose

A small support chatbot that answers customer questions from a company's FAQ
documents.

## Problem

Customers ask repeated support questions, and the business wants a reliable
way to answer from approved source documents instead of hallucinated general
knowledge.

## User

Small business owner or support operator who wants a simple internal support
assistant.

## Outcome

V1 lets a user upload or seed FAQ documents, ask a question, and receive an
answer with source references.

## Scope

In scope:

- Seed a small set of markdown FAQ documents.
- Store document chunks.
- Retrieve relevant chunks for a question.
- Generate an answer grounded in retrieved content.
- Return source snippets.

Out of scope:

- Multi-user auth.
- Admin dashboard.
- Production billing.
- Complex document formats.
- Automated web crawling.

## Success Criteria

- A user can ask a question and receive an answer based on seeded FAQ content.
- The response includes at least one source for grounded answers.
- If no relevant source exists, the system says it does not know.

## Proposed Stack

- App/runtime: Python FastAPI
- Database/storage: SQLite for V1, PostgreSQL later
- AI/model layer: OpenAI embeddings and chat completions
- Deployment: Local first, Cloud Run later

## Key Decisions

- Decision: Start with seeded markdown files.
  Reason: It keeps V1 focused on retrieval and answer quality.

- Decision: Return sources in every grounded answer.
  Reason: The user needs trust and inspectability.

## Risks

- Risk: The model may answer without enough support.
  Mitigation: Add a no-relevant-information response path.

- Risk: Retrieval quality may be poor with small documents.
  Mitigation: Keep test questions tied to known FAQ snippets.

## First Build Slice

Build a local CLI or API endpoint that loads seeded FAQ text, retrieves relevant
chunks for one question, and returns an answer with sources.

## Verification

Ask "What is the refund policy?" and confirm the answer cites the refund FAQ.
Ask an unrelated question and confirm the system says it does not know.
