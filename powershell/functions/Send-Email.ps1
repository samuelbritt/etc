function Send-Email
{
    param (
        [string] $FromAddress,
        [string[]] $ToAddress,
        [string] $Subject,
        [string] $Body,
        [switch] $Html,
        [string] $Host = "ev-smtp.evestment.local",
        [int] $Port = 25
    )
    $smtpClient = New-Object System.Net.Mail.SmtpClient
    $smtpClient.Host = "ev-smtp.evestment.local"
    $smtpClient.Port = 25

    $mailMessage = New-Object System.Net.Mail.MailMessage
    $mailMessage.From = New-Object System.Net.Mail.MailAddress($FromAddress)
    $mailMessage.To.Add($ToAddress)
    $mailMessage.Subject = $Subject
    $mailMessage.Body = $Body
    if ($Html)
    {
        $mailMessage.IsBodyHtml = $true
    }

    $smtpClient.Send($mailMessage)
}
