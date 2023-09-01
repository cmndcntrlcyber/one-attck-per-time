

$machines1 = Get-Content -Path "list.txt" 
$machines2 = Get-Content -Path "list2.txt"

foreach ($machine in $machines1)
{ 
Write-Host "Currently the script is copying files on" $machine 
Copy-Item -Path "\hta.js" -Destination "\\$machine\c$\temp\hta.js" 
}

foreach ($machine in $machines1)
{ 
$s = New-PSSession -ComputerName $machine
Invoke-Command -Session $s -ScriptBlock { wscript.exe "\\$machine\c$\temp\hta.js"} 
}

foreach ($machine in $machines2)
{ 
Write-Host "Currently the script is copying files on" $machine 
Copy-Item -Path "\hta.js" -Destination "\\$machine\c$\temp\hta.js" 
}

foreach ($machine in $machines2)
{ 
$s = New-PSSession -ComputerName $machine
Invoke-Command -Session $s -ScriptBlock { wscript.exe "\\$machine\c$\temp\hta.js"}
}

Write-Output "23 Done"