function Invoke-SupersetImport
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateScript({Test-Path $_})]
        [string] $Path,
        [Parameter()]
        [ValidateSet("Dev", "Tub", "Test", "Prod")]
        [string] $Environment = "Dev",
        [Parameter()]
        [string] $AuthenticationToken
    )
    Process
    {
        Set-StrictMode -Version Latest

        Set-StrictMode -Version Latest
        Add-Type -AssemblyName System.Net.Http
        Add-Type -AssemblyName System.Web

        $Path = Resolve-Path $Path

        $urlBase = @{
            Dev = "http://localhost"
            Tub = "http://tub-analytic-01.evestment.local"
            TestOld = "https://testing.evestment.com"
            Test = "https://testing-app.evestment.com"
            Prod = "https://app.evestment.com"
        }

        $urlPath = '/api/superset/v1/import'

        $url = "$($urlBase[$Environment])/$urlPath"
        $headers = @{
            "Authorization" = "token $AuthenticationToken"
        }

        $fileName = (Get-Item $Path).Name
        $boundary = [guid]::NewGuid().ToString()
        $mediaType = [System.Web.MimeMapping]::GetMimeMapping($Path)
        if (-not $mediaType)
        {
            $mediaType = "application/octet-stream"
        }

        $fileStream = New-Object System.IO.FileStream $Path, 'Open', 'Read', 'ReadWrite'
        $memoryStream = New-Object System.IO.MemoryStream
        $fileStream.CopyTo($memoryStream)
        $fileBin = $memoryStream.ToArray()
        $memoryStream.Close()
        $fileStream.Close()
        $enc = [System.Text.Encoding]::GetEncoding("iso-8859-1")
        $template = @'
--{0}
Content-Disposition: form-data; name="file"; filename="{1}"
Content-Type: {2}

{3}
--{0}--

'@
        $body = $template -f $boundary, $fileName, $mediaType, $enc.GetString($fileBin)
        $contentType = "multipart/form-data; boundary=$boundary"

        $res = Invoke-RestMethod -Uri $url -Method Post -ContentType $contentType -Body $body -Headers $headers

        if ($res -and ($res | Get-Member -Name "message") -and $res.message)
        {
            Write-Error $res.message
        }

        $res
    }
}
