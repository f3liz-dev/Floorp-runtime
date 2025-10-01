#!/bin/bash
# Script to push the nora-0.2.0 branch to origin repository
# This script requires GitHub authentication (GITHUB_TOKEN or gh auth)

set -e

echo "Pushing nora-0.2.0 branch to origin..."

cd "$(dirname "$0")"

# Check if nora-0.2.0 branch exists
if ! git show-ref --verify --quiet refs/heads/nora-0.2.0; then
    echo "Error: nora-0.2.0 branch does not exist"
    exit 1
fi

# Push the branch
if git push -u origin nora-0.2.0; then
    echo "✓ Successfully pushed nora-0.2.0 branch to origin"
    echo "✓ Branch URL: https://github.com/f3liz-dev/Floorp-runtime/tree/nora-0.2.0"
else
    echo "✗ Failed to push nora-0.2.0 branch"
    echo "  Make sure you have proper GitHub authentication configured"
    echo "  You can authenticate using:"
    echo "    - gh auth login"
    echo "    - git credential helper"
    echo "    - GITHUB_TOKEN environment variable"
    exit 1
fi
