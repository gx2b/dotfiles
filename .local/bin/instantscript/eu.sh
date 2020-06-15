#!/bin/bash

# see also: https://github.com/windwp/rofi-color-picker.git

# help: eu  -> unicode picker

xclip -h 2>/dev/null || exit 1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LISTFILE="$DIR/resources/unicode.txt"
[[ ! -f "$LISTFILE" ]] && echo "$LISTFILE not found" && exit 1

(($#>1)) && shift $((--OPTIND))

selected="$(cat "$LISTFILE" | grep U+ | rofi -dmenu -markup-rows -l 30 -width 40 -i -p Unicode )"
[[ -z $selected ]] && exit 1

# get first xml tag
character="$(echo "$selected" | cut -d' ' -f1)"
echo -n $character | xclip -selection clipboard
notify-send "'$character' copied to clipboard." &
