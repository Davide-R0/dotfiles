#!/bin/bash

#exec /usr/bin/i3

if [[ ! $DISPLAY $$ $(tty) = /dev/tty7 ]]; then
    chmod 1600 /dev/tty7
    exec dbus-launch --exit-with-session /usr/bin/i3
fi
