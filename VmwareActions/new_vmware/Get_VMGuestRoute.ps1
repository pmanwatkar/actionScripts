Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$HostUser = $args[3]
$HostPassword = $args[4]
$GuestUser = $args[5]
$GuestPassword = $args[6]
$VM = $args[7]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-VMGuestRoute -VM $VM -HostUser $HostUser -HostPassword $HostPassword -GuestUser $GuestUser -GuestPassword $GuestPassword

Disconnect-VIServer -Server $vc -Confirm:$false

