Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$role = $args[3]
$privilegeName = $args[4]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password



Set-VIRole -Role $role -AddPrivilege (Get-VIPrivilege -Name '$privilegeName') -Confirm:$false




Disconnect-VIServer -Server $vc -Confirm:$false
