##[17::Anomaly: Systems using many different protocols::Reyes-R17-Anomaly: Systems using many different protocols]
# Crafted APT URL IOC
$target = '10.4.9.171'

# Relevant Ports
$port1 = 23
$port2 = 25
$port3 = 21
$port4 = 80


# Make Connections
$connection1 = (New-Object Net.Sockets.TcpClient).Connect($target,$port1); If ($connection1.Connected) { $connection1.KeepAlive=true }
$connection2 = (New-Object Net.Sockets.TcpClient).Connect($target,$port2); If ($connection2.Connected) { $connection2.KeepAlive=true }
$connection3 = (New-Object Net.Sockets.TcpClient).Connect($target,$port3); If ($connection3.Connected) { $connection3.KeepAlive=true }
$connection4 = (New-Object Net.Sockets.TcpClient).Connect($target,$port4); If ($connection4.Connected) { $connection4.KeepAlive=true }