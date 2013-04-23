#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013
# This script can add files/folders to the TKLBAM default list
# of files/folders to backup.

changefile="/etc/tklbam/overrides"

search="/mnt/images"

# Edit here to add more files/folders to the default TKLBAM backup
replace="\n\
/usr/share/desktop-directories\n\
/usr/share/lxde/images\n\
/usr/share/lxde/wallpapers";


# Add the $replace folder to the TKLBAM overrides file to EXCLUDE it from being backed up
sed -i 's|'"$search"'|&'"$replace"'|' "$changefile"


