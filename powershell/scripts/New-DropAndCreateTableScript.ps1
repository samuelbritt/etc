param(
    [string] $ServerInstance = 'ev-atl-devdata01',
    [string] $Database = 'superset_dev',
    [string] $Schema = '__import',
    [string] $TableName = '*'
)
Set-StrictMode -Version Latest

$newLine = [System.Environment]::NewLine

$server = New-Object Microsoft.SqlServer.Management.Smo.Server $ServerInstance
$db = $server.Databases[$Database]
$tables = $db.Tables | Where-Object { ($_.Schema -like $Schema) -and ($_.Name -like $TableName) }

$dropOptions = New-Object Microsoft.SqlServer.Management.Smo.ScriptingOptions
$dropOptions.IncludeIfNotExists = $true
$dropOptions.ScriptDrops = $true

$tableCreateOptions = New-Object Microsoft.SqlServer.Management.Smo.ScriptingOptions
$tableCreateOptions.IncludeIfNotExists = $true
$tableCreateOptions.NoCollation = $true
$tableCreateOptions.Indexes = $true
$tableCreateOptions.DriAllConstraints = $false
$tableCreateOptions.DriAllKeys = $false

$fkCreateOptions = New-Object Microsoft.SqlServer.Management.Smo.ScriptingOptions
$fkCreateOptions.IncludeIfNotExists = $true

$tableData = @()
$fkData = @()
foreach ($t in $tables)
{
    $tableData += New-Object psobject -Property @{
        Table = $t
        ForeignKeys = $t.ForeignKeys
        DropScript = ($t.Script($dropOptions) -join $newLine)
        CreateScript = ($t.Script($tableCreateOptions) -join $newLine)
    }

    $t.ForeignKeys | ForEach-Object {
        $fk = $_
        $fkData += New-Object psobject -Property @{
            Name = $fk.Name
            ForeignKey = $fk
            DropScript = ($fk.Script($dropOptions) -join $newLine)
            CreateScript = ($fk.Script($fkCreateOptions) -join $newLine)
        }
    }
}

$tableData = $tableData | Sort-Object Schema, Name
$fkData = $fkData | Sort-Object Name

$sep = "${newLine}GO${newLine}"
$sep2 = "${newLine}${newLine}GO${newLine}${newLine}"

@(

    (($fkData | Select-Object -ExpandProperty DropScript) -join $sep),
    (($tableData | Select-Object -ExpandProperty DropScript) -join $sep),
    (($tableData | Select-Object -ExpandProperty CreateScript) -join $sep2),
    (($fkData | Select-Object -ExpandProperty CreateScript) -join $sep2)
) -join $sep2 | Write-Output