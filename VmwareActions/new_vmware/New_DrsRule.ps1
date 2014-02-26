Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$cluster = $args[3]
$antiAffinityRule = $args[4]
$antiAffinityVMs = $args[5]



$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

New-DrsRule -Cluster $cluster -Name $antiAffinityRule -KeepTogether $false -VM $antiAffinityVMs -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
