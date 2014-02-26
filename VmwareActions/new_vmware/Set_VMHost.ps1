Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$host = $args[3]
$state = $args[4]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-VMHost -VMHost $host -State "$state" -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
