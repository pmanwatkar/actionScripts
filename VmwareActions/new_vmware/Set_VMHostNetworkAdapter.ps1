Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vmHostIp = $args[3]
$vswitchName = $args[4]  
$portGroup=$args[5]
$subnetMask= $args[6]
$mtuSize= $args[7]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$vswitch =  New-VirtualSwitch -VMHost $vmHostIp  -Name $vswitchName

$nic =  New-VMHostNetworkAdapter -VMHost $vmHostIp -PortGroup $portGroup -VirtualSwitch $vswitch -IP $vmHostIp -SubnetMask $subnetMask

Set-VMHostNetworkAdapter -VirtualNIC $nic -IP $vmHostIp -SubnetMask $subnetMask -Mtu $mtuSize -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
