function New-Ticket
{
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Position = 1)]
        [string] $Issue,
        [Parameter(Position = 2)]
        [string] $Name,
        [string] $Path = "$HOME\usr\tasks"
    )

    $branchDetails = $null
    if (Test-GitRepository)
    {
        $branchDetails = Get-BranchDetails
        $Issue = if ($Issue -ne $null) { $Issue } $branchDetails.Issue
        $Name = if ($Name -ne $null) { $Name } $branchDetails.Summary
    }

    $ticketDir = Get-Ticket -Issue $Issue
    if ($ticketDir)
    {
        throw "Ticket $Issue already exists at '$ticketDir'"
    }

    if (!($Issue -and $Name))
    {
        throw "must provide both an issue an name, or be in a branch"
    }

    $Name = $Name.ToLower().Replace(' ', '-')
    $ticketDir = Join-Path $Path "${Issue}-${Name}"

    New-Item $ticketDir -ItemType Directory
}
