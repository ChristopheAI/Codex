#!/bin/sh
set -eu

mkdir -p docs

if [ -f docs/project-brief.md ]; then
  echo "docs/project-brief.md already exists"
  exit 1
fi

cp templates/project-brief.md docs/project-brief.md
echo "Created docs/project-brief.md"
