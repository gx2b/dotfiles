#!/bin/sh

# xinitrc runs automatically when you run startx.

# source .xprofile if exists
[ -f ~/.xprofile ] && . ~/.xprofile

# start dwm, see https://dwm.suckless.org/patches/selfrestart/
while :; do
    [ -z $(pidof xinit) ] && exit 1
	ssh-agent dwm
done
