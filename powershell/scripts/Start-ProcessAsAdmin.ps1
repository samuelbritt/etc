function Start-ProcessAsAdmin
{
    param([scriptblock] $ScriptBlock)
    $command = @(
        $ScriptBlock.ToString()
        'Read-Host "Press enter to continue"'
    ) -join ';'
    $argumentList = "-Command &{ $command }"
    $powershell = (Get-Command powershell).Definition
    $process = @{
        FilePath = $powershell
        ArgumentList = $argumentList
        Verb = "RunAs"
        WindowStyle = "Normal"
        PassThru = $false
        Wait = $true
    }
    Start-Process @process
}
Set-Alias sudo Start-ProcessAsAdmin