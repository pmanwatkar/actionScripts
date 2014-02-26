#Configures the SCSI Lun device of the virtual machine host, so that the maximum number of I/O requests to be issued before the system tries to select a different path is ***.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vmHostIP = $args[3]
$LunType = $args[4]
CommandsToSwitchPath = $args[5]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password


$scsilun = Get-ScsiLun -VMHost $vmHostIP -LunType $LunType -Confirm:$false

Set-ScsiLun -ScsiLun $scsilun -CommandsToSwitchPath $CommandsToSwitchPath -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
