#!/bin/bash

# Title: Update db connection string

### Environtment ###
EVN=("LOCAL" "LOCAL_1" "LOCAL_2" "LOCAL_3")

### Orl url ###
OLDURL=(
	"@10.10.50.13:27101" 
	"@10.10.50.14:17101" 
	"@10.10.50.14:27105" 
	"@10.10.50.14:27106")

### New url ###
NEWURL=(
	"@10.10.50.12:39100,10.10.50.13:39100,10.10.50.14:39100" 
	"@10.10.50.12:39101,10.10.50.13:39101,10.10.50.14:39101" 
	"@10.10.50.12:39102,10.10.50.13:39102,10.10.50.14:39102" 
	"@10.10.50.12:39103,10.10.50.13:39103,10.10.50.14:39103")


for index in "${!EVN[@]}"
do
	config_path="./configs/app-configs.${EVN[$index]}.js"
	
	echo "*** Updating ${config_path} ***"
	
	if [ ! -f "$config_path" ]; then
		echo "$config_path does not exist"
		continue 
	fi
	
	if ! grep -q "${OLDURL[$index]}" "$config_path" ; then
		echo "The old db conn string does NOT match"
		continue
	fi

	sed -i "s/${OLDURL[$index]}/${NEWURL[$index]}/g" "$config_path";
done