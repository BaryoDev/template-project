#!/bin/bash

# BaryoDev Skill Fetcher
# Usage: ./scripts/get-skill.sh baryo-[skill-name]

SKILL_NAME=$1

if [ -z "$SKILL_NAME" ]; then
    echo "Usage: ./scripts/get-skill.sh baryo-[skill-name]"
    exit 1
fi

URL="https://raw.githubusercontent.com/BaryoDev/skills/main/skills/$SKILL_NAME/SKILL.md"

echo "### FETCHING FULL SKILL: $SKILL_NAME ###"
echo "Source: $URL"
echo ""

curl -s "$URL"

if [ $? -ne 0 ]; then
    echo "Error: Could not fetch skill $SKILL_NAME. Verify the name and your internet connection."
    exit 1
fi
