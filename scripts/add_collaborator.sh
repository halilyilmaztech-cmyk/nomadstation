#!/usr/bin/env bash

# Usage: GH_TOKEN=ghp_xxx ./scripts/add_collaborator.sh username permission
# permission: pull (read), push (write), admin

if [ -z "$1" ]; then
  echo "Usage: $0 <github-username> [permission]"
  exit 1
fi

USERNAME="$1"
PERMISSION="${2:-push}"

if [ -z "$GH_TOKEN" ]; then
  echo "Error: Set GH_TOKEN env var with a personal access token having 'repo' scope or proper permissions."
  exit 2
fi

REPO_OWNER="halilyilmaztech-cmyk"
REPO_NAME="nomadstation"

API_URL="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/collaborators/$USERNAME"

echo "Adding $USERNAME as collaborator with permission: $PERMISSION"

curl -s -X PUT -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  "$API_URL" \
  -d "{ \"permission\": \"$PERMISSION\" }" | jq .

echo "Done. If the user doesn't accept the invitation, they won't appear as a collaborator yet."