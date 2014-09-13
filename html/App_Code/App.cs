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
/// App 的摘要描述
/// </summary>
public class App
{
	public App()
	{
		//
		// TODO: 在這裡新增建構函式邏輯
		//
	}
    public static string GetPostValue(string strName)
    {
        string _Name = "";
        _Name = HttpContext.Current.Request.Form[strName];
        return _Name;
    }
    public static void Post(System.Web.UI.Page WebPage, string DeviceID, string MOBOS, string GoToURL)
    {
        //string jsString = "<script type='text/javascript'>" + Environment.NewLine;
        //jsString += "window.alert('" + Message + "');" + Environment.NewLine;
        //if (Redirect != "")
        //    jsString += "location.href='" + Redirect + "';";
        //jsString += "</script>";

        Literal txtMsg = new Literal();
        txtMsg.Text = "<form name='subfrm' id='subfrm' method='post' action='" + GoToURL + "'>";
        txtMsg.Text += "<input type='hidden' name='DeviceID' value='" + DeviceID + "'>";
        txtMsg.Text += "<input type='hidden' name='MOBOS' value='" + MOBOS + "'>";
        txtMsg.Text += "</form>";
        txtMsg.Text += "<script language=javascript>document.subfrm.submit();</script>";

        WebPage.Controls.Add(txtMsg);

      //  ScriptManager.RegisterClientScriptBlock(WebPage, typeof(string), "", txtMsg.Text, false);
    }
}