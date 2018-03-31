function New-SupersetAddItem
{
    [CmdletBinding()]
    Param(
        [string] $ServerInstance = 'ev-atl-devdata01',
        [string] $Database = 'superset_dev',
        [string] $SchemaName = '__import',
    
        [Parameter(Mandatory = $true)]
        [string] $TableName
    )
    Begin
    {
        function Get-Columns
        {
            param(
                [string] $ServerInstance = 'ev-atl-devdata01',
                [string] $Database = 'superset_dev',
                [string] $SchemaName,
                [string] $TableName
            )
    
            Set-StrictMode -Version Latest
            $select = New-SqlSelect
            $select.Select = @(
                'c.column_id Id'
                'c.[name] [Name]'
                'c.is_identity IsIdentity'
            )
            $select.From = 'sys.[columns] c join sys.tables [t] on c.object_id = t.object_id'
            $select.Where = @(
                "t.[name] = '$TableName'"
                "object_schema_name(t.[object_id]) = '$SchemaName'"
            )
            $select.OrderBy = "c.column_Id"
            Invoke-SqlSelect -Query $select -ServerInstance $ServerInstance -Database $Database
        }
    
        $ParameterTemplate = 'parameters.AddSqlParameter("{0}", {1});'
        $InsertTemplate = @"
        private const string Add{1}Sql = @"
        INSERT INTO [{0}].[{1}]
        (
{2}
        )
        VALUES
        (
{3}
        )

        SELECT SCOPE_IDENTITY()
    ";
"@
    
        $AddItemTemplate = @"
        private Task<int> Add{0}Async(int batchId, {0} model)
        {{
            var parameters = new List<SqlParameter>();
{1}

            return ExecuteScalarAsync<int>(Add{0}Sql, parameters);
        }}
"@
    }
    Process
    {
        Set-StrictMode -Version Latest
        $conn = @{
            ServerInstance = $ServerInstance
            Database = $Database
        }
    
        $columns = Get-Columns -SchemaName $SchemaName -TableName $TableName @conn
        $columnNames = $columns | Where-Object IsIdentity -NE 1 | Select-Object -ExpandProperty Name
        $columnList = "`t" + (($columnNames | % { "[${_}]"}) -join "`r`n`t,")
    
    
        $columnObjs = $columnNames | ForEach-Object {
            $c = $_
            $sqlInsert = "[${c}]"
            $sqlValue = "@${c}"
            $isVariable = $true
            $propertyName = "model.$c"
    
            if ('InsertedOn', 'UpdatedOn' -contains $c )
            {
                $sqlValue = 'GETDATE()'
                $isVariable = $false
            }
            elseif ('InsertedBy', 'UpdatedBy' -contains $c )
            {
                $sqlValue = '@UserName'
                $isVariable = $true
                $propertyName = "_userName"
            }
            elseif ('VoidTime' -eq $c )
            {
                $sqlValue = 'NULL'
                $isVariable = $false
            }
            elseif ('BatchId' -eq $c )
            {
                $propertyName = "batchId"
            }
            elseif ('AsOfDate', 'SourceMethod', 'SourceDocumentId', 'SourceWebsite' -contains $c)
            {
                $propertyName = "model.Source.$c"
            }
            
            New-Object psobject -Property @{
                ColumnName = $c
                PropertyName = $propertyName.Replace("ID", "Id")
                SqlInsert = $sqlInsert
                SqlValue = $sqlValue
                IsVariable = $isVariable
            }
        }
    
        $space = " " * 12
        $insertColumns = ($columnObjs.SqlInsert -join "`r`n$space,")
        $insertValues = ($columnObjs.SqlValue -join "`r`n$space,")
    
        $parameterStatement = ((($columnObjs |
        ? { $_.IsVariable } |
        % { $ParameterTemplate -f ($_.SqlValue, $_.PropertyName) }) |
        Get-Unique) -join "`r`n$space")
    
        $InsertTemplate -f ($SchemaName, $TableName, $insertColumns, $insertValues)
        $AddItemTemplate -f ($TableName, $parameterStatement)
    
    }
}
