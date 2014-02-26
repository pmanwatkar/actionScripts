Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$host = $args[3]
$vSwitchName = $args[4]
$newName = $args[5]  
$vlanID = $args[6]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$vswitch =  New-VirtualSwitch -VMHost $host -Name $vSwitchName

$vportgroup1 =  New-VirtualPortGroup -VirtualSwitch $vswitch -Name $newName

Set-VirtualPortGroup -VirtualPortGroup $vportgroup1 -VLanId $vlanID -Confirm:$false


Disconnect-VIServer -Server $vc -Confirm:$false
