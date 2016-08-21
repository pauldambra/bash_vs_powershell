Param ([string] $filePath = $null)

$reader = [System.IO.File]::OpenText($filePath)

$voteTypes = @{}
$lines=0
$twentyTenLines=0

while($null -ne ($line = $reader.ReadLine())) 
{
    $lines++

    $xml = [xml]$line
    if ($xml.CreationDate -match "^2010")
    {
        $script:twentyTenLines++
        $script:voteTypes[$xml.VoteTypeId]++
    }
}

foreach ($voteTypeCount in $voteTypes.GetEnumerator()) {
    Write-Host "VoteTypeId: $($h.Name) had $($h.Value) votes"
}

write-host "there were $($lines) total votes in the file"
write-host "there were $($twentyTenLines) total votes in 2010"
