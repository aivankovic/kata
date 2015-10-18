#!/bin/bash 


while getopts "wf" opt; do
  case $opt in
    w)
      WEATHER=1
      inputfile=$2
      ;;
    f)
      FOOTBALL=1
      inputfile=$2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "Usage:" >&2
      echo "	-w file   : weather  file parsing" >&2
      echo "	-f file   : football file parsing" >&2
      exit
      ;;
  esac
done

if [ ! -f $inputfile ]; then
    echo "$inputfile File not found!"
    exit -1
fi

if [ "$WEATHER" == 1 ]
then
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

' $inputfile | sort -nk 2 | head -1 |  cut -d ' ' -f 3


elif [ "$FOOTBALL" == 1 ]
then 

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

' $inputfile | sort -nk 2 | head -1 |  cut -d ' ' -f 3


fi
