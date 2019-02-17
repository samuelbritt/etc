function Resolve-TktDetails
{
    [CmdletBinding()]
    Param(
        [Parameter()]
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

        [PSCustomObject] @{
            Issue = $Issue
            Name = $Name
        }
    }
}