# Learning Intake

Use this when reading Skool, Owain material, course notes, project retros, or
Codex feedback.

The goal is not to collect notes. The goal is to decide whether an insight
should improve the starter kit.

## Five Reinforcement Tracks

Classify each useful insight into exactly one primary track.

### 1. SOP

Use when the insight changes the default project workflow.

Possible outputs:

- update `docs/ai-project-sop.md`
- update `docs/new-project.md`
- update `docs/implementation-loop.md`

Examples:

- specs must separate requirements from design
- fuzzy ideas should trigger an interview before planning
- deployment work should be specified, reviewed, and smoke tested like code

### 2. Templates

Use when the insight changes what a future project should ask or record.

Possible outputs:

- update `templates/project-brief.md`
- update `templates/spec.md`
- update `templates/ai-system-spec.md`
- update `templates/plan.md`
- update `templates/task.md`
- update `templates/project-agents.md`

Examples:

- AI projects need no-answer behavior, eval examples, and observability
- acceptance criteria should describe outcomes, not implementation steps
- task context should be self-contained

### 3. Production Readiness

Use when the insight affects deployment, operations, security, cost, or
reliability.

Possible outputs:

- update `templates/project-production-checklist.md`
- update `templates/project-verify-production.mjs`
- update `docs/project-control-plane.md`
- add a deployment or operations pattern under `docs/patterns/`

Examples:

- per-client billing should be known before deployment
- Cloud Run jobs need manual execution before scheduling
- monitoring, logging, alerting, and CI are part of the AI system, not polish

### 4. Smoke Tests

Use when the insight should become a repeatable proof command.

Possible outputs:

- update `scripts/validate-starter.sh`
- update `scripts/smoke-new-project.sh`
- add a new smoke test script
- update `docs/validation-protocol.md`

Examples:

- new-project bootstrap should be tested end to end
- handoff/resume should be tested from repository files only
- production verification should fail or skip honestly when not configured

### 5. Feedback Loop

Use when the insight comes from a correction, repeated friction, or Codex
answering "what would have made this easier?"

Possible outputs:

- add a project-specific rule to `AGENTS.md`
- update a starter template if the rule will repeat across projects
- add a reflection item
- add or tighten a verification command

Examples:

- Codex needed exact file paths before implementation
- a task was too broad and should have been split
- the same review finding appeared twice

## Intake Procedure

For each insight:

1. Write the insight in one sentence.
2. Pick one primary reinforcement track.
3. Decide the smallest durable change.
4. Make the change only if it affects future behavior.
5. Verify with the relevant command.

Default verification for this repo:

```bash
sh scripts/validate-starter.sh
sh scripts/smoke-new-project.sh
git diff --check
```

## Promotion Rules

Promote an insight when at least one is true:

- it prevents a mistake likely to repeat
- it changes how a project should start, build, verify, review, or ship
- it improves a template a future Codex thread will read
- it creates a stronger proof command
- it turns fuzzy advice into an operational rule

Do not promote an insight when:

- it is interesting but does not change behavior
- it duplicates an existing rule
- it is specific to one transient tool without a durable workflow lesson
- it would make `AGENTS.md` or the SOP longer without making Codex more reliable

## AI Engineer Maturity Ladder

Use this ladder to place course and project learnings.

```text
fundamentals
  -> workflows and agents
  -> RAG
  -> production RAG
  -> evals and monitoring
  -> production operations
```

Do not jump to a later layer until the earlier layer has a working proof path.

For a new AI project, this usually means:

- prove one structured model call before building an agent
- prove one known workflow before adding autonomy
- prove retrieval quality before building a production RAG agent
- prove evals and traces before trusting production behavior
- prove production smoke checks before expanding usage

## Intake Prompt

Use this prompt after reading Skool, a course lesson, a DM, a project failure,
or Codex feedback:

```text
Read docs/learning-intake.md and the relevant source note.

Classify the insight into one reinforcement track:
SOP, templates, production readiness, smoke tests, or feedback loop.

Then decide the smallest durable starter-kit change. If the insight does not
change future behavior, say so and do not edit files.
```
