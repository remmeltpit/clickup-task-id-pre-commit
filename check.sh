#! /usr/bin/env bash

set -Eeuo pipefail

if [ $# -eq 0 ]; then
  echo "No space names provided, so this will always fail."
  echo "Use: args: ['BUG', 'DEVEX'], substituting your team's space names."
  exit 2
fi

spaces=$(echo "$@" | tr ' ' '|')

title=$(head --lines 1 .git/COMMIT_EDITMSG)
if echo "$title" | grep --quiet --extended-regexp ".*\[($spaces)-\d+\]"; then
  code=0
else
  code=$?
fi

if [ $code -ne 0 ]; then
  echo "Commit title does not contain Clickup task id in space(s) $spaces."
  echo "Consider adding a task to the title, e.g. 'fix: [$1-1234] fix a bug'."
fi

exit $code
