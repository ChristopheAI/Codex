#!/bin/sh
set -eu

required_files="
README.md
AGENTS.md
docs/new-project.md
docs/starter-kit.md
docs/codex-app-workflow.md
docs/implementation-loop.md
templates/project-brief.md
templates/spec.md
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
grep -q "think first" docs/implementation-loop.md
grep -q "Acceptance Criteria" templates/task.md

echo "Starter kit validation passed"
