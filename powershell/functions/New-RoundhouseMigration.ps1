function New-RoundhouseMigration
{
    [CmdletBinding(SupportsShouldProcess, DefaultParameterSetName='ByDatabase')]
    param(
        [Parameter(ParameterSetName='ByPath')]
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
        [string] $Database = "evestment",

        [Parameter(ParameterSetName='ByDatabase')]
        [switch] $Manual,

        [Parameter()]
        [string] $Issue,

        [Parameter()]
        [string] $Name,

        [Parameter()]
        [int] $Padding=5
    )
    Begin
    {

        function Get-MostRecentScriptId {
            [CmdletBinding(SupportsShouldProcess=$true)]
            param($Path)
            $lastId = (Get-ChildItem $Path |
                Where-Object { $_.Name -match "^\d" } |
                Foreach-Object { ($_.Name.Split('_') | Select-Object -First 1) -as [int] } |
                Sort-Object -Descending |
                Where-Object { $_ -lt 999999 } |
                Select-Object -First 1)
            Write-Output $lastId
        }

        function Get-ScriptTemplate {
            [CmdletBinding()]
            param($Issue, $Description)

            $date = (Get-Date -Format 'yyyy-MM-dd')
            $template = @"
/*
 * Issue $Issue
 * $date
 * ${env:USERNAME}
 * $Description
 */

SET XACT_ABORT ON
GO
SET NOCOUNT ON
GO
IF OBJECT_ID('tempdb.dbo.#Config') IS NOT NULL DROP TABLE #Config
GO

-- unset to deploy
DECLARE @Testing bit = 1

-- Constants
DECLARE @Me varchar(100) = '$Issue'
        ,@Now datetime = GETDATE()

SELECT @Me Me, @Now [Now], @Testing Testing
INTO #Config

BEGIN TRANSACTION



IF EXISTS (SELECT * FROM #Config WHERE Testing = 1) ROLLBACK
ELSE COMMIT
GO
"@

            Write-Output $template
        }
    }
    Process
    {
        if ($PSCmdlet.ParameterSetName -eq 'ByDatabase')
        {
            $leaf = switch ($Manual) {
                $true { 'Manual' }
                Default { 'OneTime' }
            }
            $Path = "$RootPath\$Database\$leaf"
        }

        $branchDetails = Get-BranchDetails
        if (-not $Issue)
        {
            $Issue = $branchDetails.Issue
        }

        if (!$Name)
        {
            $Name = $branchDetails.Summary
        }

        $Name = $Name -replace ' ', '-'
        $Name = $Name -replace '.sql$', ''

        $nextScriptId = (Get-MostRecentScriptId -Path $Path) + 1
        $nextFile = "{0:D${Padding}}_{1}_{2}" -f $nextScriptId, $env:USERINITIALS, $Issue
        if ($Name) {
            $nextFile = "${nextFile}_${Name}"
        }
        $nextFile = "${nextFile}.sql"

        if ($Path) {
            $nextFile = Join-Path $Path $nextFile
        }

        if ($PSCmdlet.ShouldProcess("$nextFile", "New-Item")) {
            Write-Verbose "Creating file $nextFile"
            New-Item $nextFile
            Get-ScriptTemplate -Issue $Issue -Description $Name | Set-Content -Path $nextFile

            Invoke-Item $nextFile
        }
    }
}
