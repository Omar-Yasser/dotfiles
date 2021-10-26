#!/bin/bash

selected=$(echo -e "Shutdown\nReboot\nLock" | dmenu -l 3 -p "Options")

case $selected in
	Shutdown) systemctl poweroff ;;
	Reboot) systemctl reboot ;;
	Lock) slock ;;
	*) exit 1 ;;
esac
