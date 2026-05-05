# Bavast Vercel Case Study

Bavast Vercel is the first concrete proof project for the private Vercel AI tool
pattern.

## Problem

Bavast needs a private workflow that turns source material into inspectable
report artifacts. The app must be simple enough for a known external user to
test, but serious enough that deployment, access, auditability, and rollback are
not afterthoughts.

## Shape

```text
known user
  -> Basic Auth challenge
  -> Next.js app on Vercel
  -> AI/workflow generation
  -> private Vercel Blob artifacts
  -> app-protected downloads
  -> login audit JSON
```

## Patterns Proven

- GitHub-connected Vercel production deployment.
- Correct git author email before deploy.
- Production branch and auto-deploy path checked.
- Vercel function region moved to `fra1` for Belgian users.
- Non-production builds skipped to reduce noise and cost.
- Project and team Data Preferences disabled.
- Vercel Toolbar disabled.
- Sensitive Environment Variable policy enabled.
- Runtime auth and model secrets marked Sensitive.
- Blob integration token reviewed as integration-managed.
- Basic Auth success audit persisted to private Blob storage.
- Security response headers added and verified on the live 401 response.

## What Stayed Project-Specific

- The actual Bavast credentials.
- Client or source documents.
- Blob audit JSON contents.
- Production env var values.
- Any domain decision, because `christophe.dev` is not relevant to Bavast.

## Reusable Lesson

The reusable win is not one Vercel setting. It is the operating pattern:

```text
make the tool work
  -> connect deploy path
  -> protect access
  -> persist audit evidence
  -> harden Vercel settings
  -> add live verification
  -> capture the pattern for project 2
```

## Next Extraction

The Bavast repo should keep a project-local checklist and verification command.
This starter-kit repo should keep the generalized pattern in
`docs/patterns/private-vercel-ai-tool.md`.
