Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$nameModule = $args[3]
$hostModule = $args[4]
$newOptions = $args[5]  


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$module = Get-VMHostModule -Name $nameModule

Set-VMHostModule -HostModule $hostModule -Options "$newOptions" -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
