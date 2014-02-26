Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$host = $args[3]
$serviceName = $args[4]  # "Storage2 (2)"
$booleanvalue=$args[5]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$ftpFirewallExceptions = Get-VMHostFirewallException -VMHost $host | where {$_.Name.StartsWith('$serviceName')}

$ftpFirewallExceptions | Set-VMHostFirewallException -Enabled $"$booleanValue" -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
