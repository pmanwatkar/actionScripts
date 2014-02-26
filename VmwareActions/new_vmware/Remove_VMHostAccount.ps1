Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$ID = $args[3]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Get-HardDisk -VM $vmName | Copy-HardDisk "[$storageName]/" -Confirm:$false
#Remove-VMHostAccount [-HostAccount] <HostAccount[]> [-WhatIf] [-Confirm] [<CommonParameters>]
Get-VMHostAccount -Group -ID $ID user | Remove-VMHostAccount -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
