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

## Security And Data

- Are secrets avoided?
- Is user data handled carefully?
- Are permissions, auth, and validation appropriate?

## Maintainability

- Is the solution simpler than the problem?
- Does it follow existing project patterns?
- Can a future engineer understand the change?

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
