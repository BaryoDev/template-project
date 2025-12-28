#!/bin/bash

# BaryoDev Compaction Script
# This script gathers all project history for the AI to summarize into CONTEXT.md.

echo "🏘️ Gathering BaryoDev history..."

# Create .baryo if it doesn't exist
mkdir -p .baryo/logs
mkdir -p .baryo/mistakes

TEMP_FILE=".baryo/HISTORY.tmp"

# Clear/Create temp file
echo "# RAW PROJECT HISTORY" > "$TEMP_FILE"
echo "Generated on: $(date)" >> "$TEMP_FILE"
echo "---" >> "$TEMP_FILE"

# Collect Logs
if [ "$(ls -A .baryo/logs/*.md 2>/dev/null)" ]; then
    echo "Processing logs..."
    for f in .baryo/logs/*.md; do
        echo "\n## FILE: $f" >> "$TEMP_FILE"
        cat "$f" >> "$TEMP_FILE"
        echo "\n---" >> "$TEMP_FILE"
    done
fi

# Collect Mistakes
if [ "$(ls -A .baryo/mistakes/*.md 2>/dev/null)" ]; then
    echo "Processing mistakes..."
    for f in .baryo/mistakes/*.md; do
        echo "\n## FILE: $f" >> "$TEMP_FILE"
        cat "$f" >> "$TEMP_FILE"
        echo "\n---" >> "$TEMP_FILE"
    done
fi

echo "✅ History gathered in $TEMP_FILE"
echo ""
echo "🤖 [AI ACTION REQUIRED]"
echo "Please perform the following:"
echo "1. Read $TEMP_FILE"
echo "2. Summarize the contents into .baryo/CONTEXT.md following the baryo-learning Compaction Protocol."
echo "3. Preserve all 'Why' decisions and recurring mistake prevention rules."
echo "4. Ask for human approval before overwriting .baryo/CONTEXT.md."
echo "5. After approval and update, DELETE $TEMP_FILE."
