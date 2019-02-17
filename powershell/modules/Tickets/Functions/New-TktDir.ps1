function New-TktDir
{
    [CmdletBinding()]
    Param(
        [Parameter(Position = 1)]
        [string] $Issue,
        [Parameter(Position = 2)]
        [string] $Name,
        [Parameter()]
        [switch] $Force
    )
    Process
    {
        Set-StrictMode -Version Latest

        $details = Resolve-TktDetails -Issue $Issue -Name $Name
        $Issue = $details.Issue
        $Name = $details.Name

        if (!($Issue -and $Name))
        {
            throw ($script:Errors.ISSUE_AND_NAME_REQUIRED)
        }

        if (!$Force -and (Get-TktDir -Issue $Issue))
        {
            throw ($script:Errors.TICKET_DIR_EXISTS -f $Issue)
        }

        $Name = $Name.ToLower().Replace(' ', '-')
        $path = Join-Path $script:TicketsPath "${Issue}-${Name}"

        New-Item $path -ItemType Directory -Force:$Force | Out-Null
        Get-TktDir -Issue $Issue
    }
}