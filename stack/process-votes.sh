#! /bin/bash

set -e

TWENTYTENREGEX="CreationDate=\"2010"

LINES=$(wc -l < $1)
TWENTYTENLINES=$(grep $TWENTYTENREGEX $1)

wait

VOTETYPEFILE=$(mktemp)
trap "rm -f $temp_file" 0 2 3 15

(
	declare -a VOTETYPES

	while read line ; do
	    voteTypeRegex="VoteTypeId=\"([0-9]+)\""
	    if [[ $line =~ $voteTypeRegex ]]; then 
	        VoteTypeId="${BASH_REMATCH[1]}"
	        ((VOTETYPES[VoteTypeId]++))
	    fi
	done <<<"$TWENTYTENLINES"

	for k in "${!VOTETYPES[@]}"
	do
	  echo "VoteTypeId: $k had ${VOTETYPES[$k]} votes\n" >> $VOTETYPEFILE 
	done
)

wait

TWENTYTENCOUNT=$(echo "$TWENTYTENLINES" | wc -l)

echo -e $(cat $VOTETYPEFILE)
echo "there were $LINES total votes in the file"
echo "there were $TWENTYTENCOUNT total votes in 2010"

#  `time ./process-votes.sh ~/Downloads/Votes.xml`
# VoteTypeId: 1 had 467439 votes
#  VoteTypeId: 2 had 4198861 votes
#  VoteTypeId: 3 had 256759 votes
#  VoteTypeId: 4 had 200 votes
#  VoteTypeId: 5 had 380887 votes
#  VoteTypeId: 8 had 8632 votes
#  VoteTypeId: 9 had 8578 votes
#  VoteTypeId: 10 had 199344 votes
#  VoteTypeId: 11 had 13231 votes
#  VoteTypeId: 12 had 535 votes
#  VoteTypeId: 15 had 965 votes

# there were  105301747 total votes in the file
# there were  5535431 total votes in 2010
# ./process-votes.sh ~/Downloads/Votes.xml  719.24s user 55.83s system 101% cpu 12:46.44 total