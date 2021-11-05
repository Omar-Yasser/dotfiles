#!/bin/sh

cpu () {
	cpu=$[100-$(vmstat 1 2 | tail -1 | awk '{print $15}')]
	printf "[CPU "$cpu"%%]\n"
}
cpu
