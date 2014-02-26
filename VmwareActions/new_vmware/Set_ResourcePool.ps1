#Sets the CPU allocation level and the limit on memory usage in MB for the resource pool named Resourcepool.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$MemLimitMB = $args[3]
$Resourcepool = $args[4]
$NumCPUShares = $args[5]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-ResourcePool -Resourcepool $Resourcepool -NumCpuShares $NumCPUShares -MemLimitMB $MemLimitMB


Disconnect-VIServer -Server $vc -Confirm:$false
