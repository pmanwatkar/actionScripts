Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$host = $args[3]
$destinationPath = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-VMHostFirmware -VMHost $host -DestinationPath $destinationPath -BackupConfiguration -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
