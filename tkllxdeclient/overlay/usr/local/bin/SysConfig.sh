#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013


LaunchUser=$USER

 
# display menu
ShowAppMenu() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo
	echo " This script will make system configuration changes."
	echo " These are tasks that may help get your workstation"
	echo " up and running quicker and easier."
	echo " .... Select which changes you'd like to make ...."
	echo
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " 1. Reset Your Password"
	echo " 2. Set the System Timezone and sync with NTP"
	echo " 3. Set the Taskbar Clock Display"
	echo " 4. Set the System Locale to US English"
	echo " 5. Reset The System's TKLBAM ID"
	echo " 6. Remove the TKL Core server components"
	echo " 7. Exit without making changes"
	echo
	echo
}


# read input from the keyboard
ReadAppMenuOptions(){
	local choice
	local AppName
	local Desc
	local PatchLoc
	read -p "Enter choice [1-7] " choice
	case $choice in
		1) TaskName="Password Reset";
			Desc="This script will walk you through reseting your password";
			TaskScript="PasswordReset.sh";
			SysChange "$TaskName" "$Desc" "$TaskScript";;
		2) TaskName="Set Timezone";
			Desc="Set your System Timezone and sync with a Time Server";
			TaskScript="tz.sh";
			SysChange "$TaskName" "$Desc" "$TaskScript";;
		3) TaskName="Set Clock Format";
			Desc="Set the way that your taskbar clock is formatted";
			TaskScript="TaskBarClockFormat.sh";
			SysChange "$TaskName" "$Desc" "$TaskScript";;
		4) TaskName="Set System Locale";
			Desc="Set your system locale. This will affect default file saves";
			TaskScript="SetLocaleUS.sh";
			SysChange "$TaskName" "$Desc" "$TaskScript";;
		5) TaskName="Reset TKLBAM ID";
			Desc="Delete and create a new TKLBAM ID for this system";
			TaskScript="TKLBAMIDReset.sh";
			SysChange "$TaskName" "$Desc" "$TaskScript";;
		6) TaskName="Remove the TKL Core Server components";
			Desc="Un-install Webmin, confconsole, shellinabox and openssh-server.";
			TaskScript="ServerComponents.sh";
			SysChange "$TaskName" "$Desc" "$TaskScript";;
		7) Nope;;
		*) Nope;;
	esac
}



# Install the selected app 
SysChange(){

	local Task=$1
	local Description=$2
	local TaskLocation=$3
	
	echo
	echo $Description
	echo

	while true
	do
		echo
		read -p "Please confirm that you'd like to run the $Task task (Y/N) :" CONFIRM
		case $CONFIRM in
			y|Y|YES|yes|Yes) break ;;
			n|N|no|NO|No) Nope ;;
			*) echo Please enter only y or n;;
		esac
	done

	echo	
	echo "To make this change, you may need to use a sudo login."
	echo "If so, this is your normal user login password."
	echo
	sudo /usr/local/bin/"$TaskLocation" "$LaunchUser"

	Done

}



Nope(){

	echo
	echo "You chose not to continue";
	read -p "Press the [Enter] key to finish..." fackEnterKey
	exit 0

}



Done(){

	echo
	echo "The System Configuration is complete."
	read -p "Press the  [Enter] key to finish..." fackEnterKey
	exit 0

}


# -----------------------------------
# Main logic
# ------------------------------------
ShowAppMenu
ReadAppMenuOptions

