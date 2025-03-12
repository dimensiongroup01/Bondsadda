using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for EncryptionHelper
/// </summary>
/// 

public class EncryptDecrypt
{
    //public EncryptDecrypt()
    //{
    //    //
    //    // TODO: Add constructor logic here
    //    //
    //}

    public string Encrypt(byte[] Key, byte[] IV, string plainText)
    {
        if (plainText == null || plainText.Length <= 0)
            throw new ArgumentNullException("plainText");
        if (Key == null || Key.Length <= 0)
            throw new ArgumentNullException("Key");
        if (IV == null || IV.Length <= 0)
            throw new ArgumentNullException("IV");
        byte[] encrypted;


        using (AesCryptoServiceProvider aesAlg = new AesCryptoServiceProvider())
        {
            aesAlg.Key = Key;
            aesAlg.IV = IV;
            aesAlg.Mode = CipherMode.CBC;
            aesAlg.Padding = PaddingMode.PKCS7;

            ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

            using (MemoryStream msEncrypt = new MemoryStream())
            {
                using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                {
                    using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                    {
                        swEncrypt.Write(plainText);
                    }
                    encrypted = msEncrypt.ToArray();
                }
            }
        }
        return Convert.ToBase64String(encrypted);
    }


    public string Decrypt(byte[] Key, byte[] IV, string Text)
    {
        if (Text == null || Text.Length <= 0)
            throw new ArgumentNullException("cipherText");
        if (Key == null || Key.Length <= 0)
            throw new ArgumentNullException("Key");
        if (IV == null || IV.Length <= 0)
            throw new ArgumentNullException("IV");

        //    decodetobyteArray(ValidateBase64EncodedString(Text));
        //    decodetobyteArray(Text);

        string plaintext = null;

        byte[] cipherText = Convert.FromBase64String(Text.Replace(' ', '+'));

        using (AesCryptoServiceProvider aesAlg = new AesCryptoServiceProvider())
        {
            aesAlg.Key = Key;
            aesAlg.IV = IV;
            aesAlg.Mode = CipherMode.CBC;
            aesAlg.Padding = PaddingMode.PKCS7;
            ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);
            using (MemoryStream msDecrypt = new MemoryStream(cipherText))
            {
                using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                {
                    using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                    {
                        plaintext = srDecrypt.ReadToEnd();
                    }
                }
            }
        }
        return plaintext;
    }


}

public static class EncryptionHelper
{

    private static byte[] Key = Encoding.UTF8.GetBytes(@"1GX0RQASAP210122102844P6KB7AQTL3");
    private static byte[] IV = Encoding.UTF8.GetBytes(@"1234567887654321");

    public static string Encrypt(string plainText)
    {
        return new EncryptDecrypt().Encrypt(Key, IV, plainText);
    }


    public static string Decrypt(string Text)
    {
        return new EncryptDecrypt().Decrypt(Key, IV, Text);
    }




}

public static class EncryptionOTP
{
    private static byte[] Key = Encoding.UTF8.GetBytes(@"5PP3LIZ8CB210322114958LBV9QBGE1F");
    private static byte[] IV = Encoding.UTF8.GetBytes(@"1234567887654321");


    public static string Encrypt(string plainText)
    {
        return new EncryptDecrypt().Encrypt(Key, IV, plainText);
    }


    public static string Decrypt(string Text)
    {
        return new EncryptDecrypt().Decrypt(Key, IV, Text);
    }
}




public static class EncryptCSearch
{
    private static byte[] Key = Encoding.UTF8.GetBytes(@"1OY67PYHXN210322121936X6KCG559YT");
    private static byte[] IV = Encoding.UTF8.GetBytes(@"1234567887654321");

    public static string Encrypt(string plainText)
    {
        return new EncryptDecrypt().Encrypt(Key, IV, plainText);
    }


    public static string Decrypt(string Text)
    {
        return new EncryptDecrypt().Decrypt(Key, IV, Text);
    }
}



public static class EncryptOTP
{
    private static byte[] Key = Encoding.UTF8.GetBytes(@"5PP3LIZ8CB210322114958LBV9QBGE1F");
    private static byte[] IV = Encoding.UTF8.GetBytes(@"1234567887654321");

    public static string Encrypt(string plainText)
    {
        return new EncryptDecrypt().Encrypt(Key, IV, plainText);
    }


    public static string Decrypt(string Text)
    {
        return new EncryptDecrypt().Decrypt(Key, IV, Text);
    }
}


public static class EncryptAuth
{
    private static byte[] Key = Encoding.UTF8.GetBytes(@"5PP3LIZ8CB210322114958LBV9QBGE1F");
    private static byte[] IV = Encoding.UTF8.GetBytes(@"1234567887654321");

    public static string Encrypt(string plainText)
    {
        return new EncryptDecrypt().Encrypt(Key, IV, plainText);
    }


    public static string Decrypt(string Text)
    {
        return new EncryptDecrypt().Decrypt(Key, IV, Text);
    }
}