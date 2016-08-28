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
}
