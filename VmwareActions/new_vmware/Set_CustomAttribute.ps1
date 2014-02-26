#Renames the "PhysicalLOcation" custom attribute to "Area".

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$$LocationName = $args[3]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Set-CustomAttribute [-CustomAttribute] <CustomAttribute> [-Name] <String> [-Server <VIServer[]>] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-CustomAttribute -CustomAttribute "PhysicalLocation"  -Name $LocationName -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
