Write-Host "Logon Script starting"
$hostname = (Get-WMIObject -Class Win32_OperatingSystem).CSName
$Date = get-date
$User = [Environment]::UserName
$Domain = [Environment]::UserDomainName
$Peka = [Environment]::MachineName
$UserFull = ([adsi]"WinNT://$Domain/$User,user").fullname
$Name = "\\server\LOGON\$hostname.log"
$Name1="\\server\LOGON$\$UserFull.log"
"$Date`t$User`t$Peka`t$UserFull`t$CLIENTNAME" >> $Name
"$Date`t$User`t$Peka`t$UserFull`t$CLIENTNAME" >> $Name1
$ostype = Get-WMIObject -Class Win32_OperatingSystem
$username = (Get-WMIObject -Class Win32_ComputerSystem).UserName
if (!$username){
  $username=get-content env:\username
  $smtpTo = $username.substring(0)+"@domain.ru"
  $smtpFrom = $username.substring(0)+"@domain.ru"
}
else{
  $smtpTo = $username.substring(5)+"@domain.ru"
  $smtpFrom = $username.substring(5)+"@domain.ru"
}
$Processes = Get-WMIObject -class win32_process | where {$_.ProcessName -eq "explorer.exe"}
$tssessionid = $Processes.SessionID
if ($tssessionid -eq '1'){
    $smtp = New-Object Net.Mail.SmtpClient("mail.domain.ru")
#   $smtp.Send($smtpTo,$smtpFrom,"Logon","Username: "+$username+"use RDP at: "+$hostname+" if it did not You call 4426 ")
    $smtp.Send("sysop@domain.ru",$smtpFrom,"Logon","Username: "+$username+"use RDP at: "+$hostname+" ")
}
else
{

}
