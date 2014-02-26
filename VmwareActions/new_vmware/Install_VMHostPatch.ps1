Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$hostNames = $args[3]
$patchPath = $args[4]
$hostUsername = $args[5]
$hostPassword = $args[6]



$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Install-VMHostPatch -VMHost $hostNames -LocalPath $patchPath -HostUsername $hostUsername -HostPassword $hostPassword -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
