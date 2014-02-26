Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$hostName = $args[3]
$vSwitchName = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$vswitch =  New-VirtualSwitch -VMHost $hostName -Name $vSwitchName

Remove-VirtualSwitch -VirtualSwitch $vswitch -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false