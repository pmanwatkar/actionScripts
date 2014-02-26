Add-PSSnapin -Name "VMWare.VimAutomation.Core"
#Sets the policy of the Host virtual machine host service to "Automatic".


$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$host = $args[3]
$serviceName = $args[4] 


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$service = Get-VmHostService -VMHost $host

Set-VMHostService -Service $serviceName -Policy "Automatic" -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
