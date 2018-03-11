Param(
    [string] $Key,
    [string] $Path = "${HOME}/.config/config.json"
)
Process
{
    Set-StrictMode -Version Latest
    if (-not (Test-Path $Path))
    {
        Write-Error "could not find config file $path"
        return
    }
    $config = Get-Content $Path | ConvertFrom-Json
    $value = $config.$Key

    if ($value)
    {
        try
        {
            $value = $value | ConvertTo-SecureString -ErrorAction Stop
        }
        catch
        {
        }
    }

    Write-Output $value
}