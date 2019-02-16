function New-Scratch
{
    param(
        [Parameter(Position = 1)]
        [string] $Issue,
        [Parameter()]
        [string] $Name
    )

    if (Test-GitRepository)
    {
        $branchDetails = Get-BranchDetails
        $Issue = if ($Issue -ne $null) { $Issue } $branchDetails.Issue
        $Name = if ($Name -ne $null) { $Name } $branchDetails.Summary
    }

    if ($Issue)
    {
        $ticketDir = Get-Ticket -Issue $Issue
        if (!$ticketDir)
        {
            $ticketDir = New-Ticket $Issue -Name $Name | Select-Object -ExpandProperty FullName
        }

        $scratch = Join-Path $ticketDir "${Issue}-scratch.sql"
        if (!(Test-Path $scratch))
        {
            New-Item $scratch -ItemType File | Out-Null
        }

        Invoke-Item $scratch
    }
    else
    {
        throw "could not determine scratch path for issue ${Issue}"
    }
}
