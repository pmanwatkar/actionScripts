Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$permissionName = $args[3]
$roleName = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-VIPermission -Permission $permissionName -Role $roleName -Propagate:$false -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false