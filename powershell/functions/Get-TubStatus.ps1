function Get-TubStatus
{
    [CmdletBinding()]
    Param()
    Process
    {
        Set-StrictMode -Version Latest
        $baseUri = "http://tubinspector.evestment.io/api/Main/GetItemData"
        $tubs = @(
            'tub-analytic-01'
            'tub-analytic-02'
            'tub-analytic-03'
            'tub-analytic-04'
            'tub-analytic-05'
            'tub-analytic-06'
            'tub-analytic-07'
            'tub-analytic-08'
        )

        $params = @{
            Method = 'Get'
            Uri = $baseUri
            ContentType = 'application/json'
            UseDefaultCredentials = $true
        }

        foreach ($tub in $tubs)
        {
            $body = @{
                itemName = $tub
            }

            $content = Invoke-RestMethod @params -Body $body
            $content | Select-Object -Property @{ n = 'Tub'; e = { $tub }}, *
        }
    }
}