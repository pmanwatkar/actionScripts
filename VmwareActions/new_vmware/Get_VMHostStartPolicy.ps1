Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$VMHost =$args[3]



$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-VMHostStartPolicy -VMHost $VMHost

Disconnect-VIServer -Server $vc -Confirm:$false