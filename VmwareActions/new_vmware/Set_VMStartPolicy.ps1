Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vmName = $args[3]
$startAction = $args[4]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$vmstartpolicy = Get-VMStartPolicy -VM $vmName

Set-VMStartPolicy -StartPolicy $vmstartpolicy -StartAction $startAction -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
