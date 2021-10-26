#!/bin/sh

volume () {
    VOL=$(pamixer --get-volume)    

    if [ "$VOL" = "muted" ] || [ "$VOL" -eq 0 ]; then
       printf "MUTE"
    else
    	printf "[VOL $VOL%%]"
    fi
}
volume
