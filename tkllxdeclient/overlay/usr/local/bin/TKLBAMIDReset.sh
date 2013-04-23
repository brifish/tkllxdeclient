#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013


Description="This script will remove the Turnkey Linux tklbam
HUB account association, ending the existing branch for this 
specific Backup ID. 

It will also re-initialize this system to the tklbam HUB,
setting it up with a new Backup ID and a new branch of 
backups specific to this machine.

You can even use it to associate this system's backup with
 another HUB account, if you wish to move the backup 
administration duties and costs to another user's HUB 
account for instance? 

The tklbam-init command will need a HUB API key
in order to re-associate it with a HUB account. 
You can find it by logging into your TKL HUB account.
http://hub.turkeylinux.org/";


PrintDescription(){
	clear
	echo
	echo "$Description"
	echo
}


ConfirmOrExit(){

	echo
	echo "Are you positive that you wish to re-initialize"
	echo "the Turnkey Hub Backup configuration for this system?"
	echo "Once this is done, you will not be able to undo it..."
	echo

	while true
	do
		read -p "Please confirm that you'd like to continue (Y/N) :" CONFIRM
		case $CONFIRM in
			y|Y|YES|yes|Yes) break ;;
			n|N|no|NO|No) Nope ;;
			*) echo Please enter only y or n;;
		esac
	done
}


Nope(){
	echo
	echo "You chose not to continue";
	read -p "Press the [Enter] key to finish..." AckEnterKey
	exit 0
}

 

ResetTKLBAMID(){
	echo
	echo "..... Old TKLBAM HUB association is being deleted ....."
	echo

	rm -rf /var/lib/tklbam

	echo
	echo "..... TKLBAM HUB account API is being re-established ....."
	echo

	tklbam-init
	
	# if the initialization needs to be forced,
	# tklbam-init --force
}



# -----------------------------------
# Main logic
# ------------------------------------
PrintDescription

ConfirmOrExit

ResetTKLBAMID


