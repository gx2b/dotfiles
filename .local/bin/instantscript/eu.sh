#!/bin/bash

# Unicode table from: https://gist.github.com/ivandrofly/0fe20773bd712b303f78

# help: eu  -> unicode picker

xclip -h 2>/dev/null || exit 1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LISTFILE="$DIR/resources/unicode.txt"
[[ ! -f "$LISTFILE" ]] && echo "$LISTFILE not found" && exit 1

selected="$(cat "$LISTFILE" | grep U+ | rofi -dmenu -l 30 -width 40 -i -p Unicode )"
[[ -z $selected ]] && exit 1

# get first xml tag
character="$(echo "$selected" | cut -d' ' -f1)"
echo -n $character | xclip -selection clipboard
notify-send "'$character' copied to clipboard." &
