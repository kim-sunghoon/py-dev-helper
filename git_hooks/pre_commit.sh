#!/bin/sh

set -e
GIT_DIR=$(git rev-parse --git-dir)

files=$(git diff --staged --name-only -- "*.py")
for file in $files; do
  echo "precommit ${file}"
  black --config ${GIT_DIR}/../pyproject.toml "$file"
  isort --settings-path ${GIT_DIR}/../pyproject.toml "$file"
  git add "$file"
done
