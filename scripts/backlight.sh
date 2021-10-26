#!/bin/sh

backlight () {
    printf "%s☀ %.0f%s\n" "[$(xbacklight)]"
}
backlight
