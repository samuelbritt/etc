Set-ExecutionPolicy RemoteSigned -Force

# Chocolatey
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Push-Location $PSScriptRoot

# Chocolatey packages
choco install ./apps/windows-packages.config -y

# Powershell modules
Install-Module Posh-Git

# Profile
$profileParams = @{
    Path = "${HOME}\Documents\WindowsPowerShell\profile.ps1"
    Value = "$PSScriptRoot\powershell\profile.ps1"
    ItemType = "SymbolicLink"
    Force = $true
}
New-Item @profileParams

Pop-Location