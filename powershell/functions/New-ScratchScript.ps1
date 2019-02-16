function New-ScratchScript
{
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [string] $Issue,
        [Parameter()]
        [string] $Name = "scratch"
    )
    Set-StrictMode -Version Latest

    if (Test-GitRepository)
    {
        $branchDetails = Get-BranchDetails
        $Issue = if ($Issue) { $Issue } else { $branchDetails.Issue }
        $ticketDirectoryName = $branchDetails.Summary
    }

    if ($Issue)
    {
        $ticketDir = Get-Ticket -Issue $Issue
        if (!$ticketDir)
        {
            $ticketDir = New-Ticket $Issue -Name $ticketDirectoryName | Select-Object -ExpandProperty FullName
        }

        $Name = $Name.Replace(' ', '-')
        $scratch = Join-Path $ticketDir "${Issue}-${Name}.sql"
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
