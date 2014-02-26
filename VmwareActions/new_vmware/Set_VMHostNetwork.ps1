Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$hostName = $args[3]
$domainName= $args[4]
$vmKernelGateway= $args[5]
$hostName= $args[6]
$dnsFromDhcpBoolean= $args[7]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$vmHostNetworkInfo = Get-VmHostNetwork -Host $hostName

Set-VmHostNetwork -Network $vmHostNetworkInfo -VMKernelGateway $vmKernelGateway -DomainName $domainName -HostName $hostName -DnsFromDhcp $"$dnsFromDhcpBoolean" -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
