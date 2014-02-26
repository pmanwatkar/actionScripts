Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$ProfileName = $args[3]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Remove-VMHostProfile [-Profile] <VMHostProfile[]> [[-Server] <VIServer[]>] [-WhatIf] [-Confirm] [<CommonParameters>] 
#Remove-VMHostProfile -Entity <InventoryItem[]> [[-Server] <VIServer[]>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-VMHostProfile -Name $ProfileName | Remove-VMHostProfile -Confirm:$false




Disconnect-VIServer -Server $vc -Confirm:$false
