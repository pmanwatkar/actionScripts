Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$statName = $args[3]
$samplingPeriodSecs = $args[4]
$storageTimeSecs = $args[5]



$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

New-StatInterval -Name $statName -SamplingPeriodSecs $samplingPeriodSecs -StorageTimeSecs $storageTimeSecs -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
