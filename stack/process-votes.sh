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