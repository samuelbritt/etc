<#
.SYNOPSIS
    Show details about an Elmah error.
.DESCRIPTION
    Show details about an Elmah error by consulting the elmah_error database table.
    Shows full stacktrace of the error. Requires SQL Server authentication to the
    database servers not on the Evestment domain.
.PARAMETER ErrorId
    ID of the error to inspect.
.PARAMETER Environment
    Environment (Dev, Tub, Test, or Prod) containing the CommonLogging database. Determines
    both the server instance name, as well as the type of security used (servers not on the
    Evestment domain will prompt for Sql credentials). [default: Prod]
.PARAMETER ErrorDetailMaxLength
    Max length to use when parsing long error stack traces. [default: 500000]
.PARAMETER DefaultUserName
    Username used to populate the credentials dialog, if necessary. [default: $env:USERNAME]
#>
[CmdletBinding()]
Param (
    [Parameter(Mandatory=$True)]
        [guid] $ErrorId,
    [Parameter()]
    [ValidateSet('Dev', 'Tub', 'Test', 'Prod')]
    [string] $Environment = 'Prod',
    [Parameter()]
        [int] $ErrorDetailMaxLength = 500000,
    [Parameter()]
        [string] $DefaultUserName = $env:USERNAME
)

$serverInstance = $null
$database = 'CommonLogging'
$integratedSecurity = $true

switch ($Environment)
{
    'Dev'
    {
        $serverInstance = 'ev-atl-devdata01' 
        $database += '_dev'
        break
    }
    'Tub'
    {
        $serverInstance = 'ev-atl-tubdata01' 
        $database += '_tub'
        break
    }
    'TestOld'
    {
        $serverInstance = 'easeasdlcdb2.inetuhosted.net' 
        $database += '_testing'
        $integratedSecurity = $false
        break
    }
    'Test'
    {
        $serverInstance = 'testing-platformdb-1.aws.evestment.internal' 
        $database += ''
        $integratedSecurity = $false
        break
    }
    'Prod'
    {
        $serverInstance = 'evest-pdbag-01.inetuhosted.net' 
        $integratedSecurity = $false
        break
    }
}

$query = 'select * from dbo.elmah_error where ErrorId = $(error_id);'
$vars = ("error_id='$ErrorId'")
$params = @{
    ServerInstance = $serverInstance
    Database = $database
    Query = $query
    Variable = $vars
    MaxCharLength = $ErrorDetailMaxLength
}

if (-not $integratedSecurity)
{
    $credentials = Get-Credential -Message "Enter SQL Server credentials to server '$serverInstance'" -UserName $DefaultUserName
    $params.Username = $credentials.GetNetworkCredential().Username
    $params.Password = $credentials.GetNetworkCredential().Password
}

$elmahError = Invoke-Sqlcmd @params
$allXml = [xml]$elmahError.AllXml

$properties = @{
    ErrorId = $elmahError.ErrorId
    TimeUtc = $elmahError.TimeUtc
    Application = $elmahError.Application
    User = $elmahError.User
    Message = $elmahError.Message
    ErrorDetail = $allXml.error.detail
}
$obj = New-Object -TypeName PSObject -Property $properties
Write-Output $obj