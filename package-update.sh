#!/bin/bash

# Title: Updates a npm dependency if it does exist

### Change these values ###
PACKAGE=sc-game-base
VERSION=3.0.3-beta.0

IGT_PACKAGE=sc-game-service-integration-utils
IGT_VERSION=1.2.2-beta.1

# Check package.json file
if [ ! -f "package.json" ]; then
    echo "package.json does not exist"
    exit 1
fi

itg_version=$(node -p "require('./package.json').devDependencies?.['"$IGT_PACKAGE"']")
current_version=$(node -p "require('./package.json').dependencies['"$PACKAGE"']")
resolution_version=$(node -p "require('./package.json').resolutions?.['"$PACKAGE"']")

# Check if the package already exist
if [ $current_version == undefined ]
then
	echo "Package \"$PACKAGE\" is not installed"
	exit 2
fi

# Check if the package already upgraded
if [ $current_version == $VERSION ]
then
    echo "Package \"$PACKAGE\" was upgraded"
    exit 3
fi

# Check if having resolutions
if [ ! $resolution_version == undefined ]
then
	newFileContent=$(node -p "JSON.stringify({...require('./package.json'), resolutions : { ['"$PACKAGE"']: '"$VERSION"'} }, null, 4)")
	echo "$newFileContent" > package.json
	
	yarn
fi

# Check if having IGT_PACKAGE
if [ ! $itg_version == undefined ]
then
	yarn add $IGT_PACKAGE@$IGT_VERSION
fi

yarn add $PACKAGE@$VERSION