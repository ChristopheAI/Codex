# Review Checklist

Use this before accepting AI-generated code.

## Scope

- Does the change solve the requested task?
- Did it stay within the requested scope?
- Did it introduce unrelated refactors or dependencies?

## Correctness

- Are edge cases handled?
- Are error paths explicit?
- Are contracts, schemas, or API shapes preserved?
- Are assumptions documented?

## Tests

- Are meaningful tests added or updated?
- Do the tests cover behavior rather than implementation trivia?
- Do the tests avoid test theatre and false confidence?
- Are important failure paths covered?
- Did the relevant checks pass?
- For AI behavior, are structural tests separated from quality evals?

## Security And Data

- Are secrets avoided?
- Is user data handled carefully?
- Are permissions, auth, and validation appropriate?
- Do external writes have dry-run or human approval where needed?

## Maintainability

- Is the solution simpler than the problem?
- Does it follow existing project patterns?
- Can a future engineer understand the change?
- Did the change add durable rules only where they will prevent repeated
  mistakes?

## AI System Quality

- Are prompts/templates versioned or easy to find?
- Is model output structured where code consumes it?
- Are tool inputs validated and errors returned as data?
- Is retrieval as simple as the problem allows?
- Are citations, no-answer behavior, and eval examples defined where relevant?
- Are logs/traces sufficient to debug model, tool, retrieval, latency, cost, and
  error behavior?

## Agent Workflow

- Did the implementing agent self-review the diff?
- Does a fresh reviewer need to check this before shipping?
- Should a repeated correction become an `AGENTS.md` rule?
- Should any verification step become a hook?

## Decision

- Accept
- Request changes
- Split into smaller work
- Revisit the spec
