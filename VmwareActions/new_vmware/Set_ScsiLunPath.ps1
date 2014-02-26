#Sets the specified SCSI Lun path as preferred.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$VMhostIP = $args[3] 
$LunType = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password


$scsilun = Get-ScsiLun -VMHost $VMhostIP -LunType $LunType -Confirm:$false

$scsipath = Get-ScsiLunPath -ScsiLun $scsilun -Confirm:$false

Set-ScsiLunPath -ScsiLunPath $scsipath -Preferred $true -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
