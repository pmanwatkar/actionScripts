Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$new_User = $args[3]
$new_Pass = $args[4]  
$groupID = $args[5]
$userAccount = $args[6]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password


$userAccount = New-VMHostAccount -ID $new_User -Password $new_Pass -UserAccount 

$groupAccount = New-VMHostAccount -ID $groupID -GroupAccount -AssignUsers $new_User 


Set-VMHostAccount -UserAccount $userAccount -UnassignGroups $groupID -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
