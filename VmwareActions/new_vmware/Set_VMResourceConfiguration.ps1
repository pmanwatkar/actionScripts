Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$confObject = $args[3]
$cpu1 = $args[4]  
$cpu2=$args[5]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-VMResourceConfiguration -Configuration $confObject -CpuAffinity ([CpuAffinity]::$cpu1 -bor [CpuAffinity]::$cpu2) -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
