#!/bin/bash

# see also: https://github.com/windwp/rofi-color-picker.git

# help: ec  -> color picker

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LISTFILE="$DIR/colors-name.txt"
[[ ! -f "$LISTFILE" ]] && echo "$LISTFILE not found" && exit 1

(($#>1)) && shift $((--OPTIND))

ROFI_MAGIC='-dmenu -markup-rows'
selected="$(cat "$LISTFILE" | rofi ${ROFI_MAGIC} -p Colors )"

# Exit if nothing is selected
[[ -z $selected ]] && exit 1

# get first xml tag
color="$(echo "$selected" | cut -d\' -f2)"
echo -n $color | xclip -selection clipboard
notify-send "$color copied to clipboard." &
