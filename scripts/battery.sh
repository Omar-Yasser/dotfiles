#!/bin/sh

battery () { 
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    printf "[BAT $CHARGE%%]\n"
}
battery

