Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vmName = $args[3]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-PassthroughDevice -VM $vmName | Remove-PassthroughDevice -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false