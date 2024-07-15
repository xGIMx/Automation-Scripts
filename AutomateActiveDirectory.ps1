[guid]::NewGuid()
ipconfig /release
ipconfig /renew
ipconfig /flushdns
net start w32time
w32tm /resync /force
$randomComputerName = -join ("win-" + (Get-Random -Minimum 10000 -Maximum 99999))
Rename-Computer -NewName $randomComputerName -Force
$DomainName = "<domain>"
$username = "<domain>\<user>"
$password = "<password>" | ConvertTo-SecureString -asPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -NewName $randomComputerName -DomainName $DomainName -Credential $Credential -Restart
Remove-Item $PSCommandPath
