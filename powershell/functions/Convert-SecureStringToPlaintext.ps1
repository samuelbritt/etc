function Convert-SecureStringToPlaintext
{
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [SecureString] $SecureString
    )
    $cred = New-Object PSCredential 'x', $SecureString
    $cred.GetNetworkCredential().Password
}
