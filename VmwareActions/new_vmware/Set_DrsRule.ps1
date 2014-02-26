#Updates the list of virtual machines that might be referenced by the DRS rule stored in the $affinityRule variable and enables the rule.

Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$DrsRuleVM = $args[3]  # "Storage2 (2)"
$affinityRule = $args[4]



$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

#Set-DrsRule [[-Enabled] [<Boolean>]] [-Rule] <DrsVMAffinityRule[]> [-Name <String>] [-VM <VirtualMachine[]>] [-RunAsync] [-WhatIf] [-Confirm] [<CommonParameters>]

$vm = Get-VM $DrsRuleVM

Set-DrsRule -Rule $affinityRule -VM $vm -Enabled $true -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
