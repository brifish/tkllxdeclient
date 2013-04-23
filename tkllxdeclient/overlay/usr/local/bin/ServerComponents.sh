#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013


echo "... Uninstalling the \"server\" parts of the TKL Workstation ..."
echo
echo " This includes Webmin, confconsole, shellinabox and openssh-server."

apt-get -y purge webmin* confconsole shellinabox openssh-server 
rm -Rf /usr/share/webmin

rm -f /usr/local/share/applications/ConfConsole.desktop
rm -f /usr/local/share/applications/LocalWebmin.desktop
rm -f /usr/local/share/applications/LocalWebminTKLBAM.desktop


# Need to add a .sh file to remove the components from a TKLBAM restore as well?

