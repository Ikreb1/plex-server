Add-Type -AssemblyName System.Net.NetworkInformation
$NetworkInterfaces = [System.Net.NetworkInformation.NetworkInterface]::GetAllNetworkInterfaces()
$IP_ADDRESS = ""

foreach ($Interface in $NetworkInterfaces) {
    if ($Interface.OperationalStatus -eq "Up" -and $Interface.NetworkInterfaceType -ne "Loopback") {
        $IPProps = $Interface.GetIPProperties()
        $IPv4Address = $IPProps.UnicastAddresses | Where-Object { $_.Address.AddressFamily -eq "InterNetwork" }
        if ($IPv4Address -ne $null) {
            $IP_ADDRESS = $IPv4Address.Address.ToString()
            break
        }
    }
}

Write-Host "Your Plex server is accessible at http://$IP_ADDRESS`:32400/web"
