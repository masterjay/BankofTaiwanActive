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

public partial class GetGameLogPlay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            XMLTag();
        }
    }
    protected void XMLTag()
    {
        string strMessage = "";
        string strID = "";
        string strGameLogId = "-1";
        if (Session["Event_IDNo"] != null)
        {
            strID = Session["Event_IDNo"].ToString();
            // Response.Write(strID);
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
                    this.GLId.Text = cmd.ExecuteScalar().ToString();
                    cmd.Dispose();
                }
            }
            catch (Exception ex)
            {
                ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), ex.ToString(), "XMLTag");
            }
        }
        else
        {
            strMessage = "請至網銀登入後才可以進行遊戲喔!";
            ErrorLog.Add(HttpContext.Current.User.Identity.Name, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "Session 抓不到值!!", "XMLTag");
        }

        if (strGameLogId == "")
            strMessage = "您目前已選完抽籤機會!再去交易吧!";


    }
}