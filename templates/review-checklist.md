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

## Decision

- Accept
- Request changes
- Split into smaller work
- Revisit the spec
