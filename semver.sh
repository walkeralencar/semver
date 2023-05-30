#!/bin/bash

# Get tag at the current commit
latest_semver_tag=$(git describe --tags --match "[0-9]*.[0-9]*.[0-9]*" --abbrev=0 --contains HEAD > /dev/null 2>&1)

# If tag already exists, exit
if [ -n "$latest_semver_tag" ]; then
    echo "A SemVer tag already exists: $latest_semver_tag"
    exit 0
fi

# Get the latest tag
latest_tag=$(git describe --tags --abbrev=0)

# Parse the major, minor, and patch versions from the latest tag
IFS='.' read -r major minor patch <<< "${latest_tag//v}"

# Construct the new version
new_version="${major}.${minor}.${patch}"

echo "New version: $new_version"