function New-Scratch
{
    param(
        [Parameter(Position = 1)]
        [string] $Issue
    )
    
    if (-not $Issue)
    {
        $branchDetails = Get-BranchDetails
        $Issue = $branchDetails.Issue
    }
    
    if ($Issue)
    {
        $ticketDir = Get-Ticket -Issue $Issue
    
        if (-not $ticketDir)
        {
            $ticketDir = New-Ticket $Issue | Select-Object -ExpandProperty FullName
        }
    
        if ($ticketDir)
        {
            $scratch = Join-Path $ticketDir "${Issue}-scratch.sql"
            if (-not (Test-Path $scratch))
            {
                New-Item $scratch -ItemType File | Out-Null
                Invoke-Item $scratch
            }
        }
        else
        {
            Write-Warning "no ticket directory found for $Issue"
        }
    }
}
