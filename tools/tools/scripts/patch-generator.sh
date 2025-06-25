#!/bin/bash

# Usage: ./rebase-commit.sh <PROD_COMMIT> <NEW_COMMIT> <DEST_DIR>
set -e

PROD_COMMIT=$1
NEW_COMMIT=$2
DEST_DIR=$3

if [ -z "$PROD_COMMIT" ] || [ -z "$NEW_COMMIT" ] || [ -z "$DEST_DIR" ]; then
	echo "Usage: $0 <BUILD_COMMIT_HASH> <YOUR_COMMIT_HASH> <DEST_DIR>"
	exit 1
fi

REPO_ROOT=$(git rev-parse --show-toplevel)
cd "$REPO_ROOT"

# Get list of files changed in NEW_COMMIT only
CHANGED_FILES=$(git diff-tree --no-commit-id --name-only -r "$NEW_COMMIT")

echo "📄 Files changed in commit $NEW_COMMIT:"
echo "$CHANGED_FILES"
echo

mkdir -p "$DEST_DIR"

for FILE in $CHANGED_FILES; do
	echo "🔧 Processing: $FILE..."

	TMP_DIR=$(mktemp -d)
	PATCH_FILE="$TMP_DIR/patch.diff"
	PROD_FILE="$TMP_DIR/prod_file"
	RESULT_FILE="$TMP_DIR/result_file"

	# Get the diff for just that file in NEW_COMMIT
	git diff "${NEW_COMMIT}^" "$NEW_COMMIT" -- "$FILE" >"$PATCH_FILE"

	# Get the file content from prod_commit
	git show "$PROD_COMMIT:$FILE" >"$PROD_FILE"

	# Apply the patch to the prod version
	patch "$PROD_FILE" "$PATCH_FILE" -o "$RESULT_FILE" >/dev/null || {
		echo "❌ Failed to patch $FILE"
		continue
	}

	# Flatten output: use just the filename (basename only)
	BASENAME=$(basename "$FILE")
	cp "$RESULT_FILE" "$DEST_DIR/$BASENAME"
	echo "✅ Saved: $DEST_DIR/$BASENAME"

	rm -rf "$TMP_DIR"
done

echo ""
echo "🎉 Done! Changed saved to: $DEST_DIR"
