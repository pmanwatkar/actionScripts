#Enables SNMP on a virtual machine host.


Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$hostSNMP  = $args[3]
$community = $args[4]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$hostSNMP = Get-VMHostSNMP

$hostSNMP = Set-VMHostSNMP $hostSNMP -Enabled:$true -ReadOnlyCommunity "$community" -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
