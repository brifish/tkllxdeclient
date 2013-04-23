#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013

EditShortcut(){

	sed -i 's/'"$search"'/'"$replace"'/' "$changefile"

}


# Edit the synaptic shortcut
changefile="/usr/share/applications/synaptic.desktop"

search="su-to-root -X -c \/usr\/sbin\/synaptic"

replace="gksu \/usr\/sbin\/synaptic"

EditShortcut



# Edit the Users and Groups shortcut
changefile="/usr/share/applications/users.desktop"

search="users-admin"

replace="gksu users-admin"

EditShortcut



# Edit the Time and Date shortcut
changefile="/usr/share/applications/time.desktop"

search="Exec=time-admin"

replace="Exec=gksu time-admin"

EditShortcut



# Edit the Services shortcut
changefile="/usr/share/applications/services.desktop"

search="services-admin"

replace="gksu services-admin"

EditShortcut



# Edit the Network shortcut
changefile="/usr/share/applications/network.desktop"

search="network-admin"

replace="gksu network-admin"

EditShortcut

