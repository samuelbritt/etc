function Set-TktLocation
{
    [CmdletBinding()]
    Param(
        [Parameter(Position = 1)]
        [string] $Issue
    )
    Process
    {
        Set-StrictMode -Version Latest

        $target = $script:TicketsPath

        $ticketDir = Get-TktDir -Issue $Issue
        if ($ticketDir)
        {
            $target = $ticketDir
        }
        else
        {
            Write-Warning ($script:Errors.TICKET_DIR_NOT_FOUND -f $Issue)
        }

        Set-Location $target
    }
}