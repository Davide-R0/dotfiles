#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
    echo "%{F#ff5555}%{F-}"
else
    if [ $(bluetoothctl | info | grep 'Device' | wc -c) -eq 0 ]
    then 
        echo "%{F#55aa55}󰂰%{F-}"
    else 
        echo "%{F#2193ff}%{F-}"
    fi 
fi
