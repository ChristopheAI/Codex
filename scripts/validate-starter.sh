#!/bin/sh
set -eu

required_files="
README.md
AGENTS.md
docs/new-project.md
docs/starter-kit.md
docs/codex-app-workflow.md
docs/codex-desktop-operating-model.md
docs/implementation-loop.md
docs/ai-system-defaults.md
docs/session-handoff.md
docs/validation-protocol.md
templates/project-brief.md
templates/spec.md
templates/ai-system-spec.md
templates/plan.md
templates/task.md
templates/review-checklist.md
templates/project-gitignore
templates/project-session-handoff.md
templates/project-validate.sh
templates/reflection.md
scripts/new-project.sh
scripts/validate-starter.sh
"

for file in $required_files; do
  test -f "$file"
done

grep -q "Codex Project Starter Kit" README.md
grep -q "codex-desktop-operating-model.md" README.md
grep -q "Do not start with code" docs/new-project.md
grep -q "Project Brief" templates/project-brief.md
grep -q "Codex Desktop Operating Model" docs/codex-desktop-operating-model.md
grep -q "Access vs Workflow" docs/codex-desktop-operating-model.md
grep -q "project brief" AGENTS.md
grep -q "planning baseline" AGENTS.md
grep -q "think first" docs/implementation-loop.md
grep -q "Planning Baseline" docs/implementation-loop.md
grep -q "Pattern Choice" docs/ai-system-defaults.md
grep -q "Session Handoff" docs/session-handoff.md
grep -q "Marker Resolution" docs/validation-protocol.md
grep -q "AI System Spec" templates/ai-system-spec.md
grep -q "Acceptance Criteria" templates/task.md
grep -q "Project Validation" templates/project-validate.sh
grep -q "Project Session Handoff" templates/project-session-handoff.md
grep -q "Project Reflection" templates/reflection.md
grep -q ".env" templates/project-gitignore
grep -q "V1 Closeout" docs/implementation-loop.md
grep -q "Handoff Checkpoint" docs/implementation-loop.md
grep -q "Close Out V1" docs/new-project.md
grep -q "After each durable implementation commit" docs/new-project.md
grep -q "stop, polish, or extend" docs/starter-kit.md
grep -q "Handoff checkpoint rule" docs/starter-kit.md
grep -q "Latest meaningful project commit" templates/project-session-handoff.md
grep -q "Validation command and result" templates/project-session-handoff.md
grep -q "templates/project-validate.sh" scripts/new-project.sh
grep -q "templates/project-session-handoff.md" scripts/new-project.sh
grep -q "templates/project-gitignore" scripts/new-project.sh

echo "Starter kit validation passed"
