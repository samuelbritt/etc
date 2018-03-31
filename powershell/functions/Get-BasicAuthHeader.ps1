function Get-BasicAuthHeader
{
    param ([string]$Username, [SecureString]$Password)
    Set-StrictMode -Version Latest
    $plaintextPassword = Convert-SecureStringToPlaintext $Password
    $bytes = [System.Text.Encoding]::ASCII.GetBytes("${Username}:${plaintextPassword}")
    $encoded = [System.Convert]::ToBase64String($bytes)
    $auth = "Basic $encoded"
    $header = @{ Authorization = $auth }
    Write-Output $header
}
