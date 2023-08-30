New-Item -Path 'C:\Users\Public\stomp.txt' -Force | Out-Null
Set-Content 'C:\Users\Public\stomp.txt' -Value "T1551.006 Timestomp" -Force | Out-Null

Get-ChildItem  'C:\Users\Public\stomp.txt' | % { $_.LastWriteTime = "01/01/1970 00:00:00" }