#!/bin/bash
# Run: bash tests/get-skill.sh
# Names that could leave the skills path must be refused before any request.
cd "$(dirname "$0")/.." || exit 1
fail=0
for bad in "../../../../SomeOrg/repo/main/dir" "../x" "baryo-a/../b" "baryo-A" "other-skill" "baryo-x?y=1"; do
    if ! ./scripts/get-skill.sh "$bad" 2>&1 >/dev/null | grep -q "skill name"; then
        echo "FAIL: '$bad' was not refused by the name check"
        fail=1
    fi
done
[ "$fail" -eq 0 ] && echo "ok"
exit "$fail"
