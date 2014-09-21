using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class PlayGame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
  //      Session["GameTimes"] = "5";
        Response.Expires = 0;
        Response.AddHeader("pragma", "no-cache");
        Response.AddHeader("Cache-Control", "no-cache, must-revalidate");

        if (CheckTimeout.IsEnd())
            Response.Redirect("Default.aspx");
        else
        {
            if (Session["Event_IDNo"] == null)
            {
                Message.Show(this.Page, "請先登入!!", "Default.aspx");
            }
            else
            {
           //     Response.Write("Event_IDNo=" + Session["Event_IDNo"]);
                if (!IsPostBack)
                    CheckGameLog();
            }
        }
    }
    protected void CheckGameLog()
    {
        ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
        SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
        conn.Open();

        SqlCommand cmd = new SqlCommand("usp_CheckGameLog", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter parm_ID = new SqlParameter("@ID", SqlDbType.VarChar, 50);
        parm_ID.Value = Session["Event_IDNo"].ToString();
        cmd.Parameters.Add(parm_ID);
        int ReturnValue = (int)cmd.ExecuteScalar();
        cmd.Dispose();
        conn.Close();
        conn.Dispose();
        //Response.Write(ReturnValue.ToString());

        if (ReturnValue == 0)
            Message.Show(this.Page, @"您的獎項已經都選擇過囉\n請先至網銀完成指定交易 !!", "Default.aspx");
    }
}