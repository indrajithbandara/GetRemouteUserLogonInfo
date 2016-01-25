Write-Host "Logon Script starting"
$hostname = (Get-WMIObject -Class Win32_OperatingSystem).CSName
$Date = get-date
$User = [Environment]::UserName
$Domain = [Environment]::UserDomainName
$Peka = [Environment]::MachineName
$UserFull = ([adsi]"WinNT://$Domain/$User,user").fullname
$Name = "\\server\LOGON$\$hostname.log"
$Name1="\\server\LOGON$\$UserFull.log"
"Logout$Date`t$User`t$Peka`t$UserFull" >> $Name
"$Date`t$User`t$Peka`t$UserFull`t$CLIENTNAME" >> $Name1
$ostype = Get-WMIObject -Class Win32_OperatingSystem
$username = (Get-WMIObject -Class Win32_ComputerSystem).UserName
