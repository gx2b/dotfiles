#!/bin/sh

# help: ee  -> insert emoji

xclip -h 2>/dev/null || exit 1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LISTFILE="$DIR/resources/emojis.txt"
[[ ! -f "$LISTFILE" ]] && echo "$LISTFILE not found" && exit 1

# rofi has better emoji support than dmenu because of libpango
chosen=$(cat $LISTFILE | rofi -dmenu -l 20 -width 30 -i -p Emojis | sed "s/ .*//")
[[ -z $chosen ]] && exit 1

# If you run this command with an argument, it will automatically insert the character.
if [ -n "$1" ]; then
	xdotool key Shift+Insert
else
	echo "$chosen" | tr -d '\n' | xclip -selection clipboard
	#echo "$chosen" | tr -d '\n' | xclip -selection primary
	notify-send "'$chosen' copied to clipboard." &
fi
