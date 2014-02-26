Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$dcLocation = $args[3]
$cpuLimitMHz = $args[4]
$memLimitMB = $args[5]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$vapp = Get-VApp -Location $dcLocation 

Set-VApp -VApp $vapp -CpuExpandableReservation:$true -CpuLimitMhz $cpuLimitMHz -MemExpandableReservation:$true -MemLimitMB $memLimitMB -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false