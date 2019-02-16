function Get-TubStatus
{
    [CmdletBinding()]
    Param(
        [Parameter()]
        [ValidateSet('analytic')]
        [string] $Group = 'analytic'
    )
    begin
    {
        $BaseUri = "http://tubinspector.evestment.io/api/Main"
        $DefaultRestMethodParams = @{
            ContentType = 'application/json'
            UseDefaultCredentials = $true
        }

        function Get-ProjectData
        {
            [CmdletBinding()]
            Param(
                [Parameter()]
                [string] $Tub
            )
            Process
            {
                Set-StrictMode -Version Latest
                $params = @{
                    Method = 'Get'
                    Uri = "${baseUri}/GetItemData"
                    Body = @{
                        itemName = $Tub
                    }
                }

                Invoke-RestMethod @DefaultRestMethodParams @params
            }
        }

        function Get-TubData
        {
            [CmdletBinding()]
            Param()
            Process
            {
                Set-StrictMode -Version Latest
                $params = @{
                    Method = 'Get'
                    Uri = "${baseUri}/GetMenuItems"
                }

                Invoke-RestMethod @DefaultRestMethodParams @params
            }
        }
    }
    process
    {
        Set-StrictMode -Version Latest
        $tubs = @{
            analytic = @(
                'tub-analytic-01'
                'tub-analytic-02'
                'tub-analytic-03'
                'tub-analytic-04'
                'tub-analytic-05'
                'tub-analytic-06'
                'tub-analytic-07'
                'tub-analytic-08'
            )
        }

        $tubData = Get-TubData

        foreach ($tub in $tubs[$Group])
        {
            $projectData = Get-ProjectData -Tub $tub
            $thisTubData = $tubData | Where-Object MachineName -eq $tub

            $projectData | Select-Object -Property @(
                @{ n = 'Tub'; e = { $tub }}
                @{ n = 'Locked'; e = { $thisTubData.Locked }}
                '*'
            )
        }
    }
}
