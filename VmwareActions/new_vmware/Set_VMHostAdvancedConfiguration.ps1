Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$host = $args[3]
$configurationName = $args[4]  # "Storage2 (2)"
$value = $args[5]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-VMHostAdvancedConfiguration -VMHost $host -Name $configurationName -Value $value -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
