function Get-TktDir
{
    [CmdletBinding()]
    Param(
        [Parameter(Position = 1)]
        [string] $Issue
    )
    Process
    {
        Set-StrictMode -Version Latest

        $details = Resolve-TktDetails -Issue $Issue
        $Issue = $details.Issue

        if (!$Issue)
        {
            throw ($script:Errors.ISSUE_REQUIRED)
        }

        Get-ChildItem "$($script:TicketsPath)\${Issue}-*" |
            Sort-Object -Property FullName |
            Select-Object -First 1
    }
}