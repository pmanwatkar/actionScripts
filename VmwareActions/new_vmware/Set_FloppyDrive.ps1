#Sets a floppy to start connected.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$floppy = $args[3]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Set-FloppyDrive [-Floppy] <FloppyDrive[]> [-FloppyImagePath <String>] [-HostDevice <String>] [-NoMedia] [-StartConnected [<Boolean>]] [-Connected [<Boolean>]] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-FloppyDrive -Floppy $floppy -StartConnected:$true -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
