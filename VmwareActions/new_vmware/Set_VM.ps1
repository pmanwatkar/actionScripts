Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vmName = $args[3]
$newVmName = $args[4]
$guestId = $args[5]
$description = $args[6]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Set-VM -VM $vmName  -Name $newVmName -GuestId "$guestId" -Description "$description" -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
