#!/bin/bash -e
# hooks are always called with two arguments
# Reset owner:group permissions

op=$1       # backup / restore
state=$2    # pre / post

if [ "$op" == "restore" ] && [ "$state" == "post" ]; then

# reset the owner and group for the Downloads folder
# and below - after a tklbam restore
chown admin:admin /home/admin/Downloads -R

fi
