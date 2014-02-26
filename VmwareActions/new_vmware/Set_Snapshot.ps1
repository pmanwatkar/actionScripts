Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$snapshot = $args[3]
$newSnapName = $args[4]
$description = $args[5]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-Snapshot -Snapshot $snapshot -Name $newSnapName -Description "$description" -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false