function Invoke-Terraform
{
    [CmdletBinding()]
    Param(
        [Parameter(Position = 1)]
        [ValidateSet("Plan", "Apply", "Destroy")]
        [string] $Command,
        [Parameter(Position = 2, Mandatory)]
        [ValidateSet('Products', 'Currency', 'Alerts')]
        [string] $Service,
        [Parameter()]
        [string] $Workspace,
        [Parameter()]
        [string] $RootPath = "$env:EVESTMENT_HOME\Production\Terraform\aws_infrastructure"
    )
    Process
    {
        Set-StrictMode -Version Latest
        $commandPath = Join-Paths $RootPath, 'build', "$($Command.ToLower()).ps1"
        $servicePath = Join-Paths $RootPath, 'src', 'platform', 'services', $Service.ToLower(), 'src'

        Assert-Path $commandPath
        Assert-Path $servicePath

        if ($Workspace)
        {
            & $commandPath $servicePath -Workspace $Workspace
        }
        else
        {
            & $commandPath $servicePath
        }
    }
}