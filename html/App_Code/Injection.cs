using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Injection 的摘要描述
/// </summary>
public class Injection
{
	public Injection()
	{
		//
		// TODO: 在此加入建構函式的程式碼
		//
    }
    public static string ReplaceWord(string strWord, int intWord)
    {
        strWord = strWord.Replace("'", "");
        strWord = strWord.Replace("script", "");
        strWord = strWord.Replace("-", "");

        int lenWord = strWord.Length;
        if (lenWord > intWord)
            return strWord.Substring(0, intWord);
        else
            return strWord.Substring(0, lenWord);
    }
    public static int ReplaceWord(int strWord, int intWord)
    {
        string strTemp = strWord.ToString();
        strTemp = strTemp.Replace("'", "");
        strTemp = strTemp.Replace("script", "");
        strTemp = strTemp.Replace("-", "");

        int lenWord = strTemp.Length;
        if (lenWord > intWord)
            return int.Parse( strTemp.Substring(0, intWord));
        else
            return int.Parse( strTemp.Substring(0, lenWord));
    }
}
