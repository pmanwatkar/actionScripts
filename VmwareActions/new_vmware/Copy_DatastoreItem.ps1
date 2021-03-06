Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$Source = $args[3]
$Destination = $args[4]




$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Copy-DatastoreItem $Source $Destination -Force -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
