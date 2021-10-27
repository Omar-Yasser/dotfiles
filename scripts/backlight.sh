#!/bin/sh

backlight () {
    printf "[☀%.0f%s]\n" "$(xbacklight)"
}
backlight
