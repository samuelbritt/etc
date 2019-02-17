function New-TktScratch
{
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter()]
        [string] $Issue,
        [Parameter()]
        [string] $Name = "scratch"
    )
    Process
    {
        Set-StrictMode -Version Latest

        $details = Resolve-TktDetails -Issue $Issue
        $Issue = $details.Issue

        $ticketDir = New-TktDir -Issue $Issue -Force

        $Name = $Name.Replace(' ', '-')
        $path = Join-Path $ticketDir "${Issue}-${Name}.sql"

        if (!(Test-Path $path))
        {
            New-Item $path -ItemType File | Out-Null
        }

        Invoke-Item $path
    }
}