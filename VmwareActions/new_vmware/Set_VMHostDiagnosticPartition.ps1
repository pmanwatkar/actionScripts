Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$host = $args[3]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$diagPartition = Get-VMHostDiagnosticPartition -VMHost $host

$diagPartition | Set-VMHostDiagnosticPartition -Active $false -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
