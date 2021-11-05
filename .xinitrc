#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


setxkbmap -option 'grp:alt_shift_toggle' -layout us,ara 
xrandr --output HDMI-1 --mode 1920x1080 
systemctl --user import-environment DISPLAY  
nitrogen --restore 
numlockx 
picom & 
sxhkd &
clipmenud &
xautolock -time 15 -locker slock -detectsleep -corners 000- &
/home/pseudomar/scripts/bar.sh & 

## my touchpad options
# tapping enabled
xinput set-prop 10 323 1 
# natural scrolling enabled
xinput set-prop 10 331 1 

exec dwm
