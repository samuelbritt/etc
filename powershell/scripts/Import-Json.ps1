param(
    [Parameter(ValueFromPipeline = $true)]
    [string[]] $Path
)
Process
{
    Resolve-Path $Path |
        ForEach-Object {
            (Get-Content $_) -join "`n" | ConvertFrom-Json
        }
}