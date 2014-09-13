using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public partial class SetGameLog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CheckScore();
        }
    }
    protected void CheckScore()
    {
        string strID = "";

        Uri MyUrl = Request.UrlReferrer;
        string FromUrl = (MyUrl == null) ? string.Empty : MyUrl.ToString();
        string strDomain = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_HOST"];
        //Response.Write("FromUrl : " + FromUrl + "<br>");
        //Response.Write("strDomain : " + strDomain + "<br>");

        if (Session["Event_IDNo"] != null)
        {
            strID = Session["Event_IDNo"].ToString();
            if (FromUrl.IndexOf(strDomain) == -1)
            {
                XMLTag("false", "操作錯誤!!請以正常方式進行遊戲!!", "0");
                ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "FromUrl : " + FromUrl + ", Domain=" + strDomain, "POST 入侵");
            }
            else
            {
                try
                {
                    string strGameLogId = Request.Form["GLId"];
                    string strPrizeItem = Request.Form["PrizeItem"];

                  //  ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "GameLogId=" + strGameLogId + ", PrizeItem=" + strPrizeItem, "XMLTag");

                    string IP;
                    IP = "[" + Request.ServerVariables["REMOTE_ADDR"] + "]";
                    if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != "")
                        IP += "[" + Request.ServerVariables["HTTP_X_FORWARDED_FOR"] + "]";

                    int PrizeItem = 0;
                    if (int.TryParse(strPrizeItem, out PrizeItem))
                    {
                        ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
                        SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
                        conn.Open();

                        SqlCommand cmd = new SqlCommand("usp_UpdateGameLogId", conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        SqlParameter parm_ID = new SqlParameter("@ID", SqlDbType.VarChar, 50);
                        SqlParameter parm_GameLogId = new SqlParameter("@GameLogId", SqlDbType.VarChar, 36);
                        SqlParameter parm_PrizeItem = new SqlParameter("@PrizeItem", SqlDbType.SmallInt);
                        SqlParameter parm_IP = new SqlParameter("@IP", SqlDbType.VarChar, 40);

                        parm_ID.Value = strID;
                        parm_GameLogId.Value = strGameLogId;
                        parm_PrizeItem.Value = PrizeItem;
                        parm_IP.Value = IP.Replace("[]", "");

                        cmd.Parameters.Add(parm_ID);
                        cmd.Parameters.Add(parm_GameLogId);
                        cmd.Parameters.Add(parm_PrizeItem);
                        cmd.Parameters.Add(parm_IP);

                        int chk = int.Parse(cmd.ExecuteScalar().ToString());
                        cmd.Dispose();
                        conn.Close();
                        conn.Dispose();

                        //Response.Write("chk=" + chk.ToString() + "<BR>");

                        switch (chk)
                        {
                            case 0:
                               // Response.Write("資料比對錯誤<BR>");
                                ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), " 資料比對錯誤" + strGameLogId + "," + strPrizeItem, "XMLTag");
                                XMLTag("false", "資料寫入錯誤!!請重新確認操作是否正確!!", "0");
                              //  XMLTag("false", "資料寫入錯誤!!請重新確認操作是否正確!!\n Flash 提供GameLogId=" + strGameLogId, "0");
                                break;

                            case 1:
                               // Response.Write("獎項重複選取<BR>");
                                ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), " 獎項重複選取 " + strGameLogId + "," + strPrizeItem, "XMLTag");
                                XMLTag("false", "此筆獎項已經選取過囉!!請勿重新選取!!", "0");
                                break;

                            case 2:
                                //Response.Write("true<BR>");
                              //  ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), " OK " + strGameLogId + "," + strPrizeItem, "XMLTag");
                                XMLTag("true", "", GetCanUsedTimes(strID));
                                break;
                        }
                    }
                    else
                    {
                        //Response.Write("選擇獎項異常<BR>");
                        ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), " 選擇獎項異常 " + strGameLogId + "," + strPrizeItem, "XMLTag");
                        XMLTag("false", "選擇獎項異常!!請以正常方式進行遊戲!!", "0");
                    }
                }
                catch (Exception ex)
                {
                   // Response.Write("系統錯誤" + ex.ToString() + "<BR>");
                    ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), ex.ToString(), "XMLTag");
                    XMLTag("false", "系統錯誤!!我們會盡快通知系統管理員處理!!", "0");
                }
            }
        }
        else
        {
            ErrorLog.Add(HttpContext.Current.User.Identity.Name, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "Session 抓不到值!!", "XMLTag");
            XMLTag("false", "無法抓到您的登入資料!!請重新登入", "0");
        }
    }
    protected string GetCanUsedTimes(string strID)
    { 
        string _CanUsed = "";

        ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
        SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
        conn.Open();

        SqlCommand cmd = new SqlCommand("usp_SelectCanUsedTimes", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parm_ID = new SqlParameter("@ID", SqlDbType.VarChar, 50);
        parm_ID.Value = strID;
        cmd.Parameters.Add(parm_ID);

        _CanUsed = cmd.ExecuteScalar().ToString();
        cmd.Dispose();
        conn.Close();
        conn.Dispose();

        return _CanUsed;
    }
    protected void XMLTag(string chkResult, string strMessage, string strCanUsedTimes)
    {
        //Buffer and output as XML.
        Response.ContentType = "text/xml";
        Response.Charset = "UTF8";

        string strXML = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
        strXML += "<output>\n";
        strXML += "  <result>" + chkResult + "</result>\n";
        strXML += "  <alert>" + strMessage + "</alert>\n";
        strXML += "  <canusedtimes>" + strCanUsedTimes + "</canusedtimes>\n";
        strXML += "</output>";
        Response.Write(strXML);
    }
}