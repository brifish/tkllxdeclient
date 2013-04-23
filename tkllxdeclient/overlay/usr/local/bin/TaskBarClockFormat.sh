#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013


LaunchUser=$1

 
# function to display menus
ShowMenus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo
	echo "This Script will set or reset the Clock format"
	echo "located on the lower right-hand corner"
	echo "of your LXDE taskbar."
	echo
	echo "What Format would you like your taskbar clock to be in?"
	echo
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Thu 21 Mar 2013 11:57:43 PM PDT"
	echo "2. Thursday 03/21/13 11:57 PM"
	echo "3. Thu 03/21/13 11:57 PM"
	echo "4. 03/21/2013 11:57 PM"
	echo "5. Thursday 11:57 PM"
	echo "6. Thu 11:57 PM"
	echo "7. 11:57 PM"
	echo "8. Thursday 03/21/13 23:57"
	echo "9. Thu 03/21/13 23:57"
	echo "10. 03/21/13 23:57"
	echo "11. Thursday 23:57"
	echo "12. Thu 23:57"
	echo "13. LXDE Default - 23:57"
	echo "14. exit with no change"
}


# read input from the keyboard and take a action
ReadOptions(){
	local choice
	read -p "Enter choice [1-13] " choice
	case $choice in
		1) DisplayFormat="Thu 21 Mar 2013 11:57:43 PM PDT"
			TimeFormat="%c"
			SetTimeFormat;;
		2) DisplayFormat="Thursday 03/21/13 11:57 PM"
			TimeFormat="%A %x %l:%M %p"
			SetTimeFormat;;
		3) DisplayFormat="Thu 03/21/13 11:57 PM"
			TimeFormat="%a %x %l:%M %p"
			SetTimeFormat;;
		4) DisplayFormat="03/21/2013 11:57 PM"
			TimeFormat="%x %l:%M %p"
			SetTimeFormat;;
		5) DisplayFormat="Thursday 11:57 PM"
			TimeFormat="%A %l:%M %p"
			SetTimeFormat;;
		6) DisplayFormat="Thu 11:57 PM"
			TimeFormat="%a %l:%M %p"
			SetTimeFormat;;
		7) DisplayFormat="11:57 PM"
			TimeFormat="%l:%M %p"
			SetTimeFormat;;
		8) DisplayFormat="Thursday 03/21/13 23:57"
			TimeFormat="%A %x %R"
			SetTimeFormat;;
		9) DisplayFormat="Thu 03/21/13 23:57"
			TimeFormat="%a %x %R"
			SetTimeFormat;;
		10) DisplayFormat="03/21/13 23:57"
			TimeFormat="%x %R"
			SetTimeFormat;;
		11) DisplayFormat="Thursday 23:57"
			TimeFormat="%A %R"
			SetTimeFormat;;
		12) DisplayFormat="Thu 23:57"
			TimeFormat="%a %R"
			SetTimeFormat;;
		13) DisplayFormat="LXDE Default - 23:57"
			TimeFormat="%R"
			SetTimeFormat;;
		14) Nope;;
		*) echo -e "${RED}Error...${STD}"
			Nope;;
	esac
}
 
 
SetTimeFormat(){
	echo
	echo "setting time format to \"$DisplayFormat\""
	echo

	# sed edit config file
	changefile="/home/$LaunchUser/.config/lxpanel/LXDE/panels/panel"

	search="ClockFmt=.*"

	replace="ClockFmt=$TimeFormat"

	sudo sed -i 's/'"$search"'/'"$replace"'/' "$changefile"

	# restart the LXDE panel to display the change
	lxpanelctl restart
	
}


Nope(){
	echo
	echo "You chose not to continue";
	read -p "Press the [Enter] key to finish..." fackEnterKey
	exit 0
}


# -----------------------------------
# Main logic
# ------------------------------------
ShowMenus
ReadOptions

