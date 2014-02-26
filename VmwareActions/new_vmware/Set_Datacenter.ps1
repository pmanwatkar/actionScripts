#Renames the Datacenter1 to Datacenter2.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$OldDCName = $args[3]  # "Storage2 (2)"
$NewDCName = $args[4]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Set-Datacenter [-Datacenter] <Datacenter> [-Name] <String> [-Server <VIServer[]>] [-RunAsync] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-Datacenter -Datacenter $OldDCName -Name $NewDCName -Confirm:$false



Disconnect-VIServer -Server $vc -Confirm:$false
