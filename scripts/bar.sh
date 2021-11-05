#!/bin/sh

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

. "$DIR/memory.sh"
. "$DIR/battery.sh"
. "$DIR/backlight.sh"
. "$DIR/volume.sh"
. "$DIR/date_.sh"
. "$DIR/internetspeed.sh"
. "$DIR/cpu.sh"

while true
do
    upperbar=""
    upperbar="$upperbar$(internetspeed)"
    upperbar="$upperbar$(memory)"
    upperbar="$upperbar$(cpu)"
    upperbar="$upperbar$(battery)"
    upperbar="$upperbar$(backlight)"
    upperbar="$upperbar$(volume)"
    upperbar="$upperbar$(date_)"
 
    xsetroot -name "$upperbar"

    sleep 1
done
