function Get-Ticket
{
    [CmdletBinding()]
    param(
        [Parameter(Position = 1)]
        [string] $Issue,
        [string] $Path = "$HOME\usr\tasks"
    )

    $branchDetails = $null
    if (Test-GitRepository)
    {
        $branchDetails = Get-BranchDetails
        $Issue = if ($Issue -ne $null) { $Issue } $branchDetails.Issue
    }

    Get-ChildItem "${Path}\${Issue}-*" |
        Sort-Object -Property FullName |
        Select-Object -First 1
}
