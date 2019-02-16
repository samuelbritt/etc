function Invoke-MPRequest
{
    [CmdletBinding(SupportsShouldProcess = $true)]
    Param(
        [Parameter(ParameterSetName = "FromPath", Mandatory)]
        [string] $Path,
        [Parameter(ParameterSetName = "FromContent", Mandatory, ValueFromPipeline)]
        [string] $Content,
        [ValidateSet('Html', 'Xml', 'Json', 'Text')]
        [string] $ContentType,
        [Parameter()]
        [switch] $NoPartialTranslation,
        [Parameter()]
        [switch] $AbsoluteUrls,
        [Parameter()]
        [switch] $RewriteUrls,
        [Parameter()]
        [switch] $Force,
        [Parameter()]
        [string] $OriginalUrl
    )
    Process
    {
        Set-StrictMode -Version Latest

        Set-StrictMode -Version Latest
        $ErrorActionPreference = 'Stop'
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

        $actionId = 4
        if ($NoPartialTranslation) { $actionId += 2 }
        if ($AbsoluteUrls) { $actionId += 8 }
        if ($RewriteUrls) { $actionId += 16 }

        [uri] $uri = "https://jaevestment.convertlanguage.com/?mpactionid=$actionId"

        if ($PSCmdlet.ParameterSetName -eq 'FromPath')
        {
            $Content = Get-Content $Path -Raw
            if (!$ContentType)
            {
                $extension = Get-Item $Path | Select-Object -ExpandProperty Extension
                $ContentType = switch ($extension)
                {
                    '.html' { 'Html' }
                    '.xml' { 'Xml' }
                    '.json' { 'Json' }
                    '.txt' { 'Text' }
                }
            }
        }
        elseif ($PSCmdlet.ParameterSetName -eq 'FromContent')
        {
            if (!$ContentType)
            {
                $ContentType = 'Text'
            }
        }

        $data = [System.Text.Encoding]::UTF8.GetBytes($Content)
        $httpContentType = switch ($ContentType)
        {
            Html { 'application/html' }
            Xml { 'application/xml' }
            Json { 'application/json' }
            Text { 'application/text' }
        }

        $httpWebRequest = [System.Net.WebRequest]::CreateHttp($uri)
        $httpWebRequest.Method = "POST"
        $httpWebRequest.Host = $uri.Host
        $httpWebRequest.UserAgent = "eVestment"
        $httpWebRequest.ContentType = $httpContentType
        $httpWebRequest.ContentLength = $data.Length
        $httpWebRequest.Timeout = 30 * 1000
        $httpWebRequest.Accept = "*/*"
        $httpWebRequest.ServerCertificateValidationCallback = {
            param($sender, $certificate, $chain, $errors)
            return $true
        }

        if ($OriginalUrl)
        {
            $httpWebRequest.Headers.Add('X-MPTrans-OriginalUrl', $OriginalUrl)
        }

        if ($Force)
        {
            $httpWebRequest.Headers.Add('X-MPTrans-Translate', 'true')
        }


        $result = [PSCustomObject] @{
            Request = $httpWebRequest
            RequestBody = $Content
            RequestHeaders = @{}

            Response = $null
            ResponseBody = $null
            ResponseHeaders = @{}
        }

        try
        {
            $stream = $httpWebRequest.GetRequestStream()
            $stream.Write($data, 0, $data.Length)

            $response = $httpWebRequest.GetResponse()
            $responseReader = New-Object System.IO.StreamReader -ArgumentList $response.GetResponseStream()
            $result.Response = $response
            $result.ResponseBody = $responseReader.ReadToEnd()

            $requestHeaders = @{}
            $httpWebRequest.Headers | ForEach-Object { $requestHeaders[$_] = $httpWebRequest.Headers[$_] }
            $result.RequestHeaders = $requestHeaders

            $responseHeaders = @{}
            $response.Headers | ForEach-Object { $responseHeaders[$_] = $response.Headers[$_] }
            $result.ResponseHeaders = $responseHeaders
        }
        finally
        {
            $stream.Close()
        }

        $result
    }
}
