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
/// Message 的摘要描述
/// </summary>
public class Message
{
    public Message()
    {
        //
        // TODO: 在此加入建構函式的程式碼
        //
    }
    public static void Show(Page FilePage, string AlertMessage, string Redirect)
    {
        Literal txtMsg = new Literal();
        txtMsg.Text = "<script>alert('" + AlertMessage + "');";
        if (Redirect != "")
            txtMsg.Text += "location.href='" + Redirect + "';";
        txtMsg.Text += "</script>";

        FilePage.Controls.Add(txtMsg);
    }
    public static void AjaxShow(System.Web.UI.Page WebPage, string Message, string Redirect)
    {
        string jsString = "<script language='javascript' type='text/javascript'>" + Environment.NewLine;
        jsString += "window.alert('" + Message + "');" + Environment.NewLine;
        if (Redirect != "")
            jsString += "location.href='" + Redirect + "';";
        jsString += "</script>";
        ScriptManager.RegisterClientScriptBlock(WebPage, typeof(string), "", jsString, false);
    }
}
