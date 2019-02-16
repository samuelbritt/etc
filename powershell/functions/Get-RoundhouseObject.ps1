function Get-RoundhouseObject
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, Position=0)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('StoredProcedure', 'View')]
        [string] $ObjectType = "StoredProcedure",

        [Parameter()]
        [ValidateSet(
            "Advantage",
            "Assetflows",
            "ClientSelfService",
            "Commonlogging",
            "DbaTools",
            "DocumentRepository",
            "Events",
            "Evestment",
            "PrivateEquity",
            "Superset"
        )]
        [string] $Database = "Evestment",

        [Parameter()]
        [string] $RootPath = "C:\Source\Production\Roundhouse"
    )
    Process
    {
        Set-StrictMode -Version Latest
        $baseName = [regex]::Replace($Name, '[\[\]]', '') + '.sql'
        $objectDirectory = switch ($ObjectType)
        {
            'StoredProcedure' { "StoredProcedures" }
            'View' { "Views" }
        }

        $path = "$RootPath\$Database\$objectDirectory\$baseName"
        if (!(Test-Path $path))
        {
            throw "invalid path $path"
        }

        $path = Convert-Path $path
        Get-Item $path
    }
}