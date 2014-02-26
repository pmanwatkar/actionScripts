
#Sets the server connection mode of PowerCLI to "multiple".

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-PowerCLIConfiguration -DefaultVIServerMode multiple -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false








