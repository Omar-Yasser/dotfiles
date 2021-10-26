#!/bin/sh

usbdrives="$(lsblk -rpo "name,type,size,mountpoint" | grep 'part\|rom' | awk '$4==""{printf "%s (%s)\n",$1,$3}')"

if [ -z "$usbdrives" ]; then
	echo "Cancel" | dmenu -l 1 -p "No usb drives detected"
else
	chosen="$(echo "$usbdrives" | dmenu -i -l 3 -p "Mount which drive?")" || exit 1
	chosen="$(echo "$chosen" | awk '{print $1}')"
	sudo -A mount "$chosen" 2>/dev/null && exit 0
	partitiontype="$(lsblk -no "fstype" "$chosen")"
	case "$partitiontype" in
		"vfat") sudo -A mount -t vfat "$chosen" /media -o rw,umask=0000;;
		"exfat") sudo -A mount "$chosen" /media -o uid="$(id -u)",gid="$(id -g)";;
		*) sudo -A mount "$chosen" /media; user="$(whoami)"; ug="$(groups | awk '{print $1}')"; sudo -A chown "$user":"$ug" /media;;
	esac
fi
