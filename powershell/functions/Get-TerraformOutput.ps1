function Get-TerraformOutput
{
    <#
    .SYNOPSIS
    Get the output from the terraform apply step.

    .PARAMETER Service
    The service that was applied.

    .PARAMETER Workspace
    The name of the workspace that was applied. Defaults to the branch name.

    .PARAMETER TerraformPath
    Root path to the location of saved terraform output.

    .EXAMPLE
    PS C:\> Get-TerraformOutput -Service Currency

    Returns the contents of the terraform output for the Currency service in the current branch's workspace.

    .EXAMPLE
    PS C:\> Get-TerraformOutput -Service Currency -Workspace seb

    Returns the contents of the terraform output for the Currency service in "seb" workspace.
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0)]
        [ValidateSet('Products', 'Currency', 'Alerts')]
        [string] $Service,
        [Parameter()]
        [string] $Workspace = (Get-BranchDetails | Select-Object -ExpandProperty Branch),
        [Parameter()]
        [string] $TerraformPath = "${HOME}\.evestment\terraform\platform"
    )
    Process
    {
        Set-StrictMode -Version Latest

        $terraformOutputPath = "$TerraformPath\services\$Service\$Workspace\tfoutput.json"

        if (!(Test-Path $terraformOutputPath))
        {
            Write-Error "Could not find terraform output at $terraformOutputPath"
            return
        }

        $contents = Get-Content $terraformOutputPath -Raw | ConvertFrom-Json

        [PSCustomObject] @{
            Role = $contents.microservice_role_arn.value
            Prefix = $contents.microservice_settings_prefix.value
        }
    }
}