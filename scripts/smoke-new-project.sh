#!/bin/sh
set -eu

source_dir=$(pwd)
tmp_root=$(mktemp -d "${TMPDIR:-/tmp}/codex-new-project-smoke.XXXXXX")
workdir="$tmp_root/project"

cleanup() {
  if [ "${KEEP_SMOKE_PROJECT:-}" = "1" ]; then
    echo "Kept smoke project at $workdir"
  else
    rm -rf "$tmp_root"
  fi
}

trap cleanup EXIT INT TERM

mkdir -p "$workdir"
rsync -a \
  --exclude='.git' \
  --exclude='.DS_Store' \
  "$source_dir"/ "$workdir"/

cd "$workdir"

git init -q
git config user.email codex@example.invalid
git config user.name Codex
git add .
git commit -q -m "test: seed starter kit scratch copy"

sh scripts/new-project.sh

for file in \
  AGENTS.md \
  docs/project-brief.md \
  docs/session-handoff.md \
  docs/ops/production-checklist.md \
  scripts/validate.sh \
  scripts/project-status.mjs \
  scripts/verify-production.mjs \
  .github/workflows/ci.yml \
  .gitignore
do
  test -f "$file"
done

cat > docs/project-brief.md <<'EOF'
# Project Brief: AI Inbox Triage Demo

## One-Line Purpose

Classify incoming messages into simple action buckets.

## Problem

Small teams lose time deciding which messages need attention first.

## User

A solo operator reviewing a small inbox once per day.

## Outcome

V1 reads sample message text and returns one of three buckets: urgent,
needs-reply, or archive.

## Scope

In scope:

- One deterministic CLI example.
- Three classification buckets.
- A project validation command.

Out of scope:

- Real email access.
- Sending replies.
- Production deployment.

## Success Criteria

- The project control plane reports a planning baseline.
- The validation command passes.
- The next implementation task is clear.

## Proposed Stack

- App/runtime: shell-first placeholder
- Database/storage: none
- AI/model layer: mocked until implementation starts
- Deployment: none yet

## Key Decisions

- Decision: Start with a mocked classifier.
  Reason: Prove workflow shape before external API access.

## Risks

- Risk: The demo could pretend to validate AI behavior before AI exists.
  Mitigation: Keep V1 planning validation separate from implementation
  validation.

## First Build Slice

Create one CLI classifier over three sample messages.

## Verification

Run `sh scripts/validate.sh`.
EOF

cat > AGENTS.md <<'EOF'
# Project Agent Guide

This is a scratch project created by the starter-kit smoke test.

## Session Start

1. Read this file.
2. Read `docs/session-handoff.md`.
3. Run `node scripts/project-status.mjs`.

## Project Facts

- Project name: `AI Inbox Triage Demo`
- Purpose: classify sample messages into action buckets.
- Production URL: `none yet`
- Deployment target: `none yet`

## Commands

```bash
node scripts/project-status.mjs
sh scripts/validate.sh
```

## Change Discipline

- Do not add real email access in the first slice.
- Keep external writes out of scope.
- Update `docs/session-handoff.md` after durable commits.
EOF

mkdir -p docs/plans
cat > docs/plans/first-slice.md <<'EOF'
# Plan: First Slice

## Goal

Create one reviewable implementation task for a mocked inbox classifier.

## Source

`docs/project-brief.md`

## Tasks

### Task 1: Mock CLI Classifier

**Goal**

Classify three hardcoded sample messages into action buckets.

**Acceptance Criteria**

- The CLI prints one bucket per sample message.
- The allowed buckets are urgent, needs-reply, and archive.
- `sh scripts/validate.sh` proves the behavior.

**Verify**

```bash
sh scripts/validate.sh
```

**Out Of Scope**

Real email access, model calls, deployment, and message sending.
EOF

cat > scripts/validate.sh <<'EOF'
#!/bin/sh
set -eu

grep -q "AI Inbox Triage Demo" docs/project-brief.md
grep -q "Mock CLI Classifier" docs/plans/first-slice.md
grep -q "Project name: \`AI Inbox Triage Demo\`" AGENTS.md
grep -q "Latest meaningful project commit" docs/session-handoff.md

echo "Scratch project validation passed"
EOF
chmod +x scripts/validate.sh

sh scripts/validate.sh

git add \
  AGENTS.md \
  docs/project-brief.md \
  docs/plans/first-slice.md \
  docs/session-handoff.md \
  docs/ops/production-checklist.md \
  scripts/validate.sh \
  scripts/project-status.mjs \
  scripts/verify-production.mjs \
  .github/workflows/ci.yml \
  .gitignore
git commit -q -m "docs: add project planning baseline"

baseline_commit=$(git rev-parse --short HEAD)

cat > docs/session-handoff.md <<EOF
# Project Session Handoff

Use this file to make the project resumable from another Codex thread.

## Current Project Purpose

AI Inbox Triage Demo classifies sample message text into simple action buckets.

## Current V1 Scope

The first slice is a mocked CLI classifier for three hardcoded sample messages.

## V1 Status

- Status: \`not started\`
- Validation command: \`sh scripts/validate.sh\`
- Last validation result: \`passed before planning baseline\`
- Closeout recommendation: \`extend\`
- Residual gaps: implementation has not started.

## Latest Durable Checkpoint

- Current branch: \`main\`
- Latest meaningful project commit: \`$baseline_commit\`
- Latest handoff/checkpoint update: \`pending\`
- Latest pushed commit: \`none\`
- Validation command and result: \`sh scripts/validate.sh\` passed.
- Production deployment: \`none\`
- Production verification command and result: \`node scripts/verify-production.mjs\` skipped because no production URL exists.
- Known gaps: CLI classifier is planned but not implemented.
- Next recommended action: Create Task 1 implementation for the mocked CLI classifier.

## Next Recommended Action

Create Task 1 implementation for the mocked CLI classifier.

## Control Plane

Read these first in a new session:

- \`AGENTS.md\`
- \`docs/session-handoff.md\`
- \`docs/ops/production-checklist.md\`

Then run:

\`\`\`bash
node scripts/project-status.mjs
\`\`\`

## Active Markers

| Marker | Type | Meaning | How To Resume |
| --- | --- | --- | --- |
EOF

sh scripts/validate.sh
git add docs/session-handoff.md
git commit -q -m "docs: update planning handoff"

node scripts/project-status.mjs > smoke-status.out

grep -q "Project validation: OK" smoke-status.out
grep -q "Latest checkpoint: $baseline_commit" smoke-status.out
grep -q "Next action: Create Task 1 implementation" smoke-status.out
grep -q "AGENTS.md" smoke-status.out
grep -q "docs/session-handoff.md" smoke-status.out
grep -q "docs/ops/production-checklist.md" smoke-status.out

grep -q "Read \`docs/session-handoff.md\`" AGENTS.md
grep -q "First Build Slice" docs/project-brief.md
grep -q "Mock CLI Classifier" docs/plans/first-slice.md

echo "New project smoke test passed"
if [ "${KEEP_SMOKE_PROJECT:-}" = "1" ]; then
  echo "Scratch project: $workdir"
else
  echo "Scratch project removed. Re-run with KEEP_SMOKE_PROJECT=1 to inspect it."
fi
