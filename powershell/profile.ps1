Import-Module posh-git

# # vi mode
# Set-PSReadlineOption -EditMode vi
# Set-PSReadlineOption -ViModeIndicator Cursor
# Set-PSReadlineOption -HistorySearchCursorMovesToEnd:$False

# # escape
# Set-PSReadlineKeyHandler -Chord "Ctrl+[" -Function "ViCommandMode" #-ViMode Insert

# # bash-like completion
Set-PSReadlineKeyHandler -Key "Tab" -Function "Complete"

# # search history
# Set-PSReadlineKeyHandler -Chord "Ctrl+R" -Function "HistorySearchBackward"

function prompt
{
    $origLastExitCode = $LASTEXITCODE
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity

    $isAdminProcess = 0
    if ($principal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    {
        $isAdminProcess = 1
    }

    $curPath = Get-TrimmedWorkingDirectory

    # color options
    # [-ForegroundColor {
    #        Black    | DarkGray  | Gray     | White
    #        DarkBlue | DarkGreen | DarkCyan | DarkRed | DarkMagenta | DarkYellow
    #        Blue     | Green     | Cyan     | Red     | Magenta     | Yellow }

    Write-Host ""
    if ($isAdminProcess) { Write-Host "[ADMIN] " -ForegroundColor RED -NoNewLine }
    Write-Host $env:USERNAME -NoNewLine -ForegroundColor DarkYellow
    Write-Host '@' -NoNewLine -ForegroundColor Gray
    Write-Host $(hostname) -NoNewLine -ForegroundColor Yellow
    Write-Host ':' -NoNewLine -ForegroundColor Gray
    try { Write-VcsStatus } catch {}
    Write-Host (' ' + $curPath) -ForegroundColor DarkGreen
    Write-Host ">" -ForegroundColor Gray -NoNewLine
    $LASTEXITCODE = $origLastExitCode
    return " "
}

# Functions
function Get-TrimmedWorkingDirectory
{
    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }
    return $curPath
}

function Get-AllChildItems
{
    Get-ChildItem -Attributes Hidden, !Hidden
}
Set-Alias la Get-AllChildItems

function Get-ParentLocation
{
    (Get-Location | Get-Item -Force).parent
}

function Set-ParentLocation
{
    Set-Location (Get-ParentLocation).FullName
}

Set-Alias ".." Set-ParentLocation

function Set-GrandParentLocation
{
    Set-ParentLocation
    Set-ParentLocation
}

Set-Alias "..." Set-GrandParentLocation

function Set-LocationAndGetChildItem
{
    param($Path)
    Set-Location $Path
    Get-ChildItem
}

Set-Alias cl Set-LocationAndGetChildItem

function New-ItemAndSetLocation
{
    param($Path)
    $ErrorActionPreference = "Stop"
    New-Item -Name $Path -ItemType "directory" | Out-Null
    Set-Location $Path
}

Set-Alias mkcd New-ItemAndSetLocation

function Get-HeadContent
{
    param($Path, $n = 20)
    Get-Content $Path -Head $n
}

Set-Alias head Get-HeadContent

function Get-TailContent
{
    param($Path, $n = 20)
    Get-Content $Path -Tail $n
}

Set-Alias tail Get-TailContent

# paths
$PSDIR = Split-Path $MyInvocation.MyCommand.Definition
$SCRIPTDIR = Join-Path $PSDIR "Scripts"
$env:Path = "$SCRIPTDIR;" + $env:Path
$PROFILE = $MyInvocation.MyCommand.Definition

# general aliases
$env:USERINITIALS = 'SEB'
$CYGHOME = "C:\cygwin64\home\${env:USERNAME}"
$USR = "$HOME\usr"
Set-Alias "subl" "${env:ProgramFiles}/Sublime Text 3/sublime_text.exe"
Set-Alias touch New-Item
Set-Alias grep Select-String
function _profile { Invoke-Item $PROFILE.CurrentUserAllHosts }; Set-Alias profile _profile
function gl { (git lasta) }

# eVestment
$SHOME = "S:\Technology\DataOperations\Sam"
$TASKS = "${USR}\tasks"
$SRC = "C:\Source"
$DEV_TOOLS = "${SRC}\zzUtilities\DeveloperTools"
$ANALYTICS = "${SRC}\Production\Analytics"
$SHARED_API = "${SRC}\Production\SharedApi"
$LEGACY = "${SRC}\Production\Legacy"
$ROUNDHOUSE = "${SRC}\Production\Roundhouse"
$DATA_OPS = "${SRC}\Production\DataOperations"
$DEVENV = "${env:ProgramFiles(x86)}\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"

# dataops dev
$env:DATAOPS_HOME = $DATA_OPS
$env:PSModulePath = "${env:DATAOPS_HOME}\Modules;" + $env:PSModulePath
$DATA_OPS_BUILDS = "S:\Technology\DataOperations\Builds"

if (Test-Path "${env:HOME}\usr\.jira-token")
{
    $tokenSS = Get-Content "${env:HOME}\usr\.jira-token" | ConvertTo-SecureString
    $env:JiraToken = (New-Object pscredential 'x', $tokenSS).GetNetworkCredential().Password
}

function Reset-Modules { Get-ChildItem $DATA_OPS/Modules | Select-Object -ExpandProperty Name | Get-Module | Remove-Module -Force }

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
function Start-SyncAll { Push-Location ${DEV_TOOLS}; .\GitPullAndUpdate.bat; Pop-Location }
function Start-BuildAll { Push-Location ${DEV_TOOLS}; .\CompileAll.bat; Pop-Location }
function Start-BuildAnalytics { Push-Location ${ANALYTICS}; .\.team\shell\build.ps1; Pop-Location }
function Start-BuildApi { Push-Location ${SHARED_API}; .\.team\shell\build.ps1; Pop-Location }
function Start-MessageHandler { . ${SHARED_API}\eA.Shared.API.Service\bin\eA.Shared.API.Service.exe }
function Reset-IIS { Start-ProcessAsAdmin { iisreset.exe } }

function Start-AdSsms
{
    runas /user:ad\sbritt "C:\Program Files (x86)\Microsoft SQL Server\120\Tools\Binn\ManagementStudio\Ssms.exe"
}

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

Import-Module EvGit

function Rebuild-Sencha
{
    Push-Location $ANALYTICS\eA.Analytics.UI\ExtJs\analytics
    sencha app build -c
    Pop-Location
}