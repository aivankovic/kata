#!/bin/bash


awk '
function abs(value)
{
 return (value<0?-value:value);
}

$1 ~ /^[0-9]/  {diff=abs($9-$7)
		tempdiff[$1]=diff
		team[$1]=$2
		}

END {for (i in tempdiff) print i,tempdiff[i], team[i]}

' $1 | sort -nk 2 | head -1 |  cut -d ' ' -f 3

