Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$host = $args[3]
$value = $args[4] 
$firewallpolicy = $args[5]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$firewallpolicy = Get-VMHostFirewallDefaultPolicy -VMHost $host

Set-VMHostFirewallDefaultPolicy -Policy $firewallpolicy -AllowOutGoing $"$value" | fl -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
