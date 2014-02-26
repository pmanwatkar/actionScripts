Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vm_host = $args[3]  # "Storage2 (2)"
$NtpServer = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Remove-VMHostNtpServer [-NtpServer] <String[]> [-VMHost] <VMHost[]> [-Server <VIServer[]>] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-VmHostNtpServer -NtpServer $NtpServer -VMHost $vm_host -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
