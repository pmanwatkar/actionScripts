Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$hostName = $args[3]
$username = $args[4]
$password = $args[5]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

New-VICredentialStoreItem -Host $hostName -User $username -Password $password -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
