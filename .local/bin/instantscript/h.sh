#!/bin/sh

# help: h  -> Hilfe

scriptdir=~/.local/bin/instantscript

cd $scriptdir
choice=$(egrep -h "^# help: " *.sh | sed -e 's/^# help: //' | sort -u| dmenu -l 30)

p1=${choice:0:1}
p2=${choice:1:1}

[ $p1 = "h" ] && exit 0

s1=$scriptdir/${p1}${p2}.sh
s2=$scriptdir/${p1}.sh

[ -x $s1 ] && bash $s1
[ -x $s2 ] && bash $s2 $p2
