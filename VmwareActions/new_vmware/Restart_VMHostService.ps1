Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vm_host = $args[3]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password


#Restart-VMHostService [-HostService] <HostService[]> [-WhatIf] [-Confirm] [<CommonParameters>]

$sshd = Get-VMHostService -VMHost $vm_host | where {$_.Key -eq 'sshd'}

Restart-VMHostService $sshd -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
