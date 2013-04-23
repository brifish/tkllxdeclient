#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013

 
# function to display menu
ShowMenus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo
	echo "This script will set your system locale to either"
	echo "en_US.UTF-8 or back to default."
	echo "Among other things, en_US.UTF-8 will set"
	echo "the default file>save type in leafpad to UTF-8."
	echo
	echo "Which locale would you like to set?"
	echo
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1. en_US.UTF-8"
	echo "2. Default Locale"
	echo "3. Exit - no change"
}

# read input from the keyboard and take a action
ReadOptions(){
	local choice
	read -p "Enter choice [1-3] " choice
	case $choice in
		1) SetLocaleUS;;
		2) SetLocaleDefault;;
		3) Nope;;
		*) Nope;;
	esac
}
 
 
SetLocaleUS(){


	# echo "You will have to login as sudo in order to set the system locale"
	# echo
	
	sh -c 'echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen'
	locale-gen
	update-locale LC_ALL=en_US.UTF-8
	
	echo
	echo "The locale has been set."
	echo "You will need to log out and log back in"
	echo "For the setting to take effect."
	echo
	
}

SetLocaleDefault(){
	
	# echo "You will have to login as sudo in order to set the system locale"
	# echo
	
	update-locale LC_ALL=C
	
	echo
	echo "The locale has been set."
	echo "You will need to log out and log back in"
	echo "For the setting to take effect."
	echo
}




Nope(){
	echo
	echo "You chose not to continue";
	read -p "Press the [Enter] key to finish..." AckEnterKey
	exit 0
}


# -----------------------------------
# Main logic
# ------------------------------------
PrintDescription
ShowMenus
ReadOptions

