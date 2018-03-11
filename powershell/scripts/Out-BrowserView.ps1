$tmp = New-TemporaryFile
$tmpHtml = "$tmp.html"
Move-Item $tmp $tmpHtml
$input > $tmpHtml
Start-Process $tmpHtml;
Start-Job -ScriptBlock { Start-Sleep 1; Remove-Item $using:tmpHtml } | Out-Null
