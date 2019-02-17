function Invoke-Startup
{
    Set-StrictMode -Version Latest

    if (!(Test-Path $script:TicketsPath))
    {
        New-Item -Path $script:TicketsPath -ItemType Directory | Out-Null
    }
    else
    {
        $path = Get-Item $script:TicketsPath
        if (!$path.PSIsContainer)
        {
            throw ($script:Errors.INVALID_DIRECTORY -f $path)
        }
    }
}
