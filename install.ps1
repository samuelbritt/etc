Set-ExecutionPolicy RemoteSigned -Force

# Chocolatey
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Push-Location $PSScriptRoot

# Install packages
choco install ./apps/windows-packages.config -y
Install-Module Posh-Git
Update-Help

# Profile
$symLinks = @(
    @{
        Path = "${HOME}\Documents\WindowsPowerShell\profile.ps1"
        Value = "$PSScriptRoot\powershell\profile.ps1"
    }
    @{
        Path = "${HOME}\.gitconfig"
        Value = "$PSScriptRoot\git\gitconfig"
    }
    @{
        Path = "${HOME}\.git.windows.config"
        Value = "$PSScriptRoot\git\git.windows.config"
    }
    @{
        Path = "${HOME}\.gitattributes"
        Value = "$PSScriptRoot\git\gitattributes"
    }
    @{
        Path = "${HOME}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\AutoHotkey.ahk"
        Value = "$PSScriptRoot\autohotkey\AutoHotkey.ahk"
    }
)

if ($env:USERDOMAIN -eq "EVESTMENT")
{
    $symLinks += @(
        @{
            Path = "${HOME}\.git.evestment.config"
            Value = "$PSScriptRoot\git\git.evestment.config"
        }
    )
}

$symLinks | ForEach-Object {
    $params = $_
    Write-Verbose "Creating link $($_.Value) -> $($_.Path)" -Verbose
    New-Item @params -ItemType SymbolicLink -Force | Out-Null
}

Pop-Location