Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$NtpServerDomainName = $args[3]  # "old-ntp-server.com"

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Remove-VMHostNtpServer [-NtpServer] <String[]> [-VMHost] <VMHost[]> [-Server <VIServer[]>] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-VmHostNtpServer -NtpServer $NtpServerDomainName -VMHost (Get-VMHost) -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
