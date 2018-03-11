[CmdletBinding(SupportsShouldProcess=$true)]
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
}

if (-not $Issue)
{
    $Issue = $branchDetails.Issue
}

$ticketDir = Get-ChildItem $Path\$Issue* |
    Sort-Object -Property FullName |
    Select-Object -First 1

if (-not $ticketDir)
{
    if (-not $Name -and $Issue -eq $branchDetails.Issue)
    {
        $Name = $branchDetails.Summary
    }
    
    if (-not $Issue -or -not $Name)
    {
        throw "must provide both an issue an name, or be in a branch"
    }
    
    $Name = $Name.ToLower().Replace(' ', '-')
    $ticketDir = Join-Path $Path "${Issue}-${Name}"
}

Write-Output $ticketDir