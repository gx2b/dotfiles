#!/bin/sh

# to get the options, use arandr

# Left:  DVI-I-1  1920x1200 (scaled by 1.5)
# Front: DP-1     3840x2160 (HiDPI)

xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DVI-I-1 --scale 1.5x1.5 --mode 1920x1200 --pos 0x0 --output DVI-I-0 --off \
       --output DP-1 --scale 1x1 --mode 3840x2160 --pos 2880x0 --rotate normal --output DP-0 --off
