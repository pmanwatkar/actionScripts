Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$serverIp = $args[3]
$hostName = $args[4]  


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-VMHostSysLogServer -SysLogServer '$serverIp' -VMHost $hostname -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
