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

public partial class GetBallot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    /*    Random rnd = new Random();
        int MinValue = 1;
        int MaxValue = 7;
        int PrizeItem = 0;
        for (int i=0; i<=100; i++ )
        {
            PrizeItem = rnd.Next(MinValue, MaxValue);
            //Response.Write(strID + "<BR>");
            //Response.Write(strGameLogId + "<BR>");
            Response.Write(PrizeItem.ToString() + "<BR>");
        }*/


     //   if (!IsPostBack)
    //    {
            CheckScore();
     //   }
    }
    protected void CheckScore()
    {
       // Response.Write("2<br />");
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
                XMLTag("false", "操作錯誤!!請以正常方式進行遊戲!!", 0, strID);
                ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "FromUrl : " + FromUrl + ", Domain=" + strDomain, "POST 入侵");
            }
            else
            {
                try
                {
                    //  ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "GameLogId=" + strGameLogId + ", PrizeItem=" + strPrizeItem, "CheckScore");

                    string strGameLogId = Request.Form["GLId"];
                    string IP;
                    int chk = 0;
                    IP = "[" + Request.ServerVariables["REMOTE_ADDR"] + "]";
                    if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != "")
                        IP += "[" + Request.ServerVariables["HTTP_X_FORWARDED_FOR"] + "]";

                    Random rnd = new Random();
                    int MinValue = 1;
                    int MaxValue = 7;
                    int PrizeItem = rnd.Next(MinValue, MaxValue);

                    //Response.Write(strID + "<BR>");
                    //Response.Write(strGameLogId + "<BR>");
                    //Response.Write(PrizeItem.ToString() + "<BR>");
                    //Response.Write(IP + "<BR>");

                    ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
                    SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
                    using (conn)
                    {
                        SqlCommand cmd = new SqlCommand("usp_UpdateGameLogId", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        conn.Open();
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

                        chk = int.Parse(cmd.ExecuteScalar().ToString());
                        cmd.Dispose();
                    }

                    //Response.Write("chk=" + chk.ToString() + "<BR>");

                    switch (chk)
                    {
                        case 0:
                            // Response.Write("資料比對錯誤<BR>");
                            ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), " 資料比對錯誤" + strGameLogId, "CheckScore");
                            XMLTag("false", "資料寫入錯誤!!請重新確認操作是否正確!!", 0, strID);
                            //  XMLTag("false", "資料寫入錯誤!!請重新確認操作是否正確!!\n Flash 提供GameLogId=" + strGameLogId, "0");
                            break;

                        case 1:
                            // Response.Write("獎項重複選取<BR>");
                            ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), " 抽籤重複選取 " + strGameLogId, "CheckScore");
                            XMLTag("false", "此筆抽籤機會已經選取過囉!!請勿重新選取!!", 0, strID);
                            break;

                        case 2:
                            //Response.Write("true<BR>");
                            //  ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), " OK " + strGameLogId + "," + strPrizeItem, "CheckScore");
                            XMLTag("true", "", PrizeItem, strID);
                            break;
                    }
                }
                catch (Exception ex)
                {
                    // Response.Write("系統錯誤" + ex.ToString() + "<BR>");
                    ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), ex.ToString(), "CheckScore");
                    XMLTag("false", "系統錯誤!!我們會盡快通知系統管理員處理!!", 0, strID);
                }
            }
        }
        else
        {
            ErrorLog.Add(HttpContext.Current.User.Identity.Name, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "Session 抓不到值!!", "CheckScore");
            XMLTag("false", "無法抓到您的登入資料!!請重新登入", 0, strID);
        }
    }
    protected void XMLTag(string chkResult, string strMessage, int PrizeItem, string strID)
    {
        string _AllTimes = "";
        string _UsedTimes = "";
        string _CanUsedTimes = "";

        ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
        SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
        using (conn)
        {
            SqlCommand cmd = new SqlCommand("usp_SelectCanUsedTimes", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter parm_ID = new SqlParameter("@ID", SqlDbType.VarChar, 50);
            parm_ID.Value = strID;
            cmd.Parameters.Add(parm_ID);
            conn.Open();

            SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (myReader.Read())
            {
                _AllTimes = myReader["AllTimes"].ToString();
                _UsedTimes = myReader["UsedTimes"].ToString();
                _CanUsedTimes = myReader["CanUsedTimes"].ToString();
            }
            myReader.Close();
            myReader.Dispose();
            cmd.Dispose();
        }

        //Buffer and output as XML.
        Response.ContentType = "text/xml";
        Response.Charset = "UTF8";

        string strXML = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
        strXML += "<output>\n";
        strXML += "  <result>" + chkResult + "</result>\n";
        strXML += "  <alert>" + strMessage + "</alert>\n";
        strXML += "  <Ballot>" + PrizeItem.ToString() + "</Ballot>\n";
        strXML += "  <AllTimes>" + _AllTimes + "</AllTimes>\n";
        strXML += "  <UsedTimes>" + _UsedTimes + "</UsedTimes>\n";
        strXML += "  <CanUsedTimes>" + _CanUsedTimes + "</CanUsedTimes>\n";
        strXML += "  <GameLogId>" + GetGameLogId(strID) + "</GameLogId>\n";
        strXML += "</output>";
        Response.Write(strXML);
    }
    protected string GetGameLogId(string strID)
    {
        string strGameLogId = "-1";

        try
        {
            ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
            SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
            using (conn)
            {
                SqlCommand cmd = new SqlCommand("usp_SelectGameLogId", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlParameter parm_ID = new SqlParameter("@ID", SqlDbType.VarChar, 50);
                parm_ID.Value = strID;
                cmd.Parameters.Add(parm_ID);
                strGameLogId = cmd.ExecuteScalar().ToString();
                cmd.Dispose();

                if (strGameLogId == "")
                    strGameLogId = "-1";
            }
        }
        catch (Exception ex)
        {
            ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), ex.ToString(), "GetGameLogId");
        }

        return strGameLogId;
    }
}