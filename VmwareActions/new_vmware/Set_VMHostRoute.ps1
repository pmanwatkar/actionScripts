Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$hostIp = $args[3]
$destinationIp = $args[4]  
$oldGatewayIp= $args[5]
$newGatewayIp= $args[6]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$hostroute = New-VMHostRoute -VMHost $hostIp -Destination $destinationIp -Gateway $oldGatewayIp -PrefixLength 32 

$hostroute | Set-VMHostRoute -Gateway $newGatewayIp -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
