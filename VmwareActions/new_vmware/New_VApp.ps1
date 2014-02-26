Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vAppName = $args[3]
$cpuLimitMhz = $args[4]
$cpuReserveMHz = $args[5]
$location = $args[6]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

New-VApp -Name $vAppName -CpuLimitMhz $cpuLimitMhz -CpuReservationMhz $cpuReserveMHz -Location $location -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
