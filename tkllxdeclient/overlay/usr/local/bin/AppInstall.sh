#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013


# display menu
ShowAppMenu() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo
	echo "Select the app that you would like to install"
	echo "This script will setup custom repositories (if needed),"
	echo "Download any needed public encryption keys (if needed),"
	echo "Set a few custom settings for backups/restores (if needed)."
	echo "See the TKLReadMe.html file for more info"
	echo ".... Select which app to install ...."
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Chromium (Open Source Chrome) Web Browser"
	echo "2. Chrome (Actual Google Chrome) Web Browser"
	echo "3. Ice Weasel (Debian Version of Firefox)"
	echo "4. Opera Web Browser"
	echo "5. uzbl Web Browser"
	echo "6. VirtualBox - Virtual Machine Manager"
	echo "7. Slim - Graphical Login Manager"
	echo "8. Exit - Don't install any"
	echo
	echo
}


# read input from the keyboard
ReadAppMenuOptions(){
	local choice
	local AppName
	local Desc
	local PatchLoc
	read -p "Enter choice [1-8] " choice
	case $choice in
		1) AppName="Chromium";
			Desc="Chromium is the open source Chrome Web Browser";
			PatchLoc=ChromiumInstall;
			InstallApp "$AppName" "$Desc" "$PatchLoc";;
		2) AppName="Chrome";
			Desc="Chrome Web Browser";
			PatchLoc=ChromeInstall;
			InstallApp "$AppName" "$Desc" "$PatchLoc";;
		3) AppName="Ice Weasel";
			Desc="Ice Weasel is the Debian FireFox Web Browser";
			PatchLoc=IceWeaselInstall;
			InstallApp "$AppName" "$Desc" "$PatchLoc";;
		4) AppName="Opera";
			Desc="Opera Web Browser";
			PatchLoc=OperaInstall;
			InstallApp "$AppName" "$Desc" "$PatchLoc";;
		5) AppName="uzbl";
			Desc="uzbl lightweight, keyboard based Web Browser";
			PatchLoc=uzblInstall;
			InstallApp "$AppName" "$Desc" "$PatchLoc";;
		6) AppName="VirtualBox";
			Desc="Virtual Box Virtual Machine Manager";
			PatchLoc=VirtualBoxInstall;
			InstallApp "$AppName" "$Desc" "$PatchLoc";;
		7) AppName="Slim";
			Desc="Slim Graphical Login Manager.\n This disables confconsole on boot.";
			PatchLoc=SlimInstall;
			InstallApp "$AppName" "$Desc" "$PatchLoc";;
		8) Nope;;
		*) Nope;;
	esac
}



# Install the selected app 
InstallApp(){

	local ApplicationName=$1
	local Description=$2
	local PatchLocation=$3
	
	echo
	echo $Description
	echo

	while true
	do
		echo
		read -p "Please confirm that you'd like to install $ApplicationName (Y/N) :" CONFIRM
		case $CONFIRM in
			y|Y|YES|yes|Yes) break ;;
			n|N|no|NO|No) Nope ;;
			*) echo Please enter only y or n;;
		esac
	done

	echo
	echo "To install, you need to use a sudo login."
	echo "This is your normal user login password."
	echo
	sudo tklpatch-apply / /usr/local/share/tkl/"$PatchLocation"

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
	echo "The Application installer has completed."
	read -p "Press the  [Enter] key to finish..." fackEnterKey
	exit 0

}



# -----------------------------------
# Main logic
# ------------------------------------
ShowAppMenu
ReadAppMenuOptions

