# Sets the value of the CF custom field of the VM virtual machine.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$VM_name = $args[3]  # "Storage2 (2)"
$FieldName = $args[4]
$Value = $args[5]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Set-CustomField [-Entity] <InventoryItem> [-Name] <String> [[-Value] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-VM $VM_name | Set-CustomField -Name $FieldName -Value $Value -Confirm:$false



Disconnect-VIServer -Server $vc -Confirm:$false
