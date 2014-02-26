Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$ClusterName = $args[3]  # "Storage2 (2)"
$LocationName = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password


#Set-Annotation [-Entity] <InventoryItem> [-CustomAttribute] <CustomAttribute> [-Value] <String> [-Server <VIServer[]>] [-WhatIf] [-Confirm] [<CommonParameters>]


Get-Cluster $ClusterName | Set-Annotation -CustomAttribute "PhysicalLocation" -Value $LocationName -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
