#!/bin/bash

# Title: Updates a npm dependency if it does exist

### Change these values ###
PACKAGE=sc-game-base
VERSION=2.2.2-beta.1

if [ ! -f "package.json" ]; then
    echo "package.json does not exist"
    exit 1
fi

# Check if the package already exist (without having to install all packages first), abort if it does not
current_version=`jq ".dependencies[\"$PACKAGE\"]" package.json`
if [ "$current_version" == "null" ];
then
    echo "Package \"$PACKAGE\" does not exist"
    exit 2
fi

yarn upgrade $PACKAGE@$VERSION
