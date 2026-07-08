#!/bin/bash

# Parse the "Prompt for AI Agents" section from a comment
# Extracts content between triple backticks after "Prompt for AI Agents"
# Usage: parse_llm_instructions "$SUGGESTION"


echo "$SUGGESTION" | awk '
    /<summary>🤖 Prompt for AI Agents<\/summary>/ { found=1; next }
    found && /```/ {
                    in_code = !in_code;
                    if (!in_code) exit;
                    next
    }
    in_code
'
