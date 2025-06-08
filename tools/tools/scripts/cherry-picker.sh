#!/bin/bash

# Prompt for inputs
read -p "Enter the commit hash to cherry-pick: " commit_hash
read -p "Is it a merge commit? (y/N): " is_merge
read -p "Enter branch names separated by space: " branches

echo "Fetching all specified branches..."
git fetch origin $branches

echo "Checking out and updating master..."
git checkout master && git pull origin master

echo "Starting cherry-pick process..."

for branch in $branches; do
	echo "\nChecking out $branch..."
	git checkout "$branch" || {
		echo "Failed to checkout $branch"
		exit 1
	}

	echo "Cherry-picking commit $commit_hash into $branch..."
	if [ "$is_merge" == "y" ]; then
		git cherry-pick "$commit_hash" -m 1
	else
		git cherry-pick "$commit_hash"
	fi

	# Check if cherry-pick succeeded
	if [ $? -ne 0 ]; then
		echo "Cherry-pick failed on branch $branch. Resolve conflicts and continue manually."
		exit 1
	fi

	git push origin "$branch" || {
		echo "Failed to push $branch"
		exit 1
	}

	echo "Cherry-pick successful on $branch."
done

echo "\nCherry-picking completed successfully on all branches.\n"

git checkout master
git branch -D $branches
