Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$server = $args[3]
$roleName = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-VIRole -Server $server -Name "$roleName" | Remove-VIRole -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false