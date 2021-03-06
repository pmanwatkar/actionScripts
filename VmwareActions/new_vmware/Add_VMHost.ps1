Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$VMHost = $args[3]



$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Add-VMHost $VMHost -Location (Get-Datacenter $server_name) -User $username -Password $password -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false