function Get-Scratch
{
    param(
        [Parameter(Position = 1)]
        [string] $Issue,
        [string] $Path = "$HOME\usr\tasks"
    )

    if (Test-GitRepository)
    {
        $branchDetails = Get-BranchDetails
        $Issue = if ($Issue -ne $null) { $Issue } $branchDetails.Issue
    }

    if ($Issue)
    {
        $ticketDir = Get-Ticket -Issue $Issue

        if ($ticketDir)
        {
            $scratch = Join-Path $ticketDir "${Issue}-scratch.sql"

            if (Test-Path $scratch)
            {
                Get-Item $scratch
            }
        }
        else
        {
            Write-Warning "no task directory found for $Issue"
        }
    }
}
