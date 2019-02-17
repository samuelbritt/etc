function New-TktNote
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

        $details = Resolve-TktDetails -Issue $Issue -Name $Name
        $Issue = $details.Issue
        $Name = $details.Name

        $title = "${Issue} - $Name"
        New-Note -Title $title -Tag 'ticket'
    }
}