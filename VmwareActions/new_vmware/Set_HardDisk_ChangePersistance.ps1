#If you are connected to an ESX 3.0 host, the size of the disk cannot be cha nged and the CapacityKB parameter is discarded. If you are connected to an ESX 3.5 host, the size of the disk can only be increased and the CapacityKB parameter is discarded if its value is less than the current disk size. The Inflate parameter is supported only when connected to ESX 3.5 or later. On ESX versions higher than 3.0, non-persistent and undoable disks are not supported. Guest resizing is supported only on ESX 3.5 and later. Migrating a hard disk attached to a virtual machine to a different datastor e is supported only on vCenter Server.

#Changes the persistence of a hard disk to IndependentNonPersistent.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vm_Name = $args[3]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-HardDisk -VM $vm_Name | Set-HardDisk -Persistence "IndependentNonPersistent -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
