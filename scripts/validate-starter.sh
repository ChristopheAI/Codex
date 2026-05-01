#!/bin/sh
set -eu

required_files="
README.md
AGENTS.md
docs/new-project.md
docs/starter-kit.md
docs/codex-app-workflow.md
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
scripts/new-project.sh
scripts/validate-starter.sh
"

for file in $required_files; do
  test -f "$file"
done

grep -q "Codex Project Starter Kit" README.md
grep -q "Do not start with code" docs/new-project.md
grep -q "Project Brief" templates/project-brief.md
grep -q "project brief" AGENTS.md
grep -q "planning baseline" AGENTS.md
grep -q "think first" docs/implementation-loop.md
grep -q "Planning Baseline" docs/implementation-loop.md
grep -q "Pattern Choice" docs/ai-system-defaults.md
grep -q "Session Handoff" docs/session-handoff.md
grep -q "Marker Resolution" docs/validation-protocol.md
grep -q "AI System Spec" templates/ai-system-spec.md
grep -q "Acceptance Criteria" templates/task.md

echo "Starter kit validation passed"
