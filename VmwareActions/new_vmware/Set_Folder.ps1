#Renames the Folder1 folder to Folder2. Asks for confirmation before running the command


Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$Folder1 = $args[3]  # "Storage2 (2)"
$Folder2 = $args[4]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Set-Folder -Folder <Folder> [-Name] <String> [-Server <VIServer[]>] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-Folder -Folder Folder1 -Name Folder2 -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
