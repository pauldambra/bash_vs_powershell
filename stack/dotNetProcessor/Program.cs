using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var lineCount = -3;
            var twentyTenLineCount = 0;
            var voteTypeCounts = new Dictionary<int, int>();

            var voteTypeRegex = new Regex(@"VoteTypeId=""(\d+)""");

            var lines = File.ReadLines(args[0]);
            foreach (var line in lines)
            {
                lineCount++;
                if (line.Contains("CreationDate=\"2010"))
                {
                    twentyTenLineCount++;
                    var matches = voteTypeRegex.Match(line);
                    var voteTypeId = int.Parse(matches.Groups[1].Value);
                    if (!voteTypeCounts.ContainsKey(voteTypeId)) {
                        voteTypeCounts[voteTypeId] = 0;
                    }
                    voteTypeCounts[voteTypeId]++;
                }
            }

            foreach(var pair in voteTypeCounts) {
                Console.WriteLine("VoteTypeId: {0} had {1} votes", pair.Key, pair.Value);
            }
            Console.WriteLine("there were {0} total votes in the file", lineCount);
            Console.WriteLine("here were {1} total votes in 2010", voteTypeCounts.Values.Sum());
        }
    }

//     time dotnet run ~/Downloads/Votes.xml
// Project dotNetProcessor (.NETCoreApp,Version=v1.0) was previously compiled. Skipping compilation.
// VoteTypeId: 2 had 4198861 votes
// VoteTypeId: 5 had 380887 votes
// VoteTypeId: 1 had 467439 votes
// VoteTypeId: 10 had 199344 votes
// VoteTypeId: 3 had 256759 votes
// VoteTypeId: 9 had 8578 votes
// VoteTypeId: 8 had 8632 votes
// VoteTypeId: 4 had 200 votes
// VoteTypeId: 11 had 13231 votes
// VoteTypeId: 12 had 535 votes
// VoteTypeId: 15 had 965 votes
// there were 105301745 total votes in the file
// here were 5535431 total votes in 2010
// dotnet run ~/Downloads/Votes.xml  52.02s user 6.18s system 97% cpu 59.684 total
}
