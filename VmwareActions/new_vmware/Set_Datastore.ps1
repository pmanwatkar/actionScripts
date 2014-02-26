#Renames the Datastore1 datastore to Datastore2.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$OldDatastore = $args[3]  # "Storage2 (2)"
$NewDatastore = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Set-Datastore [-Datastore] <Datastore> [-Name] <String> [-Server <VIServer[]>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-Datastore -Name $OldDatastore | Set-Datastore -Name $NewDatastore -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
