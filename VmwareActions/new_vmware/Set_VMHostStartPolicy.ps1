Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$hostName = $args[3]
$stopAction= $args[4]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$hoststartpolicy = Get-VMHostStartPolicy -VMHost $hostName

Set-VMHostStartPolicy -VMHostStartPolicy $hoststartpolicy -StopAction $stopAction -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
