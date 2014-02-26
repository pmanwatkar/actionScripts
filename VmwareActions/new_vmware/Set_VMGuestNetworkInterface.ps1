Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$hostUser = $args[3]
$vmGuestNetworkInterface = $args[4]
$hostUsername = $args[5]
$hostPassword = $args[6]
$pass01 = $args[7]  
$guestUser = $args[8]
$guestPassword = $args[9]
$netmask = $args[10]
$gatewayIp = $args[11]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-VMGuestNetworkInterface -VMGuestNetworkInterface $vmGuestNetworkInterface -HostUser $hostUsername -HostPassword $hostPassword -GuestUser $guestUSer -GuestPassword $guestpassword -Netmask $netmask -Gateway $gatewayIp -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
