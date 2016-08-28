#! /bin/bash

set -e

total=0

function average {
	awk "BEGIN {print $1/$2; exit}"
}

for i in {1..10};
do
	# throw away output from central command
	# redirect stderr (cos that is what time outputs on)
	# and store that output
    output=$( time -p (powershell ./stack/process-votes.ps1 ~/Downloads/Votes.xml 1>&2) 2>&1 )
    seconds=$(grep "real" <<< "$output" | awk '{print $NF}')
    total=$(awk "BEGIN {print $total+$seconds; exit}")
    echo "Average after $i runs is $(average $total $i)"
done

avg=$(awk "BEGIN {print $total/10; exit}")
echo "average execution is $(average $total 10)"