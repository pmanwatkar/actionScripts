Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$roleName = $args[3]
$server = $args[4]
$roleName = $args[5]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

New-VIRole -Name $roleName -Server $server -Privilege (Get-VIPrivilege -PrivilegeGroup)

$permission = New-VIPermission -Role $roleName -Principal Administrator -Entity (Get-Datacenter) -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
