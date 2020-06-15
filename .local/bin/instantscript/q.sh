#!/usr/bin/env bash

[ ! -x /usr/bin/surfraw ] && exit 1

# help: qa -> Query archwiki
# help: qd -> Query duckduckgo
# help: qg -> Query github
# help: qq -> Query stockquote
# help: qs -> Query stackoverflow
# help: qS -> Query searx
# help: qt -> Query translate
# help: qu -> Query urban
# help: qw -> Query wikipedia
# help: qW -> Query wolfram
# help: qy -> Query youtube

letter=$1
declare -A provider

provider[a]="archwiki"
provider[d]="duckduckgo"
provider[g]="github"
provider[q]="stockquote"
provider[s]="stackoverflow"
provider[S]="searx"
provider[t]="translate"
provider[u]="urban"
provider[w]="wikipedia"
provider[W]="wolfram"
provider[y]="youtube"


scriptdir=~/.local/bin/instantscript
[ ! -d $scriptdir ] && exit 1

dmenu=/usr/local/bin/dmenu
[ ! -x $dmenu ] && exit 1

[ -z $letter ] && letter=$(echo ${!provider[@]} | sed -e 's/ /\n/g' | grep . | sort -u | $dmenu -p "Engine:" -F -n)

query=$(echo "" | $dmenu -p "Query ${provider[$letter]}:")
[ -z $query ] && exit 0

/usr/bin/surfraw ${provider[$letter]} $query

exit 0
