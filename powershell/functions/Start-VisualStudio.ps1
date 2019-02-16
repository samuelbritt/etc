<#
.Synopsis
Open one or more solutions in Visual Studio, as admin.

.PARAMETER Path
Path to one or more solution files.

.PARAMETER Project
Name of one or more projects to open. Requires the solution files to be in the typical location,
with the environment variable EVESTMENT_HOME set to the root source directory (typically C:\Source).

.PARAMETER DevEnvPath
Path to the devenv.exe executable. Defaults to the environment variable DEVENV_PATH.

.Example
vs
Open all ".sln" files in the current directory

.Example
vs ./app.sln
Open the solution file found at ./app.sln

.Example
vs -Project Analytics, SharedApi
Open the Analytics and Shared API solution files.
#>
function Start-VisualStudio
{
    [CmdletBinding(SupportsShouldProcess, DefaultParameterSetName = "ByPath")]
    param(
        [Parameter(ParameterSetName = "ByPath", Position = 0)]
        [string[]] $Path = "*.sln",

        [Parameter(ParameterSetName = "ByProject")]
        [ValidateSet('SharedApi', 'Analytics', 'Input', 'Administration', 'Next', 'Currency', 'Products', 'Alerts', 'DistributedDatasets')]
        [string[]] $Project,

        [Parameter()]
        [ValidateScript( {if ([string]::IsNullOrEmpty($_) -or !(Test-Path $_)) { throw "Please provide a path to devenv.exe, or set the DEVENV_PATH environment variable" } })]
        [string] $DevEnvPath = $env:DEVENV_PATH
    )
    Begin
    {
        $pathLookup = @{
            SharedApi = "${env:EVESTMENT_HOME}\Production\SharedApi\SharedApi.sln"
            Analytics = "${env:EVESTMENT_HOME}\Production\Analytics\Analytics.sln"
            Input = "${env:EVESTMENT_HOME}\Production\Input\Input.sln"
            Administration = "${env:EVESTMENT_HOME}\Production\Administration\Administration.sln"
            Next = "${env:EVESTMENT_HOME}\Production\Legacy\Next.sln"
            Currency = "${env:EVESTMENT_HOME}\Production\Microservices\currency\src\Currency.sln"
            Products = "${env:EVESTMENT_HOME}\Production\Microservices\products\src\Products.sln"
            Alerts = "${env:EVESTMENT_HOME}\Production\Microservices\products\src\alerts.sln"
            DistributedDatasets = "${env:EVESTMENT_HOME}\Production\Platform\distributed-datasets\Platform.DistributedDatasets.sln"
        }
    }
    Process
    {
        Set-StrictMode -Version Latest

        if ($PSCmdlet.ParameterSetName -eq "ByProject")
        {
            $Path = $Project | ForEach-Object { $pathLookup[$_] }
        }

        Resolve-Path $Path | ForEach-Object {
            if ($PSCmdlet.ShouldProcess($_, 'Open devenv'))
            {
                Start-Process $DevEnvPath -ArgumentList $_ -Verb RunAs
            }
        }
    }
}