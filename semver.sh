#!/bin/bash

# Get the latest tag
latest_tag=$(git describe --tags --abbrev=0)

# Parse the major, minor, and patch versions from the latest tag
IFS='.' read -r major minor patch <<< "${latest_tag//v}"

# Construct the new version
new_version="${major}.${minor}.${patch}"

echo "New version: $new_version"