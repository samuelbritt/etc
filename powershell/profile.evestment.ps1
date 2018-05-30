Import-Module EvGit

$SHOME = "S:\Technology\DataOperations\Sam"
$TASKS = "${USR}\tasks"
$SRC = "C:\Source"
$DEV_TOOLS = "${SRC}\zzUtilities\DeveloperTools"
$ANALYTICS = "${SRC}\Production\Analytics"
$SHARED_API = "${SRC}\Production\SharedApi"
$LEGACY = "${SRC}\Production\Legacy"
$ROUNDHOUSE = "${SRC}\Production\Roundhouse"
$DATA_OPS = "${SRC}\Production\DataOperations"
$TERRAFORM = "${SRC}\Production\Terraform"
$MICROSERVICES = "${SRC}\Production\Microservices"
$INFRASTRUCTURE = "${TERRAFORM}\aws_infrastructure"
$CURRENCY = "${MICROSERVICES}\currency"
$DEVENV = "${env:ProgramFiles(x86)}\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"
$DEVENV = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.exe"

$DATA_OPS_BUILDS = "S:\Technology\DataOperations\Builds"

# Environment variables to support DataOps development
$env:DATAOPS_HOME = "C:\Source\Production\DataOperations\src"
$env:PSModulePath = "C:\Source\Production\DataOperations\src\Modules", $env:PSModulePath -join ";"
$env:PSModulePath = "C:\Source\Production\DataOperations\packages", $env:PSModulePath -join ";"

if (Test-Path "${env:HOME}\usr\.jira-token")
{
    $tokenSS = Get-Content "${env:HOME}\usr\.jira-token" | ConvertTo-SecureString
    $env:JiraToken = (New-Object pscredential 'x', $tokenSS).GetNetworkCredential().Password
}

function cdt
{
    param($Issue = (Get-Issue))
    $target = $TASKS

    if ($Issue)
    {
        $taskDir = Get-Ticket -Issue $Issue
        if ($taskDir)
        {
            $target = $taskDir
        }
        else
        {
            Write-Warning "no task directory found for $Issue"
        }
    }
    Set-Location $target
}

function cds { Set-Location $SRC }
function cda { Set-Location $ANALYTICS }
function cdsa { Set-Location $SHARED_API }
function cdl { Set-Location $LEGACY }
function cdr { Set-Location $ROUNDHOUSE }
function cdd { Set-Location $DATA_OPS }
function cdc { Set-Location $CURRENCY }
function cdi { Set-Location $INFRASTRUCTURE }
function Start-SyncAll { Push-Location ${DEV_TOOLS}; .\GitPullAndUpdate.bat; Pop-Location }
function Start-BuildAll { Push-Location ${DEV_TOOLS}; .\CompileAll.bat; Pop-Location }
function Start-BuildAnalytics { Push-Location ${ANALYTICS}; .\.team\shell\build.ps1; Pop-Location }
function Start-BuildApi { Push-Location ${SHARED_API}; .\.team\shell\build.ps1; Pop-Location }
function Start-BuildSencha {
    param(
        [Parameter()]
        [ValidateSet('analytics', 'design-lab', 'downloads', 'ext', 'fetch', 'home', 'packages', 'salesforce', 'subscription')]
        [string[]] $Name = 'analytics'
    )

    $Name | ForEach-Object {
        Push-Location "${ANALYTICS}\eA.Analytics.UI\ExtJs\$_";
        sencha app refresh --packages;
        sencha app build -c;
        Pop-Location
    }
}
function Start-MessageHandler { . ${SHARED_API}\eA.Shared.API.Service\bin\eA.Shared.API.Service.exe }
function Reset-IIS { Start-ProcessAsAdmin { iisreset.exe } }

function Start-AdSsms
{
    runas /user:ad\sbritt "C:\Program Files (x86)\Microsoft SQL Server\120\Tools\Binn\ManagementStudio\Ssms.exe"
}

<#
.Synopsis
Open one or more solutions in Visual Studio

.Example
vs
Open all ".sln" files in the current directory

.Example
vs Analytics, SharedApi
Open the Analytics and Shared Api solution files. See the documentation for all options.

.Example
vs -Path path/to/app.sln, path/to/anotherApp.sln
Opens app.sln and anotherApp.sln
#>
function Start-VisualStudio
{
    [CmdletBinding(SupportsShouldProcess = $true, DefaultParameterSetName = "ByPath")]
    param(
        [Parameter(ParameterSetName = "ByPath")]
        [string[]] $Path = "*.sln",

        [Parameter(ParameterSetName = "ByProject", Position = 0)]
        [ValidateSet("Analytics", "SharedApi", "Currency")]
        [string[]] $Project = @("Analytics", "SharedApi", "Currency")
    )

    $map = @{
        Analytics = "${ANALYTICS}\Analytics.sln"
        SharedApi = "${SHARED_API}\SharedApi.sln"
        Currency = "${CURRENCY}\src\App.sln"
    }

    if ($PSCmdlet.ParameterSetName -eq "ByProject")
    {
        $Path = $Project | ForEach-Object { $map[$_] }
    }

    Resolve-Path $Path | ForEach-Object {
        if ($PSCmdlet.ShouldProcess($_, 'Open devenv'))
        {
            Start-Process $DEVENV -ArgumentList $_ -Verb RunAs
        }
    }
}
Set-Alias vs Start-VisualStudio


<#
.SYNOPSIS
Opens Jira to the provided issue in your default browser.

.PARAMETER Issue
Issue to open. If not provided, opens to the issue corresponding to your current branch.

.EXAMPLE
Start-Jira ANALYTICS-123

Opens Jira to the page for issue ANALYTICS-123

.EXAMPLE
j ANALYTICS-123

Same as above, but uses the alias "j".

.EXAMPLE
j

Opens Jira to the page for issue corresponding to your current branch, assuming your branch is prefixed with the issue ID.
#>
function Start-Jira
{
    param([string] $Issue = (Get-Issue))
    if (-not $Issue)
    {
        throw "Must provide an issue, or be in a branch."
    }
    Start-Process "https://evestment.atlassian.net/browse/$Issue"
}
Set-Alias j Start-Jira

function Send-Email
{
    param (
        [string] $FromAddress,
        [string[]] $ToAddress,
        [string] $Subject,
        [string] $Body,
        [switch] $Html,
        [string] $Host = "ev-smtp.evestment.local",
        [int] $Port = 25
    )
    $smtpClient = New-Object System.Net.Mail.SmtpClient
    $smtpClient.Host = "ev-smtp.evestment.local"
    $smtpClient.Port = 25

    $mailMessage = New-Object System.Net.Mail.MailMessage
    $mailMessage.From = New-Object System.Net.Mail.MailAddress($FromAddress)
    $mailMessage.To.Add($ToAddress)
    $mailMessage.Subject = $Subject
    $mailMessage.Body = $Body
    if ($Html)
    {
        $mailMessage.IsBodyHtml = $true
    }

    $smtpClient.Send($mailMessage)
}
