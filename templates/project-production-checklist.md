# Production Checklist

This checklist tracks production posture for the project. Keep secrets, private
customer data, and audit/log contents out of this file.

## Production Identity

- Project name: `<name>`
- Repo: `<owner/name or local path>`
- Production URL: `<none yet / url>`
- Deployment platform: `<none yet / Vercel / other>`
- Main branch: `<main>`
- Correct git author email: `<email>`

## Deployment Defaults

- [ ] Deployment platform chosen deliberately.
- [ ] Production branch identified.
- [ ] Auto-deploy behavior understood.
- [ ] Rollback path known.
- [ ] Runtime region/location chosen intentionally, if applicable.

## Access And Data

- [ ] Access model documented.
- [ ] Secrets stored outside Git.
- [ ] Required env var names listed without values.
- [ ] Private data and audit/log data handling documented.
- [ ] User-facing credentials or tokens have a rotation path.

## Environment Variables

Required production env var names:

- `<ENV_VAR_NAME>`

Current policy:

- [ ] No secret values are committed.
- [ ] Sensitive env vars are marked sensitive where the platform supports it.
- [ ] Integration-managed tokens are reviewed before production use.

## Security Settings

- [ ] Source/build logs are not publicly exposed.
- [ ] Browser/security response headers considered for web apps.
- [ ] Deployment protection reviewed against the actual user model.
- [ ] Data sharing/training preferences reviewed for client/private data.
- [ ] Team/member access and 2FA posture reviewed before enforcement changes.

## Live Verification

Run:

```bash
node scripts/verify-production.mjs
```

The command should eventually prove the project-specific production contract
without printing secrets.

## Next Hardening Moves

1. `<next safe production action>`
2. `<next security/privacy action>`
3. `<next observability or verification action>`
