#!/bin/sh

memory () {
	free_output=$(free -h | grep Mem)
	MEMUSED=$(echo $free_output | awk '{print $3}')
	MEMTOT=$(echo $free_output | awk '{print $2}')
	printf "[$MEMUSED""/""$MEMTOT""]\n"
}
memory
