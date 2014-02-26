Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$hostUser = $args[3]
$hostPassword = $args[4]
$guestUser = $args[5]
$guestpassword = $args[6] 
$route = $args[7]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Remove-VMGuestRoute -HostUser $hostUser -HostPassword $hostPassword -GuestUser $guestUser -GuestPassword $guestPassword -VMGuestRoute $route -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false