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
using Microsoft.VisualBasic;

public partial class CheckGame : System.Web.UI.Page
{
    string strNEWDate = "";
    string strTimeOLD = "";
    string strIDNo = "";
    string strPrizeNEW = "";
    string strOLDBall = "";
    string getTime = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            strNEWDate = Request.Form["NEWDate"];
            strTimeOLD = Request.Form["TimeOLD"];
            strPrizeNEW = Request.Form["PrizeNEW"];
            strOLDBall = Request.Form["OLDBall"];
            if (strNEWDate == null || strTimeOLD == null || strPrizeNEW == null || strOLDBall == null)
            {
                Message.Show(this.Page, "身分驗證錯誤,請確認操作!!", "Default.aspx");
                return;
            }
            else
            {
                if (CheckSourceWebsite())
                {
                    strIDNo = CheckIdNo(strNEWDate, strTimeOLD);
                    if (strIDNo != "")
                    {
                        getTime = CheckTimeNo(strPrizeNEW, strOLDBall);
                        if (getTime != "")
                        {
                           // Response.Write("getTime=" + getTime + "<BR>");
                            string CryptID = DataCrypt.Encrypt(strIDNo.ToUpper(), true);
                            if (CheckInsertGameLog(CryptID, getTime))
                            {
                                Session["Event_IDNo"] = CryptID;
                                Response.Redirect("Default.aspx");
                            }
                            else
                            {
                                Session["Event_IDNo"] = CryptID;
                                Response.Redirect("Default.aspx");
                                //Response.Write("資料傳輸失敗!!<br />");
                                //Message.Show(this.Page, "資料傳輸失敗!!", "Default.aspx");
                                //return;
                            }
                        }
                        else
                        {
                            //Response.Write("抽獎次數驗證錯誤,請確認操作!!<br />");
                            ErrorLog.Add(strIDNo, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "Date : " + strNEWDate + ", Time=" + strTimeOLD + ", Sport=" + strPrizeNEW + ", Ball=" + strOLDBall, "抽籤次數驗證錯誤");
                            Message.Show(this.Page, "抽籤次數驗證錯誤,請確認操作!!", "Default.aspx");
                            return;
                        }
                    }
                    else
                    {
                        //Response.Write("身分ID驗證錯誤,請確認操作!!<br />");
                        ErrorLog.Add(strIDNo, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "Date : " + strNEWDate + ", Time=" + strTimeOLD + ", Sport=" + strPrizeNEW + ", Ball=" + strOLDBall, "身分ID驗證錯誤");
                        Message.Show(this.Page, "身分ID驗證錯誤,請確認操作!!", "Default.aspx");
                        return;
                    }
                }
                else
                {
                    ErrorLog.Add("", HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "Date : " + strNEWDate + ", Time=" + strTimeOLD + ", Sport=" + strPrizeNEW + ", Ball=" + strOLDBall, "POST 入侵-非來自台灣銀行網站-" + Request.ServerVariables["HTTP_REFERER"].ToString());
                    Message.Show(this.Page, "您並非來自臺灣銀行網站,若有問題請與活動小組聯絡!!", "Default.aspx");
                    return;
                }
            }
        }
    }
    protected bool CheckSourceWebsite()
    {
        bool _CheckSourceWebsite = false;

        if (Request.ServerVariables["HTTP_REFERER"].StartsWith(ConfigurationManager.AppSettings["TrackSourceDNS"].ToString()))
            _CheckSourceWebsite = true;

        return _CheckSourceWebsite;
    }
    protected string CheckIdNo(string DateTemp, string TimeTemp)
    {
        string Decode1 = "";
        string Decode2 = "";

        try
        {
            Decode1 = GetDecode1(DateTemp);
            Decode1 = To10Code(Decode1);

            Decode2 = GetDecode2(TimeTemp);
            Decode2 = To9Code(Decode2);

            if (Decode1 == Decode2)
                return Decode1;
            else
                return "";
        }
        catch
        {
            return "";
        }
    }
    protected string CheckTimeNo(string DateTemp, string TimeTemp)
    {
        string Decode1 = "";
        string Decode2 = "";
        //DateTemp = DateTemp.PadLeft(10, '0');
        //TimeTemp = TimeTemp.PadLeft(10, '0');

        //Response.Write("DateTemp=" + DateTemp + "<BR>");
        //Response.Write("TimeTemp=" + TimeTemp + "<BR>");

        try
        {
            Decode1 = GetDecode1(DateTemp);
            Decode1 = To10Code(Decode1);

            Decode2 = GetDecode2(TimeTemp);
            Decode2 = To9CodeForTime(Decode2);

            //Response.Write("Decode1=" + Decode1 + "<BR>");
            //Response.Write("Decode2=" + Decode2 + "<BR>");

            if (Decode1 == Decode2)
                return Decode1;
            else
                return "";
        }
        catch (Exception ex)
        {
            Response.Write("ex=" + ex.ToString() + "<BR>");
            return "";
        }
    }
    protected string GetDecode1(string DateTemp)
    {
        string _GetDecode1 = DateTemp.Substring(5, 1) + DateTemp.Substring(9, 1) + DateTemp.Substring(4, 1) + DateTemp.Substring(2, 1) +
        DateTemp.Substring(8, 1) + DateTemp.Substring(0, 1) + DateTemp.Substring(3, 1) + DateTemp.Substring(6, 1) +
        DateTemp.Substring(1, 1) + DateTemp.Substring(7, 1);
        return _GetDecode1;
    }
    protected string GetDecode2(string TimeTemp)
    {
        string _GetDecode2 = TimeTemp.Substring(3, 1) + TimeTemp.Substring(6, 1) + TimeTemp.Substring(7, 1) + TimeTemp.Substring(9, 1) +
                TimeTemp.Substring(2, 1) + TimeTemp.Substring(4, 1) + TimeTemp.Substring(8, 1) + TimeTemp.Substring(1, 1) +
                TimeTemp.Substring(0, 1) + TimeTemp.Substring(5, 1);
        return _GetDecode2;
    }
    protected string To10Code(string strCode)
    {
        string getCode = strCode.Substring(0, 1);
        int getNumber = 0;
        int starNumber = 1;

        if (!Information.IsNumeric(strCode.Substring(1, 1)))
        {
            getCode += strCode.Substring(1, 1);
            starNumber++;
        }

        for (int i = starNumber; i <= 9; i++)
        {
            if (strCode.Substring(i, 1) == "0")
                getCode += strCode.Substring(i, 1);
            else
            {
                getNumber = 10 - int.Parse(strCode.Substring(i, 1));
                getCode += getNumber.ToString();
            }
        }
        return getCode;
    }
    protected string To9Code(string strCode)
    {
        string getCode = strCode.Substring(0, 1);
        int getNumber = 0;
        int starNumber = 1;

        if (!Information.IsNumeric(strCode.Substring(1, 1)))
        {
            getCode += strCode.Substring(1, 1);
            starNumber++;
        }

        for (int i = starNumber; i <= 9; i++)
        {
            getNumber = 9 - int.Parse(strCode.Substring(i, 1));
            getCode += getNumber.ToString();
        }
        return getCode;
    }
    protected string To9CodeForTime(string strCode)
    {
        string getCode = "";
        int getNumber = 0;
        int starNumber = 0;

        for (int i = starNumber; i <= 9; i++)
        {
            getNumber = 9 - int.Parse(strCode.Substring(i, 1));

            //Response.Write("getNumber=" + getNumber + "<BR>");
            getCode += getNumber.ToString();
        }
        return getCode;
    }
    protected bool CheckInsertGameLog(string IDNo, string Ball)
    {
        if (CheckTimeout.IsEbankEnd())
            return true;
        else
        {
            string IP;
            IP = "[" + Request.ServerVariables["REMOTE_ADDR"] + "]";
            if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != "")
                IP += "[" + Request.ServerVariables["HTTP_X_FORWARDED_FOR"] + "]";

            ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
            SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("usp_InsertMember", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter parm_IDNo = new SqlParameter("@ID", SqlDbType.VarChar, 50);
            SqlParameter parm_Times = new SqlParameter("@Times", SqlDbType.Int);
            SqlParameter parm_IP = new SqlParameter("@IP", SqlDbType.VarChar, 40);
            parm_IDNo.Value = IDNo;
            parm_Times.Value = Int16.Parse(Ball);
            parm_IP.Value = IP.Replace("[]", "");
            cmd.Parameters.Add(parm_IDNo);
            cmd.Parameters.Add(parm_Times);
            cmd.Parameters.Add(parm_IP);

            //Response.Write("ID=" + IDNo + "<BR>");
            //Response.Write("Ball=" + Int16.Parse(Ball).ToString() + "<BR>");
            //Response.Write("IP=" + IP + "<BR>");

            string ReturnValue = cmd.ExecuteScalar().ToString();
            //Response.Write("ReturnValue=" + ReturnValue + "<BR>");
            cmd.Dispose();
            conn.Close();
            conn.Dispose();

            if (ReturnValue == "y")
                return true;
            else
                return false;
        }
    }
}