#!/bin/bash

# BaryoDev Skill Fetcher
# Usage: ./scripts/get-skill.sh baryo-[skill-name]

SKILL_NAME=$1
export LC_ALL=C

if [ -z "$SKILL_NAME" ]; then
    echo "Usage: ./scripts/get-skill.sh baryo-[skill-name]"
    exit 1
fi

case "$SKILL_NAME" in
    baryo-[a-z0-9]*) ;;
    *) echo "Error: skill name must look like baryo-[skill-name]." >&2; exit 1 ;;
esac
case "$SKILL_NAME" in
    *[!a-z0-9-]*) echo "Error: skill name may only use a-z, 0-9 and dashes." >&2; exit 1 ;;
esac

URL="https://raw.githubusercontent.com/BaryoDev/skills/main/skills/$SKILL_NAME/SKILL.md"

echo "### FETCHING FULL SKILL: $SKILL_NAME ###"
echo "Source: $URL"
echo ""

body=$(curl -fsS --max-time 20 "$URL") || {
    echo "Error: Could not fetch skill $SKILL_NAME. Verify the name and your internet connection." >&2
    exit 1
}
printf '%s\n' "$body"
