#!/bin/bash

# Get tag at the current commit
latest_semver_tag=$(git describe --tags --match "[0-9]*.[0-9]*.[0-9]*" --abbrev=0 --contains HEAD)

# If tag already exists, exit
if [ -n "$latest_semver_tag" ]; then
    echo "A SemVer tag already exists: $latest_semver_tag"
    exit 0
fi

# Get the latest tag
latest_tag=$(git describe --tags --match "[0-9]*.[0-9]*.[0-9]*" --abbrev=0)

# Parse the major, minor, and patch versions from the latest tag
IFS='.' read -r major minor patch <<< "${latest_tag//v}"

# Get message of the current commit
commit_message=$(git log --format=%B -n 1 HEAD)

# Extract the branch name from the commit message
branch=""
if [[ $commit_message =~ ^Merge\ branch\ \'(release\/|feature\/|hotfix\/)([^\']+)\' ]]; then
    branch=${BASH_REMATCH[1]}
fi

# Check the branch name and increment the version accordingly
case "$branch" in
    release/*)
        major=$((major + 1))
        minor=0
        patch=0
        ;;
    feature/*)
        minor=$((minor + 1))
        patch=0
        ;;
    hotfix/*)
        patch=$((patch + 1))
        ;;
    *)
        echo "No version increment required or branch name is not valid."
        exit 0
        ;;
esac

# Build the new version
new_version="${major}.${minor}.${patch}"

echo "New version: $new_version"

# Create a new tag
git tag "$new_version"