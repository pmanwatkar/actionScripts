Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$question = $args[3]
$defaultOption=$args[4]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-VMQuestion -VMQuestion $question -DefaultOption $defaultOption -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
