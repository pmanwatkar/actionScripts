Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$templateName = $args[3]
$newTempName = $args[4]
$dcName = $args[5]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

New-Template -VM $templateName -Name $newTempName -Location $dcName -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
