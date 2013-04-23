#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013
# Set the system timezone by walking the user through
# the tzselect utility.
# Sync the system with an ntp server

timezone=$(sudo /usr/bin/tzselect)

echo $timezone
echo

sudo rm /etc/localtime
sudo ln -sf /usr/share/zoneinfo/$timezone /etc/localtime

echo synching with an Internet time server.
echo this may take a moment...

sudo ntpdate pool.ntp.org

lxpanelctl restart

echo
echo TKLClient MSG -- You don\'t have to edit any files or log out.
echo The timezone has been set to $timezone for you.


