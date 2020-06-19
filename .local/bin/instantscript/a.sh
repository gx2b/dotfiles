#!/usr/bin/env bash

# help: aq -> move window to tag and follow
# help: aw -> move window to tag
# help: ae -> window toggle tag
# help: aa -> move window to tag and follow (next monitor)
# help: aA -> move window to tag and follow (prev monitor)
# help: as -> move window to tag (next monitor)
# help: aS -> move window to tag (prev monitor)

scriptdir=~/.local/bin/instantscript
[ ! -d $scriptdir ] && exit 1

dmenu=/usr/local/bin/dmenu
[ ! -x $dmenu ] && exit 1

declare -A description
description[a]="Move to tag (next monitor):"
description[s]="Move and follow to tag (next monitor):"
description[A]="Move to tag (prev monitor):"
description[S]="Move and follow to tag (prev monitor):"
description[q]="Move and follow to tag:"
description[w]="Move to tag:"
description[e]="Toggle tag:"

action=$1
if [ -z $action ]; then
    action=$(printf "h\na\nA\ns\nS\nq\nw\ne\n" | dmenu -p "Action (h=help):" -n -F)
    [ $action = "h" ] && action=$(grep "^# help:" $0  | sed -e 's/^# help: .//' | dmenu -l 10 -p "Action (h=help):" -n -F)
fi
tag=$(printf "1\n2\n3\n4\n5\n6\n7\n8\n9" | dmenu -p "${description[$action]}" -n -F)
tag=$((tag-1))


case "${action:0:1}" in
    q)
        xsetroot -name "fsignal:tagex i $tag" && xsetroot -name "fsignal:view i $tag"
        ;;
    w)
        xsetroot -name "fsignal:tagex i $tag"
        ;;
    e)
        xsetroot -name "fsignal:toggletagex i $tag"
        ;;
    a)
        xsetroot -name "fsignal:tagnextmonex i $tag" && xsetroot -name "fsignal:focusmon i 1" && xsetroot -name "fsignal:view i $tag"
        ;;
    A)
        xsetroot -name "fsignal:tagprevmonex i $tag" && xsetroot -name "fsignal:focusmon i 1" && xsetroot -name "fsignal:view i $tag"
        ;;
    s)
        xsetroot -name "fsignal:tagnextmonex i $tag"
        ;;
    S)
        xsetroot -name "fsignal:tagprevmonex i $tag"
        ;;
esac

exit 0
