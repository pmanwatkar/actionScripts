Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$newProfileName = $args[3]
$newDescription = $args[4]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$profile = ( Get-VMHostProfile -Name $newProfileName )[0]

Set-VMHostProfile -Profile $profile -Description "$newDescription" -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
