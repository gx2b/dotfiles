#!/bin/sh

# help: e  -> insert emoji

# Must have xclip installed to even show menu.
xclip -h 2>/dev/null || exit 1

# rofi hat libpango support
chosen=$(cat ~/.cache/emojis.txt | rofi -dmenu -l 20 -width 30 -i | sed "s/ .*//")

[ "$chosen" != "" ] || exit

# If you run this command with an argument, it will automatically insert the character.
if [ -n "$1" ]; then
	xdotool key Shift+Insert
else
	echo "$chosen" | tr -d '\n' | xclip -selection clipboard
	#echo "$chosen" | tr -d '\n' | xclip -selection primary
	notify-send "'$chosen' copied to clipboard." &
fi
