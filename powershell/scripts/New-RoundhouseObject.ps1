[CmdletBinding(SupportsShouldProcess=$true, DefaultParameterSetName='ByDatabase')]
param(

    [Parameter(ParameterSetName='ByPath', Mandatory)]
    [string] $Path,

    [Parameter(ParameterSetName='ByDatabase')]
    [string] $RootPath = "C:\Source\Production\Roundhouse",

    [Parameter(ParameterSetName='ByDatabase')]
    [ValidateSet(
        "Advantage",
        "Assetflows",
        "Clientselfservice",
        "Commonlogging",
        "Dbatools",
        "Documentrepository",
        "Events",
        "Evestment",
        "Privateequity",
        "Superset"
    )]
    [string] $Database = "Evestment",

    [Parameter()]
    [ValidateSet('StoredProcedure', 'View')]
    [string] $ObjectType = "StoredProcedure",

    [Parameter(Mandatory)]
    [string] $SchemaName,

    [Parameter(Mandatory)]
    [string] $Name
)
Begin
{
    $Data = @{
        StoredProcedure = @{
            SubDirectory = "StoredProcedures"
            Template = @'
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[${SCHEMA_NAME}].[${OBJECT_NAME}]') AND type in (N'P', N'PC'))
DROP PROCEDURE [${SCHEMA_NAME}].[${OBJECT_NAME}]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [${SCHEMA_NAME}].[${OBJECT_NAME}]
<params, , >
AS
SET NOCOUNT ON

GO
'@
        }

        View = @{
            SubDirectory = "Views"
            Template = @'
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[${SCHEMA_NAME}].[${OBJECT_NAME}]'))
DROP VIEW  [${SCHEMA_NAME}].[${OBJECT_NAME}]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [${SCHEMA_NAME}].[${OBJECT_NAME}]
AS
'@
        }
    }
}
Process
{
    Set-StrictMode -Version Latest

    $subDir = $Data.$ObjectType.SubDirectory
    $template = $Data.$ObjectType.Template

    if ($PSCmdlet.ParameterSetName -eq 'ByDatabase')
    {
        $Path = "$RootPath\$($Database.ToLower())\$subDir"
    }

    $content = $template.Replace('${SCHEMA_NAME}', $SchemaName).Replace('${OBJECT_NAME}', $Name)

    $fileName = "$SchemaName.$Name.sql"
    $fullPath = Join-Path $Path $fileName
    if (Test-Path $fullPath)
    {
        throw "script $fullPath already exists"
    }

    if ($PSCmdlet.ShouldProcess("$fullPath", "New-Item"))
    {
        Write-Verbose "creating file ${fullPath}..." -Verbose
        New-Item -Path $fullPath -ItemType File | Out-Null
        Set-Content -Path $fullPath -Value $content
        Write-Verbose "done." -Verbose
        Invoke-Item $fullPath
    }
}
