#!/bin/sh
set -eu

echo "Project Validation"

cat <<'MSG'
Configure this script before claiming V1 is done.

Replace this placeholder with the project's real checks, for example:

- unit tests
- type or build checks
- API checks with curl or an HTTP client
- browser or CLI smoke checks
- AI boundary checks for tool calls, fallback behavior, or eval examples

V1 is not done until:

  sh scripts/validate.sh

proves the relevant tests and smoke checks in one command.
MSG

exit 1
