function Set-TicketLocation
{
    param($Issue = (Get-Issue))
    $target = $TASKS

    if ($Issue)
    {
        $taskDir = Get-Ticket -Issue $Issue
        if ($taskDir)
        {
            $target = $taskDir
        }
        else
        {
            Write-Warning "no task directory found for $Issue"
        }
    }
    Set-Location $target
}