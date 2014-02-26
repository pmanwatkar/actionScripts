Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$type = $args[3]
$toType = $args[4]  
$admin=$args[5]
$admin_Password=$args[6]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-VMHostHba -Type $type | Set-VMHostHba -ChapType $toType -ChapName $admin -ChapPassword $admin_Password -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
