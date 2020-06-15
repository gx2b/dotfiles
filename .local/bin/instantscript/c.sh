#!/bin/bash

# help: c  -> toggle compositor

if pgrep xcompmgr; then
    notify-send 'compositing disabled'
    pkill xcompmgr
    exit
else
    notify-send 'compositing enabled'
    xcompmgr &
fi
