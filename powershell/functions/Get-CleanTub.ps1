function Get-ContainsLike
{
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline, Mandatory)]
        [object] $InputObject,
        [Parameter()]
        [string] $Property,
        [Parameter()]
        [string[]] $Value
    )
    Process
    {
        Set-StrictMode -Version Latest

        $InputObject | Where-Object {
            $inputObj = $_
            $Value | ForEach-Object {
                if ($inputObj -like $_)
                {
                    return $true
                }
            }
        }
    }
}

function Get-TubStatus
{
    [CmdletBinding()]
    Param(
        [Parameter()]
        [ValidateSet('analytic')]
        [string] $Group = 'analytic',

        [Parameter()]
        [ValidateSet(
            '32Bit',
            'Administration',
            'Analytics',
            'Community',
            'DeploymentInfo',
            'Exchange',
            'Export',
            'Input',
            'Legacy',
            'MessagingAdminUI',
            'SelfService',
            'SharedAPI',
            'TopQ',
            '32Bit',
            'Administration'
        )]
        [string] $Project = '*'
    )
    Process
    {
        Set-StrictMode -Version Latest

        $tubStatus = Get-TubStatus -Group $Group


        $candidateTubs = $tubStatus | Where-Object {
            $tub = $_
            $projects = $tub | Where-Object {
                $t = $_
                $Project | ForEach-Object { $t.Project -like $_ }
            }
        }

        foreach ($tub in $tubStatus)
        {
            if ($Project | Where-Object { $tub.Project -like $_ })
            {
                $x = 'pass'
            }

            if ($tub.Project | Test-LikeAny $Project )
            {
                $x = 'pass'
            }
            $projects = $tub.Status | Where-Object {
                $status = $_
                $Project | ForEach-Object { $status.Project -like $_ }
            }

            $body = @{
                itemName = $tub
            }

            $content = Invoke-RestMethod @params -Body $body

            $Project | ForEach-Object {

            }

            $content | Select-Object -Property @{ n = 'Tub'; e = { $tub }}, *
        }
    }
}
