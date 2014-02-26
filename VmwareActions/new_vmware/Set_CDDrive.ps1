Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$isoPATH = $args[3]  # "Storage2 (2)"
$VM_name = $ args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password


#Set-CDDrive [-CD] <CDDrive[]> [-IsoPath <String>] [-HostDevice <String>] [-NoMedia] [-StartConnected [<Boolean>]] [-Connected [<Boolean>]] [-WhatIf] [-Confirm] [<CommonParameters>]

$cd = New-CDDrive -VM VM_name -ISOPath "$isoPATH"   #"[sof-20666-esx:storage1] ISO\testISO.iso"

Set-CDDrive -CD $cd -NoMedia -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
