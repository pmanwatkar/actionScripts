Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$clusterName = $args[3]
$ruleName = $args[4]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$rules = Get-DrsRule -Cluster $clusterName -Name "$ruleName" 

Remove-DrsRule $rules -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
