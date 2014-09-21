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
using Orpius.Web.Controls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CheckTimeout.IsEnd())
            Response.Redirect("Default.aspx");
        else
        {
            if (!IsPostBack)
            {
                this.ibtSearch.Attributes.Add("onmouseover", "ChangeImg( this, 'image/03buttonb01.png');");
                this.ibtSearch.Attributes.Add("onmouseout", "ChangeImg( this, 'image/03buttonb.png');");

                this.ibtPrize.Attributes.Add("onmouseover", "ChangeImg( this, 'image/web03button03a.png');");
                this.ibtPrize.Attributes.Add("onmouseout", "ChangeImg( this, 'image/web03button03.png');");
            }
        }
    }
    protected void CheckCount()
    {
        try
        {
            int usedcnt = int.Parse(this.lbPrize1.Text) + int.Parse(this.lbPrize2.Text) + int.Parse(this.lbPrize3.Text) + int.Parse(this.lbPrize4.Text) + int.Parse(this.lbPrize5.Text) + int.Parse(this.lbPrize6.Text);
            this.lbUsedCount.Text = usedcnt.ToString();

            int cnt =  usedcnt + int.Parse(this.lbNotUsed.Text);
            this.lbTotal.Text = cnt.ToString();
        }
        catch { }
    }
    protected void ibtSearch_Click(object sender, ImageClickEventArgs e)
    {
        if (this.txtID.Text.Length == 10)
        {
            ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
            SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("usp_SelectIDGameLog", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.VarChar, 50).Value = DataCrypt.Encrypt(this.txtID.Text.ToUpper(), true);

            SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            //    Response.Write(myReader.HasRows);

            if (myReader.HasRows)
            {
                this.lbId.Text = this.txtID.Text.Substring(0, 7);
                this.plSearch.Visible = false;
                this.plResult.Visible = true;
            }
            else
            {
                this.plSearch.Visible = true;
                this.plResult.Visible = false;
                Message.Show(this.Page, "沒有此筆身分證統一編號!!", "");
            }

            while (myReader.Read())
            {
                this.lbPrize1.Text = myReader["Prize1"].ToString();
                this.lbPrize2.Text = myReader["Prize2"].ToString();
                this.lbPrize3.Text = myReader["Prize3"].ToString();
                this.lbPrize4.Text = myReader["Prize4"].ToString();
                this.lbPrize5.Text = myReader["Prize5"].ToString();
                this.lbPrize6.Text = myReader["Prize6"].ToString();
                this.lbNotUsed.Text = myReader["NotUsed"].ToString();

                   if (int.Parse(this.lbNotUsed.Text) == 0)
                   {
                       this.ibtPrize.Visible = false;
                       this.hlDefault.Visible = true;
                       this.lbDefault.Visible = true;
                   }
                   else
                   {
                       this.ibtPrize.Visible = true;
                       this.hlDefault.Visible = false;
                       this.lbDefault.Visible = false;
                   }
            }

            myReader.Close();
            myReader.Dispose();

            cmd.Dispose();
            conn.Close();
            conn.Dispose();

            CheckCount();
        }
        else
            Message.Show(this.Page, "請輸入正確的身分證統一編號!", "");
    }
}