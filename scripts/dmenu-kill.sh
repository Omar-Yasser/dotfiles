#!/bin/sh

selected="$(ps --user "$USER" -F | dmenu -i -l 15 -p "Search for process to kill:" "$@" | awk '{print $2" "$11}')";

if [[ -n $selected ]]; then
	kill -9 "${selected%% *}"
fi 

