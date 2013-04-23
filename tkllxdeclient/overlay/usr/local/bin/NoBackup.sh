#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013

LaunchUser=$1

# Create a folder in the Downloads folder that doesn't get backed up by TKLBAM
mkdir /home/$LaunchUser/Downloads

mkdir /home/$LaunchUser/Downloads/NoBackup

chown $LaunchUser:$LaunchUser /home/$LaunchUser/Downloads -R


changefile="/etc/tklbam/overrides"

search="/mnt/images"

replace="\n\
-/home/$LaunchUser/Downloads/NoBackup/*";


# Add the $replace folder to the TKLBAM overrides file to EXCLUDE it from being backed up
sed -i 's|'"$search"'|&'"$replace"'|' "$changefile"


