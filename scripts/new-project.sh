#!/bin/sh
set -eu

mkdir -p .github/workflows docs docs/ops scripts

if [ -f docs/project-brief.md ]; then
  echo "docs/project-brief.md already exists"
  exit 1
fi

cp templates/project-brief.md docs/project-brief.md
echo "Created docs/project-brief.md"

if [ -f AGENTS.md ] &&
  grep -q "Codex Project Starter Kit" AGENTS.md; then
  cp templates/project-agents.md AGENTS.md
  echo "Replaced starter AGENTS.md"
elif [ ! -f AGENTS.md ]; then
  cp templates/project-agents.md AGENTS.md
  echo "Created AGENTS.md"
fi

if [ -f docs/session-handoff.md ] &&
  grep -q "Codex project starter kit" docs/session-handoff.md; then
  cp templates/project-session-handoff.md docs/session-handoff.md
  echo "Replaced starter docs/session-handoff.md"
elif [ ! -f docs/session-handoff.md ]; then
  cp templates/project-session-handoff.md docs/session-handoff.md
  echo "Created docs/session-handoff.md"
fi

if [ ! -f docs/ops/production-checklist.md ]; then
  cp templates/project-production-checklist.md docs/ops/production-checklist.md
  echo "Created docs/ops/production-checklist.md"
fi

if [ ! -f scripts/validate.sh ]; then
  cp templates/project-validate.sh scripts/validate.sh
  chmod +x scripts/validate.sh
  echo "Created scripts/validate.sh"
fi

if [ ! -f scripts/project-status.mjs ]; then
  cp templates/project-status.mjs scripts/project-status.mjs
  chmod +x scripts/project-status.mjs
  echo "Created scripts/project-status.mjs"
fi

if [ ! -f scripts/verify-production.mjs ]; then
  cp templates/project-verify-production.mjs scripts/verify-production.mjs
  chmod +x scripts/verify-production.mjs
  echo "Created scripts/verify-production.mjs"
fi

if [ ! -f .gitignore ]; then
  cp templates/project-gitignore .gitignore
  echo "Created .gitignore"
fi

if [ ! -f .github/workflows/ci.yml ]; then
  cp templates/github-actions-ci.yml .github/workflows/ci.yml
  echo "Created .github/workflows/ci.yml"
fi
