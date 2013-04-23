#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013


LaunchUser=$USER


changefile="/home/$LaunchUser/.config/openbox/lxde-rc.xml"

search="<!-- Launch Task Manager with Ctrl+Alt+Del.*<\/keybind>";

replace="<!-- Launch screen lock and screen saver with Ctrl+Alt+Del -->\n\
  <keybind key=\"A-C-Delete\">\n\
      <action name=\"Execute\">\n\
          <command>xscreensaver-command -lock<\/command>\n\
      <\/action>\n\
  <\/keybind>\n\n";



sed -n '1h 
1!{
        # if the sought-after regex is not found, append the pattern space to hold space
        /'"$search"'/ !H
        # copy hold space into pattern space
        g
        # if the regex is found, then...
        /'"$search"'/ {
                # the regular expression
                s/'"$search"'/'"$replace"'/
                # print 
                p
                # read the next line into the pattern space
                n
                # copy the pattern space into the hold space
                h
        }
        # copy pattern buffer into hold buffer
        h
}
# if the last line then print
$p
' $changefile > $changefile.tmp;

mv -f $changefile.tmp $changefile;

Done