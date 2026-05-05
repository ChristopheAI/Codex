# Private Vercel AI Tool Pattern

Use this pattern when a small team needs a private AI workflow online quickly,
but the result still needs production discipline.

It is intentionally lighter than an enterprise setup. The goal is a private
tool that can be deployed, audited, verified, and safely reused for the next
client or internal workflow.

## When To Use

- The app is for a known user group, not the public internet.
- A custom domain is optional or irrelevant for V1.
- The first access model can be simple, such as Basic Auth or provider auth.
- The app stores generated artifacts or audit records.
- The deployment target is Vercel.
- The user needs a working tool before a full SaaS architecture.

## Default Architecture

```text
browser
  -> Vercel deployment
  -> app-level access gate
  -> AI or workflow route
  -> private artifact storage
  -> audit trail
  -> production verification script
```

Keep the first version boring:

- One production branch.
- One production URL.
- One access path.
- One storage boundary.
- One verification command.

## Vercel Defaults

Set these deliberately before calling V1 production-ready:

- Git repository connected to Vercel.
- Production branch set explicitly.
- Auto-deploy enabled only where wanted.
- Function region close to users, for example `fra1` for Belgium.
- Build logs and source protection enabled.
- Vercel Toolbar disabled for private production tools unless actively needed.
- Data Preferences disabled at project and team level when client or private
  data is involved.
- Sensitive Environment Variable policy enabled at team level.
- Runtime secrets marked Sensitive where Vercel allows it.
- Integration-managed tokens reviewed and rotated when exposure history is
  uncertain.
- Deployment protection settings reviewed against the actual user model.

## Access Gate

For V1, Basic Auth can be acceptable when:

- users are known and few;
- credentials are stored as sensitive production env vars;
- every successful login is audited;
- credentials can be rotated after the first external test;
- the app does not expose unauthenticated artifact URLs.

Move to a stronger auth provider when:

- there are multiple organizations;
- users need individual roles;
- revocation must be self-service;
- audit trails need named identities beyond a shared credential.

## Audit Trail

Log successful access, not secrets.

Capture:

- timestamp;
- username or identity;
- client IP from trusted forwarding headers;
- route path;
- user agent;
- coarse geo headers if the platform provides them.

Do not log:

- passwords;
- authorization headers;
- uploaded client documents;
- API keys;
- full prompts or generated output unless the product explicitly requires it.

For a private tool, storing one JSON audit event per login in private Blob
storage is simple and inspectable.

## Storage

Private generated artifacts should be served through the app, not through public
object URLs.

Recommended V1 behavior:

- store artifacts in private Blob storage;
- return app routes such as `/api/artifacts/...`;
- protect artifact routes with the same access gate;
- set download filenames intentionally;
- keep artifact metadata small enough to inspect.

## Browser Hardening

Add response headers early:

- `Content-Security-Policy`;
- `X-Content-Type-Options: nosniff`;
- `X-Frame-Options: DENY`;
- `Referrer-Policy: no-referrer`;
- `Permissions-Policy` disabling unused browser capabilities.

Keep CSP compatible with the framework first. Tighten it later when the app's
asset and script behavior is stable.

## Production Verification

Each private Vercel AI tool should have one project-local command that proves:

- the live URL challenges unauthenticated users;
- expected security headers are present;
- the current production deployment is Ready;
- the production alias points to that deployment;
- required env var names exist without printing values;
- serverless functions are in the intended region;
- the verification command exits non-zero on failed checks.

Prefer:

```bash
npm run verify:production
```

or the nearest equivalent for the stack.

## Rollback

Keep changes easy to reverse:

- one commit per hardening step;
- Vercel production deployments retained long enough to roll back;
- credentials rotated only when the app has been redeployed and smoke tested;
- access policy changes made after confirming who still needs access.

## Next Project Rule

When this pattern fits, do not rebuild the reasoning from chat memory. Start the
new project with:

- `docs/project-brief.md`;
- a deployment/security section in the first spec;
- `scripts/validate.sh`;
- `scripts/verify-production.*` once the app has a live URL.
