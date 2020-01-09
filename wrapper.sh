#/bin/bash
dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address --fork
avahi-daemon -D
avahi-dnsconfd -D
node bin/cmd.js "$@"