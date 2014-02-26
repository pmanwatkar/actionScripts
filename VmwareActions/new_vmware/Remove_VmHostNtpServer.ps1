Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$ntpServer = $args[3]
$host = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Remove-VmHostNtpServer -NtpServer $ntpServer -VMHost $host -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false