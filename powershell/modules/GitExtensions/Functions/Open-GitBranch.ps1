function Open-GitBranch
{
    param ([string] $Issue)
    Set-StrictMode -Version Latest

    $branches = @(Get-Branch -Issue $Issue -All |
            Where-Object { $_ } |
            ForEach-Object { $_ -replace '^origin/' } |
            Select-Object -Unique)

    if (-not $branches)
    {
        Write-Error "Could not find branch for issue $Issue."
        return
    }

    if ($branches.Count -gt 1)
    {
        $msg = "Found more than one branch for issue ${Issue}:`n"
        $msg += ($branches | Out-String)
        Write-Error $msg
        return
    }

    $branchToCheckout = $branches[0]
    if ($branchToCheckout -ne (Get-CurrentBranch))
    {
        git checkout $branchToCheckout
    }
}