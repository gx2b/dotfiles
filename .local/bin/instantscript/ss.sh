#!/usr/bin/env bash

# help: ss -> Screenshot von Selektion

f=$HOME/ss-$(date '+%Y%m%d%H%M%S').png

slop=$(slop -f "%g") || exit 1
read -r G < <(echo "$slop")

#import -window root -crop "$G" $(xdg-user-dir PICTURES)/$(date '+%Y%m%d%H%M%S').png
import -window root -crop "$G" $f
notify-send "Screenshot: $f " &
