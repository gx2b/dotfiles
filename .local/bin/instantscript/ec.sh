#!/bin/bash

# see also: https://github.com/windwp/rofi-color-picker.git

# help: ec  -> color picker

xclip -h 2>/dev/null || exit 1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LISTFILE="$DIR/resources/colors-name.txt"
[[ ! -f "$LISTFILE" ]] && echo "$LISTFILE not found" && exit 1

(($#>1)) && shift $((--OPTIND))

selected="$(cat "$LISTFILE" | rofi -dmenu -markup-rows -l 10 -width 20 -i -p Colors )"
[[ -z $selected ]] && exit 1

# get first xml tag
color="$(echo "$selected" | cut -d\' -f2)"
echo -n $color | xclip -selection clipboard
notify-send "$color copied to clipboard." &
