#! /bin/bash

set -e

non_data_lines_count=3
lines=$(( $(wc -l < $1) - $non_data_lines_count ))

twenty_ten_regex="CreationDate=\"2010"
vote_type_regex="VoteTypeId=\"([0-9]+)\""

declare -a vote_types

while read line ; do
    if [[ $line =~ $vote_type_regex ]]; then 
        vote_type_id="${BASH_REMATCH[1]}"
        ((vote_types[vote_type_id]++))
    fi
done < <(grep $twenty_ten_regex $1)

twenty_ten_count=0
for k in "${!vote_types[@]}"
do
  twenty_ten_count=$(($twenty_ten_count + vote_types[$k]))
  echo "VoteTypeId: $k had ${vote_types[$k]} votes"
done

echo "there were $lines total votes in the file"
echo "there were $twenty_ten_count total votes in 2010"

# VoteTypeId: 1 had 467439 votes
# VoteTypeId: 2 had 4198861 votes
# VoteTypeId: 3 had 256759 votes
# VoteTypeId: 4 had 200 votes
# VoteTypeId: 5 had 380887 votes
# VoteTypeId: 8 had 8632 votes
# VoteTypeId: 9 had 8578 votes
# VoteTypeId: 10 had 199344 votes
# VoteTypeId: 11 had 13231 votes
# VoteTypeId: 12 had 535 votes
# VoteTypeId: 15 had 965 votes
# there were 105301744 total votes in the file
# there were 5535431 total votes in 2010
# ./process-votes.sh ~/Downloads/Votes.xml  581.57s user 408.41s system 105% cpu 15:36.35 total