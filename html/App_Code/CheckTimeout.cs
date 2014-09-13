using System;
using System.Collections.Generic;
using System.Web;
using System.Configuration;

/// <summary>
/// CheckTimeout 的摘要描述
/// </summary>
public class CheckTimeout
{
	public CheckTimeout()
	{
		//
		// TODO: 在此加入建構函式的程式碼
		//
	}
    public static bool IsEnd()
    {
        bool _IsEnd = false;

        if (Convert.ToDateTime(ConfigurationManager.AppSettings["EndTime"]).CompareTo(Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd HH:mm"))) < 0)
            _IsEnd = true;

        return _IsEnd;
    }
    public static bool IsEbankEnd()
    {
        bool _IsEnd = false;

        if (Convert.ToDateTime(ConfigurationManager.AppSettings["EbankEndTime"]).CompareTo(Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd HH:mm"))) < 0)
            _IsEnd = true;

        return _IsEnd;
    }
}