function New-Ticket
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Position = 1)]
        [string] $Issue,
        [Parameter(Position = 2)]
        [string] $Name,
        [string] $Path = "$HOME\usr\tasks"
    )
    
    $ticketDir = Get-Ticket -Issue $Issue -Name $Name -Path $Path
    
    if (-not (Test-Path $ticketDir))
    {
        New-Item $ticketDir -ItemType Directory
    }
}
