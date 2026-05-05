# Project Control Plane

A project control plane is the smallest set of files and commands that lets a
new Codex session regain operational truth without reconstructing context from
chat history.

It should answer:

- what project this is;
- where the durable handoff lives;
- what command proves local health;
- what command proves production health, when production exists;
- what the next safe action is;
- which constraints must not be violated.

## Default Files

Every serious project should start with:

```text
AGENTS.md
docs/session-handoff.md
docs/ops/production-checklist.md
scripts/project-status.mjs
scripts/validate.sh
scripts/verify-production.mjs
```

The starter script creates these from templates. Adapt them before claiming V1
or production readiness.

## Default Command

Use one status command as the session cockpit:

```bash
node scripts/project-status.mjs
```

For Node projects, expose it as:

```json
{
  "scripts": {
    "status": "node scripts/project-status.mjs"
  }
}
```

The command should be secret-free. It may report names, statuses, branch names,
URLs, and deployment IDs. It must not print secrets, auth headers, API keys,
tokens, private customer data, or audit event contents.

## What Status Should Show

- Git branch and tracking branch.
- Latest commit.
- Whether the working tree is clean.
- Project validation status.
- Production verification status, if configured.
- Latest handoff checkpoint.
- Next recommended action.
- Key docs to read next.

## Handoff Rule

After every durable implementation, deployment, or ops commit:

1. Run the project validation command.
2. Run production verification if production exists.
3. Update `docs/session-handoff.md` with the latest meaningful commit,
   validation result, known gaps, and next action.

Do not create an infinite handoff loop. A handoff-only commit can record the
previous meaningful checkpoint, or the next session can use `git log` plus the
handoff to resolve exact state.

## Production Rule

Production verification starts as a placeholder. Replace it with checks that
match the project:

- live URL status;
- auth or deployment protection expectation;
- response headers;
- environment variable names without values;
- deployment platform status;
- region or runtime assumptions;
- smoke path or API health.

For a private Vercel AI tool, use
`docs/patterns/private-vercel-ai-tool.md` as the deployment-hardening baseline.
