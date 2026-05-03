# Codex Desktop UI Map

Use this as a quick orientation map for the Codex Desktop app.

## Project Surface

A Codex project is a folder on your machine. Treat it as the unit of durable
work: source files, docs, templates, validation scripts, and Git history all
live there.

Use the project surface for:

- opening the active repo
- finding previous threads
- switching between local and worktree work
- accessing plugins, skills, automations, settings, and review surfaces

## Thread Surface

A thread is the working conversation for one task, investigation, review, or
slice.

Use one thread when:

- the task has one clear outcome
- the files and decisions are tightly coupled
- the work benefits from one continuous context

Start a fresh thread when:

- the old thread has too many abandoned branches
- compaction has blurred important details
- the next task can be explained cleanly from durable docs
- a fresh review should avoid implementer context bias

## Composer

The composer is where you steer Codex.

Common controls:

- `/` opens commands and skills.
- `@` mentions plugins, subagents, files, or references.
- `$` narrows intent toward skills.
- The model picker can change the model mid-thread.
- Reasoning effort changes latency, cost, and depth.
- The approval/permission control affects what Codex can do without asking.
- File drops add rich local context, but they also spend context window budget.

Good composer prompts include:

- the intended outcome
- relevant files or docs
- constraints and non-goals
- the expected output shape
- the verify command or manual check

## Terminal

The in-app terminal is a real shell rooted in the active project or worktree.

Use it for:

- running validation commands
- installing project dependencies
- inspecting Git state
- starting local dev servers
- checking generated artifacts

Terminal output becomes context. Keep commands focused and prefer exact checks
over noisy exploratory output.

## Review UI

Use review before accepting code or docs changes.

Check:

- expected files only
- no unrelated churn
- no hidden contract changes
- validation updated when workflow changed
- docs match actual behavior

For non-trivial changes, self-review first, then use a fresh reviewer or fresh
thread when possible.

## Browser Preview

Use browser preview for UI and deployed surfaces.

Check:

- page loads
- main workflow works
- text does not overlap
- assets render
- exported or generated outputs match expectations
- the live URL uses the intended backend or environment

Browser checks prove what static code review cannot.

## Settings And Product Surfaces

Settings and left-rail surfaces matter because they are part of the working
environment, not decorative UI.

Use them to inspect or configure:

- plugins
- skills
- MCP servers
- automations
- permissions
- app updates
- project-specific behavior

When a course or teammate says "use Codex," clarify which surface they mean:
thread, project, terminal, browser, review UI, plugin, skill, MCP, automation,
or worktree.
