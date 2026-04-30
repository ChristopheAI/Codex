default:
    just --list

check:
    git status --short
    git diff --check

new-project:
    sh scripts/new-project.sh

validate-starter:
    sh scripts/validate-starter.sh
