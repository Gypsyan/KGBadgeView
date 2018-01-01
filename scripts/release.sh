#!/bin/bash

# This script is used by Travis-CI to automatically release new versions of KGBadgeView.
# First, we check if the version specified in the .podspec does not already exist as a git tag.
# If the version does not exist yet, we add a git tag for this new version and publish to Cocoapods.

set -ev
cd ~/Documents
# GITHUB_TOKEN required for Travis to have permissions to push to the KGBadgeView repository
git clone https://Gypsyan:${GITHUB_TOKEN}@github.com/Gypsyan/KGBadgeView.git
cd KGBadgeView
git remote rm origin
git remote add origin https://Gypsyan:${GITHUB_TOKEN}@github.com/Gypsyan/KGBadgeView.git
version=$(grep -o 'version.*=.*[0-9]' KGBadgeView.podspec | cut -f 2 -d "'")
git fetch --tags
if [[ ! "$(git tag)" =~ "${version}" ]]; then
	echo "Publishing new version ${version} ";
	git tag $version;
	git push origin --tags;
	pod trunk push --allow-warnings;
fi