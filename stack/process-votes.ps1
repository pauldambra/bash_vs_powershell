Param ([string] $filePath = $null)

$reader = [System.IO.File]::OpenText($filePath)

$voteTypes = @{}
$lines=-3
$twentyTenLines=0

while($null -ne ($line = $reader.ReadLine())) 
{
    $lines++
    if ($line -match "CreationDate=""2010")
    {
        $xml = [xml]"$line"
        $twentyTenLines++
        $voteTypes[$xml.row.VoteTypeId]++
    }
}

foreach ($voteTypeCount in $voteTypes.GetEnumerator()) {
    Write-Host "VoteTypeId: $($voteTypeCount.Name) had $($voteTypeCount.Value) votes"
}

write-host "there were $($lines) total votes in the file"
write-host "there were $($twentyTenLines) total votes in 2010"

# VoteTypeId: 8 had 8632 votes
# VoteTypeId: 4 had 200 votes
# VoteTypeId: 12 had 535 votes
# VoteTypeId: 1 had 467439 votes
# VoteTypeId: 10 had 199344 votes
# VoteTypeId: 3 had 256759 votes
# VoteTypeId: 9 had 8578 votes
# VoteTypeId: 11 had 13231 votes
# VoteTypeId: 2 had 4198861 votes
# VoteTypeId: 5 had 380887 votes
# VoteTypeId: 15 had 965 votes
# there were 105301745 total votes in the file
# there were 5535431 total votes in 2010
# powershell ./process-votes.ps1 ~/Downloads/Votes.xml  279.78s user 7.00s system 99% cpu 4:49.45 total

# Average after 1 runs is 279.29
# Average after 2 runs is 277.74
# Average after 3 runs is 275.38
# Average after 4 runs is 276.565
# Average after 5 runs is 276.33
# Average after 6 runs is 276.645
# Average after 7 runs is 275.7
# Average after 8 runs is 277.216
# Average after 9 runs is 276.622
# Average after 10 runs is 276.593
# average execution is 276.593