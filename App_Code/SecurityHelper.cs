using System;
using System.Security.Cryptography;
using System.Text;

public static class SecurityHelper
{
    // 🔹 API-Provided AES Key (Padded to 32 Bytes)
    private static readonly byte[] AES_KEY = Encoding.UTF8.GetBytes("NDSICDM".PadRight(32, '0'));

    public static string GenerateChecksum(string payload)
    {
        // 🔹 Step 1: Normalize JSON (Ensures Consistent Formatting)
        payload = NormalizeJson(payload);

        // 🔹 Step 2: Compute SHA-256 Hash
        byte[] sha256Bytes;
        using (SHA256 sha256 = SHA256.Create())
        {
            sha256Bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(payload));
        }

        // 🔹 Step 3: Encrypt SHA-256 Hash Using AES-256
        byte[] encryptedBytes = EncryptAES(sha256Bytes);

        // 🔹 Step 4: Base64 Encode the Encrypted Data
        return Convert.ToBase64String(encryptedBytes);
    }

    private static string NormalizeJson(string json)
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(
            Newtonsoft.Json.JsonConvert.DeserializeObject(json),
            Newtonsoft.Json.Formatting.None
        );
    }

    private static byte[] EncryptAES(byte[] input)
    {
        using (Aes aes = Aes.Create())
        {
            aes.Key = AES_KEY;  // Ensure 32 Bytes for AES-256
            aes.Mode = CipherMode.ECB;
            aes.Padding = PaddingMode.PKCS7;

            using (ICryptoTransform encryptor = aes.CreateEncryptor())
            {
                return encryptor.TransformFinalBlock(input, 0, input.Length);
            }
        }
    }
}
