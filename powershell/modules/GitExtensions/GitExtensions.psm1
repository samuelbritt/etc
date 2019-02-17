$imports = "Functions", "Constants" |
    ForEach-Object { "${PSScriptRoot}\$_\*.ps1" } |
    Where-Object { Test-Path -Path $_ } |
    Get-ChildItem -Exclude *.Tests.ps1

foreach ($import in $imports)
{
    try
    {
        . $import.FullName
    }
    catch
    {
        Write-Error -Message "Failed to import function $($import.FullName): $_"
    }
}