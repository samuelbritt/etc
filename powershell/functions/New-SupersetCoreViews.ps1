function New-SupersetCoreViews
{
    [CmdletBinding()]
    Param(
        [string] $ServerInstance = 'ev-atl-devdata01',
        [string] $Database = 'superset_dev',
        [string] $TargetSchema = 'Core',
        [string] $SourceSchema = '__import',
        [string] $Path = 'C:\Source\Production\Roundhouse'
    )
    Begin
    {
        $ViewTemplate = @"
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'{0}'))
DROP VIEW {0}
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW {0}
AS
SELECT
`t{3}
FROM {1} {2} WITH (NOLOCK)
`tJOIN [etl].[Batch] [b] WITH (NOLOCK) ON {2}.[BatchID] = [b].[BatchID]
WHERE [b].[IsActive] = 1
"@
        function Get-Tables
        {
            param($SourceSchema, $ServerInstance, $Database)
            Set-StrictMode -Version Latest
            $select = New-SqlSelect
            $select.Select = @(
                't.[object_id] ObjectId'
                'OBJECT_SCHEMA_NAME(t.[object_id]) SchemaName'
                't.[name] AS Name'
            )
            $select.From = 'sys.tables [t]'
            $select.Where = "OBJECT_SCHEMA_NAME(t.[object_id]) = '$SourceSchema'"
            Invoke-SqlSelect -Query $select -ServerInstance $ServerInstance -Database $Database
        }
    
        function Get-Columns
        {
            param(
                [Parameter(ValueFromPipelineByPropertyName = $True)]
                $ObjectId,
                $ServerInstance,
                $Database)
            Set-StrictMode -Version Latest
            $select = New-SqlSelect
            $select.Select = @(
                'c.column_id Id'
                'c.[name] [Name]'
            )
            $select.From = 'sys.[columns] c'
            $select.Where = "c.[object_id] = $ObjectId"
            Invoke-SqlSelect -Query $select -ServerInstance $ServerInstance -Database $Database
        }
    
        function New-CreateViewSql
        {
            param(
                [psobject] $Table,
                [string] $TableAlias = "t",
                [psobject[]] $Columns,
                [string] $TargetSchema
            )
            Set-StrictMode -Version Latest
    
            $columnSql = ($Columns |
                    Where-Object { $_.Name -ne "BatchId" } |
                    Sort-Object Id |
                    Select-Object -ExpandProperty Name |
                    ForEach-Object { "[$TableAlias].[$_]" } ) -join "`r`n`t,"
            
            $viewName = "[$TargetSchema].[$($Table.Name)]"
            $tableName = "[$($Table.SchemaName)].[$($Table.Name)]"
    
            $viewSql = $ViewTemplate -f $viewName, $tableName, "[$TableAlias]", $columnSql
            Write-Output $viewSql
        }
    }
    Process
    {
        Set-StrictMode -Version Latest
        $conn = @{
            ServerInstance = $ServerInstance
            Database = $Database
        }
        $tables = Get-Tables -SourceSchema $SourceSchema @conn
        foreach ($t in $tables)
        {
            $columns = $t | Get-Columns @conn
            $sql = New-CreateViewSql -Table $t -Columns $columns -TargetSchema $TargetSchema
            $fileName = $TargetSchema, $t.Name -join '.'
            $filePath = "$Path\superset\Views\$fileName.sql"
    
            $sql | Set-Content -Path $filePath
        }
    }
}
