Import-Module posh-git

# System environment variables
$env:HOMEDRIVE = "C:"
$env:HOME = "${env:HOMEDRIVE}\Users\${env:USERNAME}"

$ETCPATH = "${env:HOME}\usr\etc"
if (-not (Test-Path $ETCPATH))
{
    throw "Could not find path $ETCPATH"
}

# Environment variables
$CYGHOME = "C:\cygwin64\home\${env:USERNAME}"
$USR = Join-Path ${env:HOME} 'usr'
$SRC = Join-Path $USR 'src'

# etc
Get-ChildItem (Join-Path $ETCPATH 'powershell\functions') -Include *.ps1 -Recurse | ForEach-Object { . $_.FullName }
$env:PsModulePath = (Join-Path $ETCPATH 'powershell\modules'), $env:PsModulePath -join ';'

# bin
$env:PATH = "${env:PATH};${USR}\bin"

# python dev
# $env:PATH = "${env:PATH};C:\ProgramData\Anaconda3"
# $env:PATH = "${env:PATH};C:\ProgramData\Anaconda3\Scripts"


# posh dev
$env:PsModulePath = (Join-Path $SRC 'ps-notes'), $env:PsModulePath -join ';'
$env:PsModulePath = (Join-Path $SRC 'ps-tools'), $env:PsModulePath -join ';'
$env:PsModulePath = (Join-Path $SRC 'ps-templates'), $env:PsModulePath -join ';'

# Notes
$env:NOTES_PATH = "${env:HOME}\Dropbox\sync\notes"
if (Get-Module Notes -ListAvailable) { Import-Module Notes }

# bash-like completion
Set-PSReadlineKeyHandler -Key "Tab" -Function "Complete"

# custom colors
# Set-ColorScheme "Nord"
Set-ColorScheme "MaterialSublimeDark"

function prompt
{
    $colors = @{}

    @(
        "Admin",
        "UserName"
        "HostName"
        "Path"
        "Symbols"
    ) | ForEach-Object {
        $colors.Add($_, (Get-ConsoleColor $_))
    }

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
function Reset-Profile
{
    . $PSCommandPath
}

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

function gl { (git lasta) }

# Additional profiles
if ($env:USERDOMAIN -eq "EVESTMENT" -or $env:USERDOMAIN -eq "ORG")
{
    . "$ETCPATH/powershell/profile.evestment.ps1"
}
