#Creates a new cluster named Cluster1 on the Datacenter. Then renames the cluster to Cluster2.


Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$Cluster1Name = $args[3]  # "Storage2 (2)"
$Location = $args[4]
$Cluster2Name = $args[5]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$cluster1 =  New-Cluster -Name Cluster1Name -Location $Location -Confirm:$false

$cluster2 = Set-Cluster -Cluster $cluster1 -Name $Cluster2Name -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
