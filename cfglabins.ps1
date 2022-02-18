[String] $labin=Read-Host("Digite o nº do labin ")
[String] $pc=Read-Host("Digite o nº do PC")

$idlabin = $labin
$idpc = $pc
$idpc = [int]$pc + 1
 $labin = 'LABIN' + $labin
$pc= 'PC'+ $pc
$comp= $labin +'-'+ $pc

$idnet = '192.168.'+$idlabin+'.'+$idpc
$idgat = '192.168.'+$idlabin+'.1'
$idnet = [int]$idnet
$idgat = [int]$idgat

Write-Output($pc)
Write-Output($labin)
Write-Output ($comp)



Invoke-Command  { Rename-Computer -NewName $comp -Force} #ira trocar o nome do computador
Start-Sleep 1
Invoke-Command { New-NetIPAddress $idnet -InterfaceAlias Ethernet -DefaultGateway $idgat -AddressFamily IPV4 -PrefixLength 24 } #ira colocar o ip, netmask, gateway
Invoke-Command {Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 8.8.8.8 , 8.8.4.4} # ira colocar os servidores DNS