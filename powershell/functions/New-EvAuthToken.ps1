function Get-EvAuth
{
    param(
        [Parameter()]
        [ValidateSet('Local', 'Tub', 'Testing', 'Production')]
        [string] $Environment = 'Dev',
        [PSCredential] $Credential = (Get-Credential -Message "Please enter your eVestment app credentials")
    )

    $appUrls = @{
        Local = "http://localhost"
        Tub = "http://tub-analytic-01.evestment.local"
        Testing = "https://app.testing.evestment.com"
        Production = "https://app.evestment.com"
    }

    $appUrl = [uri] $appUrls[$Environment]
    $tokenAuthEndpoint = "api/private/v1/authenticate/token"

    [uri] $tokenUri = New-Object uri -ArgumentList $appUrl, '/api/private/v1/authenticate/token'
    [uri] $formsUri = New-Object uri -ArgumentList $appUrl, '/api/private/v1/authenticate/forms/token'

    # $UserName = $Credential.UserName
    # $Password = $Credential.GetNetworkCredential().Password

    # $url = $appUrl, $tokenAuthEndpoint -join '/'
    $body = @{
        'username' = $Credential.UserName
        'password' = $Credential.GetNetworkCredential().Password
        'deviceid' = 'default'
    } | ConvertTo-Json

    $tokenResponse = Invoke-WebRequest -Uri $tokenUri -Body $body -ContentType "application/json" -Method Post |
        ConvertFrom-Json

    if (!$tokenResponse)
    {
        return
    }

    $body = @{
        apitoken = $tokenResponse.token
    }

    Invoke-WebRequest -Uri $formsUri -Body $body -SessionVariable "session" | Out-Null

    $cookies = $session.Cookies.GetCookies($formsUri)

    [PSCustomObject]@{
        UserId = $tokenResponse.userId
        Token = $tokenResponse.token
        TokenAuthHeader = "token $($tokenResponse.token)"
        FormsAuth = $cookies['.ASPXAUTH']
    }

    # $webSession = New-Object Microsoft.PowerShell.Commands.WebRequestSession

    # # $payloadJson = $payload | ConvertTo-Json
    # Invoke-WebRequest -Uri $url -Body $body -Method Post -ContentType 'application/json' |
    #     Select-Object -ExpandProperty Content |
    #     ConvertFrom-Json |
    #     Select-Object -Property @(
    #         @{n = 'UserId'; e = { $_.userId } }
    #         @{n = 'Token'; e = { $_.token } }
    #         @{n = 'ExpiresOnUtc'; e = { $_.expiresOnUtc } }
    #         @{n = 'AuthorizationHeader'; e = { "token $($_.token)" } }
    #     )
}

# Get-EvAuth -Environment Testing -Credential (Import-Clixml C:\Users\sbritt\.credentials\evestment.xml)