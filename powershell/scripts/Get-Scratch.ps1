param(
    [Parameter(Position = 1)]
    [string] $Issue,
    [string] $Path = "$HOME\usr\tasks"
)

if (-not $Issue)
{
    $branchDetails = Get-BranchDetails
    $Issue = $branchDetails.Issue
}

if ($Issue)
{
    $taskDir = Get-ChildItem $Path\$Issue* | Select-Object -First 1

    if ($taskDir)
    {
        $scratch = Join-Path $taskDir 'scratch.sql'
        if (Test-Path $scratch)
        {
            Invoke-Item $scratch
        }
        else
        {
            New-Scratch -Issue $Issue -Path $Path
        }
    }
    else
    {
        Write-Warning "no task directory found for $Issue"
    }
}