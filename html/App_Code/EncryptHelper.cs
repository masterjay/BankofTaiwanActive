using System;
using System.Collections.Generic;
using System.Web;
using System.IO;
using System.Text;
using System.Security.Cryptography;

/// <summary>
/// EncryptHelper 的摘要描述
/// </summary>
public class EncryptHelper
{
	public EncryptHelper()
	{
		//
		// TODO: 在此加入建構函式的程式碼
		//
    }
    public static string Encrypt(string dataToEncrypt, string key)
    {
        AesManaged aes = null;
        MemoryStream memoryStream = null;
        CryptoStream cryptoStream = null;

        try
        {
            //Create AES algorithm
//            aes = new AesManaged();
            aes = new AesManaged();
            //Key derived from byte array with 32 pseudo-random key bytes
            aes.Key = Encoding.UTF8.GetBytes(key);
            //IV derived from byte array with 16 pseudo-random key bytes
            aes.IV = new byte[16];

            //Create Memory and Crypto Streams
            memoryStream = new MemoryStream();
            cryptoStream = new CryptoStream(memoryStream, aes.CreateEncryptor(), CryptoStreamMode.Write);

            //Encrypt Data
            byte[] data = Encoding.UTF8.GetBytes(dataToEncrypt);
            cryptoStream.Write(data, 0, data.Length);
            cryptoStream.FlushFinalBlock();

            //Return Base 64 String
            return Convert.ToBase64String(memoryStream.ToArray());
        }
        finally
        {
            if (cryptoStream != null)
                cryptoStream.Close();

            if (memoryStream != null)
                memoryStream.Close();

            if (aes != null)
                aes.Clear();
        }
    }

    public static string Decrypt(string dataToDecrypt, string key)
    {
        AesManaged aes = null;
        MemoryStream memoryStream = null;

        try
        {
            //Create AES algorithm
            aes = new AesManaged();
            //Key derived from byte array with 32 pseudo-random key bytes
            aes.Key = Encoding.UTF8.GetBytes(key);
            //IV derived from byte array with 16 pseudo-random key bytes
            aes.IV = new byte[16];

            //Create Memory and Crypto Streams
            memoryStream = new MemoryStream();
            CryptoStream cryptoStream = new CryptoStream(memoryStream, aes.CreateDecryptor(), CryptoStreamMode.Write);

            //Decrypt Data
            byte[] data = Convert.FromBase64String(dataToDecrypt);
            cryptoStream.Write(data, 0, data.Length);
            cryptoStream.FlushFinalBlock();

            //Return Decrypted String
            byte[] decryptBytes = memoryStream.ToArray();

            //Dispose
            if (cryptoStream != null)
                cryptoStream.Dispose();

            //Retval
            return Encoding.UTF8.GetString(decryptBytes, 0, decryptBytes.Length);
        }
        finally
        {
            if (memoryStream != null)
                memoryStream.Dispose();

            if (aes != null)
                aes.Clear();
        }
    }
}