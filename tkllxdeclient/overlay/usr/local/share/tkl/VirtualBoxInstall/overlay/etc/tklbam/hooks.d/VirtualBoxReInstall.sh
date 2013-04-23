#!/bin/bash -e
# hooks are always called with two arguments

op=$1       # backup / restore
state=$2    # pre / post

if [ "$op" == "restore" ] && [ "$state" == "post" ]; then

	export DEBIAN_FRONTEND=noninteractive

	# Add source listing for the VirtualBox package
	echo deb http://download.virtualbox.org/virtualbox/debian squeeze contrib non-free >> /etc/apt/sources.list.d/sources.list
	echo deb http://download.virtualbox.org/virtualbox/debian squeeze contrib non-free >> /etc/apt/sources.list.d/security.sources.list


	# Make sure that the public encryption keys are here
	wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -

	# update and upgrade available packages from their repositories
	apt-get update -y
	apt-get upgrade -y --force-yes

	# Install virtual box and supporting packages
	apt-get -y install virtualbox-4.2

	# The users, groups and their membership should have been backed up by TKLBAM
	# adduser root vboxusers
	# adduser admin vboxusers

	# The TKL load will probably need dkms as well to help with kernel services for running the VM’s
	apt-get -y install dkms

	# The TKL may also need the headers package to get VM’s to load
	apt-get -y install linux-headers-$(uname -r) build-essential

fi
