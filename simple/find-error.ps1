
$lastcommit = 0

foreach ($commit in iex "git rev-list master --reverse")
{ 
    iex "git checkout $commit" *> $null

    $lines=(iex "wc -l big-data.txt").Split(" ", [System.StringSplitOptions]::RemoveEmptyEntries)
    $linediff = $lines[0] - $lastcommit
    
    if ($linediff -gt 10) 
    {
        write-host "this is the bad commit $($commit)"
        break
    }

    $lastcommit = $lines[0]
}

iex "git checkout master" *> $null

# 23 minutes without having to figure out commands to run