#! /bin/bash

set -e

LASTCOMMIT=0

for commit in `git rev-list master --reverse`
do
	`git checkout $commit &> /dev/null`
    lines=$(wc -l < big-data.txt)
    linediff=`expr $lines - $LASTCOMMIT`
    if [[ $linediff -gt 10 ]]; then
    	echo "this is the bad commit $commit"
    	break
    fi

    LASTCOMMIT=$lines
done

`git checkout master &> /dev/null`

# 26 minutes including figuring out what git commands to run 