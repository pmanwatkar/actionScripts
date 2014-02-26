Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$ntpServer = $args[3]
$profileName = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-VMHostProfile -Name $profileName | Remove-VMHostProfile -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false