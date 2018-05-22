Import-Module posh-git

$ETCPATH = "${HOME}\usr\etc"
if (-not (Test-Path $ETCPATH))
{
    throw "Could not find path $ETCPATH"
}

# Environment varaibles
$env:USERINITIALS = 'SEB'
$CYGHOME = "C:\cygwin64\home\${env:USERNAME}"
$USR = Join-Path $HOME 'usr'
$SRC = Join-Path $USR 'src'

# paths
Get-ChildItem (Join-Path $ETCPATH 'powershell\functions') | ForEach-Object { . $_.FullName }
$env:PsModulePath = (Join-Path $ETCPATH 'powershell\modules'), $env:PsModulePath -join ';'

# posh dev
$env:PsModulePath = (Join-Path $SRC 'notes'), $env:PsModulePath -join ';'
$env:PsModulePath = (Join-Path $SRC 'ps-tools'), $env:PsModulePath -join ';'

# Notes
$env:NOTES_PATH = "${env:HOME}\Dropbox\sync\notes"
Import-Module Notes

# bash-like completion
Set-PSReadlineKeyHandler -Key "Tab" -Function "Complete"

function Get-ColorScheme
{
    param(
        [string] $Name = $(if ($script:ColorScheme) { $script:ColorScheme.Name }),
        [switch] $Debug
    )

    $colorSchemes = Get-Content "$ETCPATH\powershell\colors.json" | ConvertFrom-Json

    $scheme = New-Object psobject -Property @{
        Name = $Name
        Pallette = @{}
        CustomColors = New-Object psobject -Property @{
            Admin = $null
            UserName = $null
            HostName = $null
            Path = $null
            Symbols = $null
            ErrorForegroundColor = $null
        }
    }

    $data = $colorSchemes.$Name
    $data.Pallette | ForEach-Object {
        $index = $data.Pallette.IndexOf($_)
        $scheme.Pallette.Add($_, $index)

        if ($Debug)
        {
            Write-Host ("{0,2} {1}" -f $index, $_) -ForegroundColor $scheme.Pallette[$_]
        }
    }

    $scheme.CustomColors | Get-Member -MemberType NoteProperty | ForEach-Object {
        $memberName = $_.Name
        $scheme.CustomColors.$memberName = $data.colors.$memberName
    }

    Write-Output $scheme
}

function Get-ConsoleColor
{
    param ([string] $Name)

    $colorName = $Name
    if (($script:ColorScheme.CustomColors.PSObject.Properties.name) -contains $Name)
    {
        $colorName = $script:ColorScheme.CustomColors.$Name
    }

    Write-Output $script:ColorScheme.Pallette[$colorName]
}

function Set-ColorScheme
{
    [CmdletBinding()]
    Param([string] $Name)
    Process
    {
        Set-StrictMode -Version Latest
        $script:ColorScheme = Get-ColorScheme -Name $Name

        if ($script:ColorScheme.CustomColors.ErrorForegroundColor -and
            ($host.PrivateData | Get-Member | Select-Object -ExpandProperty Name) -contains 'ErrorForegroundColor')
        {
            $host.PrivateData.ErrorForegroundColor = (Get-ConsoleColor $script:ColorScheme.CustomColors.ErrorForegroundColor)
        }
    }
}

$script:ColorScheme = $null
Set-ColorScheme "Nord"

function prompt
{
    $colors = @{}
    @(
        "Admin",
        "UserName"
        "HostName"
        "Path"
        "Symbols"
    ) | ForEach-Object { $colors.Add($_, (Get-ConsoleColor $_)) }

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
function gl { (git lasta) }

# Aliases
Set-Alias tail Get-TailContent
Set-Alias touch New-Item
Set-Alias grep Select-String

# Additional profiles
if ($env:USERDOMAIN -eq "EVESTMENT")
{
    . "$ETCPATH/powershell/profile.evestment.ps1"
}
