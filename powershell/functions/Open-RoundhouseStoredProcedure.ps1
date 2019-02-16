function Open-RoundhouseObject
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

        Get-RoundhouseObject @PSBoundParameters | Invoke-Item
    }
}