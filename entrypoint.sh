#!/bin/sh -e

# Configure DBUS
mkdir -p /var/run/dbus
dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address

avahi-daemon &

/go/bin/gcp-cups-connector --log-to-console
