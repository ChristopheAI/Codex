# Codex Full Course Coverage

## Purpose

Track how the 229-slide, five-part Codex Desktop course maps into this starter
kit.

This is not a transcript or replacement for the course. It is a coverage map:
what has been turned into durable project practice, what is only summarized, and
what still needs a starter-kit artifact.

## Coverage Status

- **Strong**: already present as reusable rules, templates, or validation.
- **Partial**: summarized or implied, but not yet operational enough.
- **Gap**: useful course material that is not yet represented in the docs.
- **External**: should be checked from current official docs instead of frozen
  in this repo.

## Course Map

| # | Course Section | Starter-Kit Coverage | Gap Or Next Artifact |
| --- | --- | --- | --- |
| 1 | What Codex Actually Is | **Partial** in `README.md` and `docs/codex-desktop-operating-model.md`: Codex as local collaborator, not autocomplete. | Add practical non-code use cases: PDF synthesis, folder cleanup, transcript-to-brief, spreadsheet/document workflows. |
| 2 | Pricing & Installing The Desktop App | **External**. Pricing, plans, availability, and install details change. | Add a short setup checklist that points to current official docs, without freezing price claims. |
| 3 | Desktop App Interface Tour | **Strong** in `docs/codex-desktop-ui-map.md` and `docs/codex-app-workflow.md`. | Keep examples current as the app surface changes. |
| 4 | Context Windows & Compaction | **Strong** in `docs/codex-context-compaction.md`, `docs/session-handoff.md`, `docs/validation-protocol.md`, and `docs/implementation-loop.md`. | Prove the compaction prompts in future long-running projects. |
| 5 | Voice: Wispr Flow + Dictation | **Partial** in `docs/codex-context-compaction.md`: voice as optional rich-prompt steering. | Keep tool-specific dictation setup external because products and shortcuts change. |
| 6 | Permissions, Guardrails & Terminal Basics | **Strong** in `docs/codex-permissions-guardrails.md`, `AGENTS.md`, `docs/implementation-loop.md`, and validation rules. | Add project-specific guardrails only when a real project needs them. |
| 7 | `AGENTS.md` | **Strong**. `AGENTS.md`, `docs/new-project.md`, and `docs/starter-kit.md` encode project instructions and starter-kit rules. | Keep compressing repeated rules; add examples only when they improve future projects. |
| 8 | The Five Practical Primitives | **Strong** in `docs/codex-primitives-chooser.md` and `docs/codex-desktop-operating-model.md`. | Add more examples only after real use reveals repeated confusion. |
| 9 | Plugins And The Plugin Directory | **Partial** in `docs/codex-primitives-chooser.md` and access-vs-workflow rules. | Add live plugin install/disconnect steps only if this becomes a hands-on training repo. |
| 10 | Computer Use | **Partial** in `docs/codex-primitives-chooser.md`, `docs/codex-desktop-ui-map.md`, and browser verification rules. | Keep platform-specific setup external and current. |
| 11 | Skills Deep Dive | **Strong** in `docs/codex-skills-playbook.md`. | Add concrete repo-skill examples when the starter kit grows its own skills. |
| 12 | Skill vs MCP | **Strong** in `docs/codex-desktop-operating-model.md`, `docs/codex-primitives-chooser.md`, and `docs/codex-skills-playbook.md`. | Add MCP-specific setup examples only when a project needs them. |
| 13 | Subagents | **Strong** in `docs/codex-primitives-chooser.md` and project rules. | Add examples after a project uses delegated side lanes. |
| 14 | When To Use What | **Strong** in `docs/codex-desktop-operating-model.md`: decision ladder and access-vs-workflow split. | Add examples for ambiguous choices: skill vs app, plugin vs computer use, automation vs cloud task. |
| 15 | Git & GitHub | **Strong** in `docs/implementation-loop.md`, `docs/validation-protocol.md`, and starter-kit commit rules. | Add beginner-facing Git review UI notes if this repo becomes a teaching artifact. |
| 16 | Decide What To Build | **Strong** in `docs/new-project.md`, `templates/project-brief.md`, `templates/spec.md`, and `templates/plan.md`. | Add optional ideation/brainstorm artifacts if product discovery becomes part of the starter kit. |
| 17 | Cloud Delegation | **Partial** in decision ladder. | Add cloud-delegation cautions: setup scripts, secrets, model/usage differences, returned diffs, and review expectations. |
| 18 | GitHub Issues | **Strong** in `templates/github-issue.md`, Owain-inspired task/ticket workflow, and existing task templates. | Add GitHub labels or issue state rules only when the repo actively uses GitHub issues. |
| 19 | Automations | **Strong** in `docs/codex-automations-playbook.md` and operating model. | Add real automation examples after a scheduled workflow is created. |
| 20 | The Stack: Next.js + Convex + Vercel | **Partial** through project brief/spec stack choices, but no default web stack. | Decide whether the starter kit should recommend this stack or stay stack-neutral; if yes, add a web-app stack profile. |
| 21 | Worktrees | **Strong** in `docs/codex-app-workflow.md` and `docs/codex-desktop-operating-model.md`. | Add worktree merge-order checklist and environment bootstrap checklist. |
| 22 | Build Creator Carousel Studio | **Gap** as a specific capstone. | Either keep it external to this starter kit or create a project example under `projects/` that proves the workflow end to end. |
| 23 | Use The Companion Skill | **Strong** in `docs/codex-skills-playbook.md` through the companion-skill pattern, plus browser verification rules. | Prove with a real app before adding more detail. |
| 24 | Deploy, Smoke Test, Wrap | **Strong** in `docs/implementation-loop.md`, `docs/starter-kit.md`, `templates/project-validate.sh`, and `docs/codex-desktop-operating-model.md`. | Add live deployment smoke-test examples for web apps once a real project needs them. |

## Highest-Value Course-Derived Artifacts

The operating model is now supported by these course-derived artifacts:

1. `docs/codex-desktop-ui-map.md`
   Map the actual Desktop surfaces: projects, threads, composer menus, terminal,
   review UI, plugins, skills, automations, settings, and browser preview.

2. `docs/codex-context-compaction.md`
   Capture context sources, when to compact, when to start fresh, handoff rules,
   and voice-steering guidance.

3. `docs/codex-permissions-guardrails.md`
   Explain default permissions, full access, terminal use, hooks, destructive
   command protection, and approval habits.

4. `docs/codex-primitives-chooser.md`
   Give examples for prompt vs skill vs plugin vs MCP vs computer use vs
   subagent vs worktree vs cloud task vs automation.

5. `docs/codex-skills-playbook.md`
   Document skill anatomy, trigger descriptions, progressive disclosure, repo vs
   user skills, validation, and companion-skill patterns.

6. `templates/github-issue.md`
   Make GitHub issues one-outcome, reviewable, verifiable work units.

7. `docs/codex-automations-playbook.md`
   Capture recurring checks, thread wakeups, project automations, permission
   checks, and output-shape expectations.

## Interpretation

The current repo now contains a broad distilled coverage layer for the PDF:
operating model, UI orientation, context/compaction, permissions, primitives,
skills, automations, issue shaping, worktrees, validation, and shipping.

It still does not mirror the full course slide-by-slide. That is intentional.
Course details that change over time, such as pricing, installation specifics,
model availability, platform limits, and external product behavior, should be
checked against current official docs instead of frozen here.

The next best move is to prove these artifacts in real projects and compress or
adjust them based on repeated corrections.
