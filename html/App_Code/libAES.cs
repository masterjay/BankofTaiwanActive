using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.IO;


/// <summary>
/// libAES 的摘要描述
/// </summary>
public class libAES
{
	public libAES()
	{
		//
		// TODO: 在這裡新增建構函式邏輯
		//
	}
    public static string Decrypt(string cipheredtext, string key)
    {
        byte[] keybytes = Encoding.UTF8.GetBytes(key);
        byte[] cipheredData = Convert.FromBase64String(cipheredtext);

        RijndaelManaged aes = new RijndaelManaged();
        aes.Mode = CipherMode.CBC;
        aes.Padding = PaddingMode.None;

        //16 ascii characters for IV
        byte[] IVbytes = Encoding.ASCII.GetBytes("myVerySecretIVKe");

        ICryptoTransform decryptor = aes.CreateDecryptor(keybytes, IVbytes);
        System.IO.MemoryStream ms = new System.IO.MemoryStream(cipheredData);
        CryptoStream cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read);
        StreamReader creader = new StreamReader(cs, Encoding.UTF8);

        String Base64 = creader.ReadToEnd();

        ms.Close();
        cs.Close();

        return Encoding.UTF8.GetString(Convert.FromBase64String(Base64));
    }

    /// <summary>
    /// Encrypt string using AES 128
    /// </summary>
    /// <param name="plaintext"></param>
    /// <param name="key"></param>
    /// <returns></returns>
    public static string Encrypt(string plaintext, string key)
    {
        byte[] keybytes = Encoding.UTF8.GetBytes(key);

        RijndaelManaged aes = new RijndaelManaged();
        aes.Mode = CipherMode.CBC;
        aes.Padding = PaddingMode.None;
        byte[] IVbytes = Encoding.ASCII.GetBytes("dongbinhuiasxiny");

        ICryptoTransform encryptor = aes.CreateEncryptor(keybytes, IVbytes);
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        CryptoStream cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write);

        byte[] plainBytes = Encoding.UTF8.GetBytes(Convert.ToBase64String(Encoding.UTF8.GetBytes(plaintext)));

        cs.Write(plainBytes, 0, plainBytes.Length);

        cs.FlushFinalBlock();

        byte[] cipherBytes = ms.ToArray();

        ms.Close();
        cs.Close();

        return Convert.ToBase64String(cipherBytes, 0, cipherBytes.Length);
    }

    public static string Encrypt(string toEncrypt) 
    { 
        byte[] keyArray = UTF8Encoding.UTF8.GetBytes("12345678901234567890123456789012"); 
        byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt); 
        RijndaelManaged rDel = new RijndaelManaged(); 
        rDel.Key = keyArray; 
        rDel.Mode = CipherMode.ECB; 
        rDel.Padding = PaddingMode.PKCS7; 
        ICryptoTransform cTransform = rDel.CreateEncryptor(); 
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length); 
        return Convert.ToBase64String(resultArray, 0, resultArray.Length); 
    }
}