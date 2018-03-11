[CmdletBinding(SupportsShouldProcess=$true, DefaultParameterSetName='ByDatabase')]
param(

    [Parameter(ParameterSetName='ByPath', Mandatory)]
    [string] $Path,

    [Parameter(ParameterSetName='ByDatabase')]
    [string] $RootPath = "C:\Source\Production\Roundhouse",

    [Parameter(ParameterSetName='ByDatabase')]
    [string] $Database = "evestment",

    [Parameter(Mandatory)]
    [string] $SchemaName,

    [Parameter(Mandatory)]
    [string] $Name
)
Begin
{
    $ProcedureTemplate = Data {
        'IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[${SCHEMA_NAME}].[${PROCEDURE_NAME}]'') AND type in (N''P'', N''PC''))
DROP PROCEDURE [${SCHEMA_NAME}].[${PROCEDURE_NAME}]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [${SCHEMA_NAME}].[${PROCEDURE_NAME}]
        <params,,>
AS
SET NOCOUNT ON

GO'
    }
}
Process
{
    if ($PSCmdlet.ParameterSetName -eq 'ByDatabase')
    {
        $Path = "$RootPath\$Database\StoredProcedures"
    }

    $content = $ProcedureTemplate.Replace('${SCHEMA_NAME}', $SchemaName).Replace('${PROCEDURE_NAME}', $Name)
    
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
