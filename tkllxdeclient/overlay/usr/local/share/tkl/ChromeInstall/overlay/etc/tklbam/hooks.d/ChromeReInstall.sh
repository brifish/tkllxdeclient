#!/bin/bash -e
# hooks are always called with two arguments
# Re-install Google Chrome after a TKLBAM restore

op=$1       # backup / restore
state=$2    # pre / post

if [ "$op" == "restore" ] && [ "$state" == "post" ]; then

	export DEBIAN_FRONTEND=noninteractive

	# Have to add the custom repositories for Chrome and install/update from there
	echo deb http://dl.google.com/linux/deb/ stable main >> /etc/apt/sources.list.d/sources.list
	echo deb http://dl.google.com/linux/deb/ stable main >> /etc/apt/sources.list.d/security.sources.list
	
	# make sure the public encryption key is here
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

	apt-get update -y
	apt-get upgrade -y --force-yes
	apt-get -y install google-chrome-stable

fi
