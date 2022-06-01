#!/bin/bash

# Title: Updates a npm dependency if it does exist

### Change these values ###
PACKAGE=sc-game-service-integration-utils
VERSION=1.2.2-beta.0

if [ ! -f "package.json" ]; then
    echo "package.json does not exist"
    exit 1
fi


current_version=$(node -p "require('./package.json').devDependencies['"$PACKAGE"']")

# Check if the package already exist
if [ $current_version == undefined ];
then
	echo "Package \"$PACKAGE\" is not installed"
	exit 2
fi

# Check if the package already upgraded
if [ $current_version == $VERSION ];
then
    echo "Package \"$PACKAGE\" was upgraded"
    exit 2
fi

echo ""$PACKAGE"@"$VERSION""

yarn upgrade $PACKAGE@$VERSION