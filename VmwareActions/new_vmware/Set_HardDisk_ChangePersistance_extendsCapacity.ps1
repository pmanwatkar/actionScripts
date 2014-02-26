#If you are connected to an ESX 3.0 host, the size of the disk cannot be cha nged and the CapacityKB parameter is discarded. If you are connected to an ESX 3.5 host, the size of the disk can only be increased and the CapacityKB parameter is discarded if its value is less than the current disk size. The Inflate parameter is supported only when connected to ESX 3.5 or later. On ESX versions higher than 3.0, non-persistent and undoable disks are not supported. Guest resizing is supported only on ESX 3.5 and later. Migrating a hard disk attached to a virtual machine to a different datastor e is supported only on vCenter Server.

#Extends a hard disk with the specified capacity. The command also extends the disk on the guest OS.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$harddisk = $args[3]
$extendedCapacity = $args[4]
$hostCred = $args[5]
$guestCred = $args[6]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-HardDisk -HardDisk $harddisk -CapacityKB $extendedCapacity -HostCredential $hostCred -GuestCredential $guestCred -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
