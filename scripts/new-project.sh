#!/bin/sh
set -eu

mkdir -p docs scripts

if [ -f docs/project-brief.md ]; then
  echo "docs/project-brief.md already exists"
  exit 1
fi

cp templates/project-brief.md docs/project-brief.md
echo "Created docs/project-brief.md"

if [ -f docs/session-handoff.md ] &&
  grep -q "Codex project starter kit" docs/session-handoff.md; then
  cp templates/project-session-handoff.md docs/session-handoff.md
  echo "Replaced starter docs/session-handoff.md"
elif [ ! -f docs/session-handoff.md ]; then
  cp templates/project-session-handoff.md docs/session-handoff.md
  echo "Created docs/session-handoff.md"
fi

if [ ! -f scripts/validate.sh ]; then
  cp templates/project-validate.sh scripts/validate.sh
  chmod +x scripts/validate.sh
  echo "Created scripts/validate.sh"
fi

if [ ! -f .gitignore ]; then
  cp templates/project-gitignore .gitignore
  echo "Created .gitignore"
fi
