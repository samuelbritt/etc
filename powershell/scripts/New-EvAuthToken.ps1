param(
    [string] $UserName = 'sbrittco',
    [string] $Password,
    [Parameter()]
    [ValidateSet('Dev', 'Tub', 'TestOld', 'Test', 'Prod')]
    [string] $Environment = 'Dev'
)

$appUrls = @{
    Dev = "http://localhost"
    Tub = "http://tub-analytic-01.evestment.local"
    TestOld = "https://testing.evestment.com"
    Test = "https://testing-app.evestment.com"
    Prod = "https://app.evestment.com"
}

$tokenAuthEndpoint = "api/private/v1/authenticate/token"

if (-not ($Username -and $Password))
{
    $cred = Get-Credential -UserName $UserName -Message "Please supply Evestment credentials"
    $UserName = $cred.UserName
    $Password = $cred.GetNetworkCredential().Password
}


$url = $appUrls[$Environment], $tokenAuthEndpoint -join '/'
$payload = @{
    'username' = $UserName
    'password' = $Password
    'deviceid' = 'default'
}

$payloadJson = $payload | ConvertTo-Json
Invoke-WebRequest -Uri $url -Body $payloadJson -Method Post -ContentType 'application/json' |
    Select-Object -ExpandProperty Content |
    ConvertFrom-Json |
    Select-Object -Property @(
    @{n = 'UserId'; e = { $_.userId } }
    @{n = 'Token'; e = { $_.token } }
    @{n = 'ExpiresOnUtc'; e = { $_.expiresOnUtc } }
    @{n = 'AuthorizationHeader'; e = { "token $($_.token)" } }
)