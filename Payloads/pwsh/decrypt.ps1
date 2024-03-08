# Add required .NET assemblies
Add-Type -TypeDefinition @"
using System;
using System.IO;
using System.Net;
using System.Security.Cryptography;

public static class CryptoHelper
{
    private const string Key = "your_key"; // AES key, must be 256 bits long (32 bytes)
    private const string Vector = "your_vector"; // Initialization vector (IV), must be 128 bits long (16 bytes)

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
$url = "https://example.com/encrypted_bytes.txt"

# Download the file and decode it into a byte array
$byteString = [System.Net.WebClient]::new().DownloadData($url) | ForEach-Object { [Convert]::FromBase64String($_) }

# Decrypt the byte string and output as a string
$decryptedBytes = [CryptoHelper]::DecryptBytes($byteString)
$decryptedString = [System.Text.Encoding]::UTF8.GetString($decryptedBytes, 0, $decryptedBytes.Length)
Write-Output $decryptedString