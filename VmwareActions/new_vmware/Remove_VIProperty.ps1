Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$propertyName = $args[3]
$objectType = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Remove-VIProperty -Name $propertyName -ObjectType $objectType -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false