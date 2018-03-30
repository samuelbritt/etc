Import-Module posh-git

$ETCPATH = "${HOME}\usr\etc"
if (-not (Test-Path $ETCPATH))
{
    throw "Could not find path $ETCPATH"
}

# bash-like completion
Set-PSReadlineKeyHandler -Key "Tab" -Function "Complete"

function Get-ColorScheme
{
    param([string] $Name, [switch] $Debug)

    $colorSchemes = Get-Content "$ETCPATH\powershell\colors.json" | ConvertFrom-Json

    $scheme = New-Object psobject -Property @{
        Pallette = @{}
        Prompt = New-Object psobject -Property @{
            Admin = $null
            UserName = $null
            HostName = $null
            Path = $null
            Symbols = $null
        }
    }

    $data = $colorSchemes.$Name
    $data.Pallette | ForEach-Object {
        $scheme.Pallette.Add($_, $data.Pallette.IndexOf($_))
        if ($Debug) { Write-Host "$_" -ForegroundColor $scheme.Pallette[$_] }
    }

    $scheme.Prompt | Get-Member -MemberType NoteProperty | ForEach-Object {
        $memberName = $_.Name
        $scheme.Prompt.$memberName = $scheme.Pallette[$data.prompt.$memberName]
    }

    Write-Output $scheme
}

function Set-ColorScheme
{
    [CmdletBinding()]
    Param([string] $Name)
    Process
    {
        Set-StrictMode -Version Latest
        $script:ColorScheme = Get-ColorScheme -Name $Name
    }
}

$script:ColorScheme = $null
Set-ColorScheme "Nord"

function prompt
{
    $colors = $script:ColorScheme.Prompt

    $origLastExitCode = $LASTEXITCODE
    $curPath = Get-TrimmedWorkingDirectory
    Write-Host ""
    if (Test-IsAdmin) { Write-Host "[ADMIN] " -ForegroundColor $colors.Admin -NoNewLine }
    Write-Host $env:USERNAME -NoNewLine -ForegroundColor $colors.UserName
    Write-Host '@' -NoNewLine -ForegroundColor $colors.Symbols
    Write-Host $(hostname) -NoNewLine -ForegroundColor $colors.HostName
    Write-Host ':' -NoNewLine -ForegroundColor $colors.Symbols
    try { Write-VcsStatus } catch {}
    Write-Host (' ' + $curPath) -ForegroundColor $colors.Path
    Write-Host ">" -NoNewLine -ForegroundColor $colors.Symbols
    $LASTEXITCODE = $origLastExitCode
    return " "
}

# Functions
function Test-IsAdmin
{
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity
    Write-Output $principal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

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
    (Get-Location | Get-Item -Force).Parent
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
    New-Item -Name $Path -ItemType "Directory" | Set-Location
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
$scriptsPath = Join-Path $ETCPATH "\powershell\scripts"
$env:Path = "$scriptsPath;" + $env:Path

$modulesPath = Join-Path $ETCPATH "\powershell\modules"
$env:PsModulePath = "$modulesPath;" + $env:PsModulePath

$PROFILE = $MyInvocation.MyCommand.Definition

# general aliases
$env:USERINITIALS = 'SEB'
$CYGHOME = "C:\cygwin64\home\${env:USERNAME}"
$USR = "$HOME\usr"
Set-Alias "subl" "${env:ProgramFiles}/Sublime Text 3/sublime_text.exe"
Set-Alias touch New-Item
Set-Alias grep Select-String
function gl { (git lasta) }

if ($env:USERDOMAIN -eq "EVESTMENT")
{
    . "$ETCPATH/powershell/profile.evestment.ps1"
}