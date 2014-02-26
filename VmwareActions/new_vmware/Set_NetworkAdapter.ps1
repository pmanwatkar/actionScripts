#Sets a network adapter with the specified parameters.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$oldAdapter = $args[3] 
$MACAddr = $args[4]
$VM_Network = $args[5]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$networkadapter = Set-NetworkAdapter -NetworkAdapter $oldAdapter -MacAddress '$MACAddr' -WakeOnLan:$true -StartConnected:$true -Connected:$true -NetworkName '$VM_Network' -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
