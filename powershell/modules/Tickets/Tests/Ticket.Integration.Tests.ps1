Set-StrictMode -Version Latest

$modulePath = Split-Path $PsScriptRoot
$moduleName = Split-Path $modulePath -Leaf
Get-Module $moduleName | Remove-Module -Force
Import-Module $modulePath -Force

Describe "Invoke-Ticket" -Tag "IntegrationTest" {
    Context "When <doing a thing>" {
        It "Should <do it correctly>" {
            $true | Should Be $false
        }
    }
}
