function Get-ElmahError
{
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
    .PARAMETER Credential
        Credential to use for SQL Server authentication if necessary.
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True)]
        [guid] $ErrorId,
        [Parameter()]
        [ValidateSet('Dev', 'Tub', 'Testing', 'Prod')]
        [string] $Environment = 'Prod',
        [Parameter()]
        [PSCredential] $Credential,
        [Parameter()]
        [int] $ErrorDetailMaxLength = 500000
    )

    $serverInstance = $null
    $database = 'CommonLogging'

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
        'Testing'
        {
            $serverInstance = 'test-platform.us-east-1.aws.evestment.nonprod'
            break
        }
        'Prod'
        {
            $serverInstance = 'prod-platform.us-east-1.aws.evestment.prod'
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

    if ($Credential)
    {
        $params.Username = $Credential.GetNetworkCredential().Username
        $params.Password = $Credential.GetNetworkCredential().Password
    }

    $elmahError = Invoke-Sqlcmd @params
    $allXml = [xml]$elmahError.AllXml

    [PSCustomObject] @{
        ErrorId = $elmahError.ErrorId
        TimeUtc = $elmahError.TimeUtc
        Application = $elmahError.Application
        User = $elmahError.User
        Message = $elmahError.Message
        ErrorDetail = $allXml.error.detail
    }
}
