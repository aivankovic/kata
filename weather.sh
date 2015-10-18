#!/bin/bash


awk '
$1 ~ /^[0-9]/  {#print $2, $3
		diff=$2-$3
		tempdiff[$1]=diff
		#print diff 
		}
END {for (i in tempdiff) print i,tempdiff[i]}

' $1 | sort -nk 2 | head -1

