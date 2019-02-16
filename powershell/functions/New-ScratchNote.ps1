function New-ScratchNote
{
    [CmdletBinding()]
    Param(
        [Parameter(Position = 1)]
        [string] $Issue,
        [Parameter()]
        [string] $Name
    )
    Process
    {
        Set-StrictMode -Version Latest
        if (Test-GitRepository)
        {
            $branchDetails = Get-BranchDetails
            $Issue = if ($Issue) { $Issue } else { $branchDetails.Issue }
            $Name = if ($Name) { $Name } else { $branchDetails.Summary }
        }

        $title = "${Issue} - $Name"

        New-Note -Title $title
    }
}