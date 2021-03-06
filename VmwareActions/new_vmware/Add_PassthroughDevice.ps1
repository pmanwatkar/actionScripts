Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$VMHost = $args[3]
$VM = $args[4]
$Type = $args[5]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$scsiDeviceList = Get-PassthroughDevice -VMHost $VMHost -Type $Type -Confirm:$false

Add-PassthroughDevice -VM $VM -PassthroughDevice $scsiDeviceList[0] -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false