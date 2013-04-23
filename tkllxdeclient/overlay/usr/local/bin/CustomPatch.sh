#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013

LaunchUser=$USER

clear

# Add a directory in the /home/admin/Downloads folder that doesn't get backed up by TKLBAM.
# This is for random downloads that don't need to be taking up TKLBAM space
echo " Creating the NoBackup folder"
echo " And excluding it from TKLBAM"
echo
sudo /usr/local/bin/NoBackup.sh "$LaunchUser"


# Exclude the VirtualBox Folders that contain the Virtual Machine Files
# These files can get very large
# Instead, backup the VMs through TKLBAM internaly on the VM
echo " Excluding the VirtualBox VM folders"
echo " This will save space on the TKLBAM backups"
echo
sudo /usr/local/bin/NoVirtualBoxFolders.sh "$LaunchUser"


# Set the key combination Ctrl+Alt+Del to lock the screen
echo " Setting your Ctrl+Alt+Del key combo to lock your screen"
echo " and launch the screen saver (Similar to MS Windows)."
sudo /usr/local/bin/CtrlAltDel.sh "$LaunchUser"


# Put my custom .sh quick launch file on the desktop
cp /usr/local/share/tkl/CustomPatch/QuickStart.desktop /home/$LaunchUser/Desktop


# Put a hooks.d file in place that re-estabishes
# the ownership of the NoBackup folder to $USER:$User
cp /usr/local/share/tkl/CustomPatch/CustomPatchReInstall.sh /etc/tklbam/hooks.d
chmod +x /etc/tklbam/hooks.d/CustomPatchReInstall.sh

