from xml.dom import pulldom
import sys
import re

class Counter(dict):
    def __missing__(self, key):
        return 0

votes_file = open(sys.argv[1])
events = pulldom.parse(votes_file)

line_counter = 0
vote_types = Counter()

for (event, node) in events:
	if event == pulldom.START_ELEMENT:
		if node.tagName == "row":
			line_counter += 1

			if node.attributes['CreationDate'].value.startswith('2010'):
				vote_type_id = node.attributes['VoteTypeId'].value
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
# there were 105301745 total votes in the file
# there were 5535431 total votes in 2010
# python ./stack/process-votes.py ~/Downloads/Votes.xml  6735.11s user 59.94s system 99% cpu 1:53:16.95 total