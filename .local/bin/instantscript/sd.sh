#!/usr/bin/env bash

# help: sd -> wait 5 seconds and take a full screen screenshot

f=$HOME/sd-$(date '+%Y%m%d%H%M%S').png

sleep 5
#import -window root $(xdg-user-dir PICTURES)/$(date '+%Y%m%d%H%M%S').png
import -window root $f

notify-send "Screenshot: $f " &
