#!/bin/bash

# Title: Upsert enableMsgpackParser

### Environtment ###
EVN="LOCAL_1"

### Config ###
CONFIG="enableMsgpackParser"

### OLD VALUE ###
OLDVALUE=false

### NEW VALUE ###
NEWVALUE=true

config_path="./configs/app-configs.${EVN[$index]}.js"

OLDSETTING="${CONFIG}: ${OLDVALUE},"
NEWSETTING="${CONFIG}: ${NEWVALUE},"

echo "*** Updating ${config_path} ***"

if [ ! -f "$config_path" ]; then
	echo "$config_path does not exist"
	
	exit 1
fi

if ! grep -q "${CONFIG}" "$config_path" ; then
	echo "INSERT NEW CONFIG LINE !!!"
	
	awk -i inplace 'FNR==NR{ if (/,/) p=NR; next} 1; FNR==p{ print "\tenableMsgpackParser: true," }' "$config_path" "$config_path" 
else
	if grep -q "${NEWSETTING}" "$config_path" ; then
		echo "CONFIG WAS UPDATED !!!"
	else
		echo "UPDATE ${CONFIG}: true"
		sed -i "s/${OLDSETTING}/${NEWSETTING}/g" "$config_path";
	fi
fi

