function Update-EcrTag
{
    <#
    .SYNOPSIS
    Updates the ECR tag in one or more microservices.

    .PARAMETER Service
    One or more services to update the ECR tag for.

    .PARAMETER Type
    The type of version that will be updated: 'Major', 'Minor', or 'Build'. [default: Build]

    .PARAMETER Decrement
    Switch to indicate that the version should be decreased, rather than increased.

    .PARAMETER Amount
    The amount of the version to increase or decrease. Must be greater than 0. [default: 1]

    .PARAMETER RootPath
    Path to the root of the aws_infrastructure directory. [default: $env:EVESTMENT_HOME\Production\Terraform\aws_infrastructure]

    .EXAMPLE
    Update-EcrTag -Service Currency, Products

    Increases the build version for the Currency and Products services by 1, in all environments.

    .EXAMPLE
    Update-EcrTag -Service Currency -Type Minor

    Increases the minor version for the Currency service by 1, in all environments.

    .EXAMPLE
    Update-EcrTag -Service Currency -Amount 3 -Decrement

    Decreases the build version for the Currency service by 3, in all environments.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory)]
        [ValidateSet('Products', 'Currency', 'Alerts')]
        [string[]] $Service,
        [Parameter()]
        [ValidateSet('Major', 'Minor', 'Build')]
        [string] $Type = 'Build',
        [Parameter()]
        [switch] $Decrement,
        [Parameter()]
        [ValidateScript( { if ($_ -le 0) { throw "'Amount' must be greater than 0. Use the 'Decrement' flag to decrement the version." } else { $true } })]
        [int] $Amount = 1,
        [Parameter()]
        [string] $RootPath = "$env:EVESTMENT_HOME\Production\Terraform\aws_infrastructure"
    )
    Begin
    {
        function Update-Version
        {
            [CmdletBinding()]
            Param(
                [Parameter(Mandatory, ValueFromPipeline)]
                [version] $Version,
                [Parameter(Mandatory)]
                [ValidateSet('Major', 'Minor', 'Build')]
                [string] $Type,
                [Parameter(Mandatory)]
                [int] $Delta
            )
            Process
            {
                Set-StrictMode -Version Latest

                $major = $Version.Major
                $minor = $Version.Minor
                $build = $Version.Build

                switch ($Type)
                {
                    Major { $major += $Delta }
                    Minor { $minor += $Delta }
                    Build { $build += $Delta }
                }

                if ($major -lt 0) { $major = 0 }
                if ($minor -lt 0) { $minor = 0 }
                if ($build -lt 0) { $build = 0 }

                New-Object version -ArgumentList $major, $minor, $build
            }
        }
    }
    Process
    {
        Set-StrictMode -Version Latest

        $Delta = if ($Decrement) { -1 * $Amount } else { $Amount }

        foreach ($service_ in $Service)
        {
            $serviceDir = "$RootPath\src\platform\services\$service_"
            $configDir = Join-Path $serviceDir "config"
            if (!(Test-Path $configDir))
            {
                Write-Warning "Could not find config directory for service $service_"
                continue
            }

            $configFiles = Get-ChildItem $configDir -Filter *.tfvars
            foreach ($configFile in $configFiles)
            {
                $oldVersion = $null
                $newVersion = $null

                $content = $configFile |
                    Get-Content |
                    ForEach-Object {
                    $line = $_

                    if ($line -match '^ecr_tag = "(.*)"')
                    {
                        $oldVersion = [version] $Matches[1]
                        $newVersion = $oldVersion | Update-Version -Type $Type -Delta $Delta
                        $line = "ecr_tag = ""$newVersion"""
                    }

                    $line
                }

                if ($null -eq $oldVersion)
                {
                    Write-Warning "Could not ecr tag for ${service_}:$($configFile.Name)"
                    continue
                }

                if ($PSCmdlet.ShouldProcess("${service_}:$($configFile.Name)", "Updating ECR tag from $oldVersion to $newVersion"))
                {
                    ($content -join "`n") + "`n" | Set-Content -Path $configFile.FullName -NoNewline

                    [PSCustomObject]@{
                        Service = $service_
                        File = $configFile.Name
                        OldVersion = $oldVersion
                        NewVersion = $newVersion
                    }
                }
            }
        }
    }
}