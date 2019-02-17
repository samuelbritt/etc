function Get-GitBranch
{
    param ([string] $Issue, [switch] $All)
    $branches = git branch

    if ($All)
    {
        $branches = git branch -a
    }

    $branches = $branches | Select-String "${Issue}-"
    if ($branches)
    {
        $branches | ForEach-Object { $_.ToString().Trim(' *').Replace('remotes/', '') }
    }
}
