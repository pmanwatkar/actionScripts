Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$sourcePath = $args[3]
$hostName = $args[4]
$dsName = $args[5]  # "\CLMDATACENTER\Storage2 (2)\winTest\*"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Import-VApp -Source $sourcePath -VMHost $hostName -Datastore (Get-Datastore -VMHost $hostName -Name $dsName)  -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false