#Specifies that the VMware vSphere PowerCLI does not use a proxy server to connect to the vSphere server.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-PowerCLIConfiguration -ProxyPolicy NoProxy -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false



