import sys
import re

class Counter(dict):
    def __missing__(self, key):
        return 0

line_counter = 0
vote_types = Counter()

creation_date_regex = re.compile('CreationDate="2010')
vote_type_regex = re.compile('VoteTypeId=\"(\d+)\"')

with open(sys.argv[1], "r") as file:
    for line in file:
    	line_counter += 1
        if creation_date_regex.findall(line):
        	vote_type_id = vote_type_regex.findall(line)[0]
        	vote_types[vote_type_id] += 1

for key, value in vote_types.iteritems():
	print "VoteTypeId: %s had %s votes" % (key, value)

print "there were %s total votes in the file" % line_counter
print "there were %s total votes in 2010" % sum(vote_types.values())

# VoteTypeId: 11 had 13231 votes
# VoteTypeId: 10 had 199344 votes
# VoteTypeId: 12 had 535 votes
# VoteTypeId: 15 had 965 votes
# VoteTypeId: 1 had 467439 votes
# VoteTypeId: 3 had 256759 votes
# VoteTypeId: 2 had 4198861 votes
# VoteTypeId: 5 had 380887 votes
# VoteTypeId: 4 had 200 votes
# VoteTypeId: 9 had 8578 votes
# VoteTypeId: 8 had 8632 votes
# there were 105301748 total votes in the file
# there were 5535431 total votes in 2010
# python ./stack/process-votes.py ~/Downloads/Votes.xml  65.35s user 12.90s system 92% cpu 1:24.75 total

# Average after 1 runs is 64.33
# Average after 2 runs is 64.215
# Average after 3 runs is 64.3533
# Average after 4 runs is 64.73
# Average after 5 runs is 65.044
# Average after 6 runs is 65.115
# Average after 7 runs is 65.3243
# Average after 8 runs is 65.445
# Average after 9 runs is 65.5111
# Average after 10 runs is 65.397
# average execution is 65.397