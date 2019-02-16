$script:ColorScheme = ''

function Get-ColorScheme
{
    param(
        [string] $Name = $(if ((!(Test-Path Variable:script:ColorScheme))) { $script:ColorScheme.Name }),
        [switch] $Debug
    )

    $colorSchemes = Get-Content "$PSScriptRoot\colors.json" -Raw | ConvertFrom-Json

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
    if (!(Test-Path Variable:script:ColorScheme))
    {
        Write-Output White
        return
    }

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
