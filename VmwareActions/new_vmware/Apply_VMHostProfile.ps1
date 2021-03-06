Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$ProfileName = $args[3]
$Cluster = $args[4]




$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$profile = Get-VMHostProfile -Name $ProfileName

$applyCluster = Get-Cluster -Name $Cluster

Apply-VMHostProfile -AssociateOnly -Entity $applyCluster -Profile $profile -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false