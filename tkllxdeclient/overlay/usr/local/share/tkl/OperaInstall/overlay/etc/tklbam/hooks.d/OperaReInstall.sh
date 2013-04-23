#!/bin/bash -e
# hooks are always called with two arguments

op=$1       # backup / restore
state=$2    # pre / post

if [ "$op" == "restore" ] && [ "$state" == "post" ]; then

	export DEBIAN_FRONTEND=noninteractive

	# Have to add the custom repositories for Opera and install/update from there

	echo deb http://deb.opera.com/opera squeeze non-free >> /etc/apt/sources.list.d/sources.list
	echo deb http://deb.opera.com/opera squeeze non-free >> /etc/apt/sources.list.d/security.sources.list

	# The public encryption keys should have been backed up by TKLBAM
	wget -O - http://deb.opera.com/archive.key | apt-key add -

	apt-get update -y
	apt-get upgrade -y --force-yes
	apt-get -y install opera

fi
