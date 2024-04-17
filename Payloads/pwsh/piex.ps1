$pass = Read-Host 'What is your password?' -AsSecureString
$clearPass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass))

py "\psexec.py" ENV::USER:$clearpass@target01 cmd.exe