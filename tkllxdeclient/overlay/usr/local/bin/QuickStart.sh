#! /bin/bash

filezilla &

VirtualBox %U &

# I use Chrome
google-chrome %U &

# I like to get two tabs going in file manager
gksu /usr/bin/pcmanfm "/home/$USER/"
gksu /usr/bin/pcmanfm "/home/$USER/Desktop/"

gksu /usr/bin/x-terminal-emulator &

