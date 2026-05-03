# Codex Skills Playbook

Skills turn repeatable workflows into reusable instructions.

## When To Create A Skill

Create a skill when:

- the same procedure repeats
- the output shape should be consistent
- Codex keeps needing the same correction
- a workflow combines tools, files, and judgment
- the steps are stable enough to reuse

Do not create a skill for one-off work.

## Skill Anatomy

A skill usually has:

- `SKILL.md`: trigger metadata and workflow instructions
- `scripts/`: executable helpers
- `references/`: longer docs loaded only when needed
- `assets/`: templates, images, fixtures, or examples

Keep the always-loaded trigger description precise. That description determines
when Codex reaches for the skill.

## Good Skill Shape

A good skill has:

- one clear trigger
- one primary workflow
- one expected output shape
- explicit validation or review steps
- boundaries for what it should not do

Bad skill shape:

- broad trigger
- hidden product logic
- no output contract
- no validation step
- tries to replace a real app

## Progressive Disclosure

Keep the main `SKILL.md` compact. Put long examples, API details, and reference
material in subfolders so Codex loads them only when needed.

This keeps agent-facing context small while preserving deeper guidance.

## Skill vs `AGENTS.md`

Use `AGENTS.md` for stable project constraints:

- repo purpose
- workflow rules
- verification commands
- safety rules
- durable conventions

Use skills for repeatable procedures:

- inbox triage
- project closeout
- document generation
- research synthesis
- companion data updates

Constraints load every session. Skills load when the workflow is relevant.

## Skill On Top Of Access

Access and workflow are different layers.

Examples:

- Plugin provides Gmail access; skill defines the reply style and triage rules.
- MCP exposes a knowledge base; skill defines summary format and source checks.
- CLI updates an app database; skill validates input and runs browser checks.

Durable pattern:

```text
cleanest access layer + skill procedure + validation
```

## Companion Skill Pattern

Use a companion skill when an app owns visual review or durable state, but Codex
can prepare structured updates.

Pattern:

```text
source material -> skill produces structured data -> app displays it
-> browser review catches visual/product issues
```

Rules:

- app owns visual judgment
- skill owns repeatable intake and transformation
- writes should target the right environment explicitly
- browser verification follows data updates

Avoid turning the skill into a hidden second app.

## Skill Validation

Before trusting a skill:

- run it on a small example
- inspect generated files or output
- verify the expected command or browser flow
- check failure behavior
- tighten trigger text if it fires too broadly

Repeated corrections should become skill edits or `AGENTS.md` rules.
