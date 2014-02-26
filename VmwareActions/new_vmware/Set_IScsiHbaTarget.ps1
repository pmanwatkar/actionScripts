#Retrieves the targets of type Static on the specified address and sets their CHAP type to Prohibited.


Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$IP = $args[3]  # "Storage2 (2)"


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-IScsiHbaTarget -Address "$IP" -Type Static | Set-IScsiHbaTarget -ChapType Prohibited -Confirm:$false



Disconnect-VIServer -Server $vc -Confirm:$false
