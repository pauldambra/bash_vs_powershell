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
# VoteTypeId: 10 had 199344 votes
# VoteTypeId: 12 had 535 votes
# VoteTypeId: 15 had 965 votes
# VoteTypeId: 1 had 467439 votes
# VoteTypeId: 2 had 4198861 votes
# VoteTypeId: 5 had 380887 votes
# VoteTypeId: 3 had 256759 votes
# VoteTypeId: 4 had 200 votes
# VoteTypeId: 9 had 8578 votes
# VoteTypeId: 11 had 13231 votes
# there were 105301748 total votes in the file
# there were 5535431 total votes in 2010
# powershell stack/process-votes.ps1 ~/Downloads/Votes.xml  2124.55s user 19.96s system 99% cpu 35:52.29 total