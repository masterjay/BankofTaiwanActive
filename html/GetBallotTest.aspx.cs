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

public partial class GetBallotTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["GameTimes"] == null)
                this.lbBallot.Text = "0";
            else
                this.lbBallot.Text = Session["GameTimes"].ToString();
        }
    }
    protected void XMLTag()
    {
        /*   try
           {
               string strCount = "";
               ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
               SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
               using (conn)
               {
                   SqlCommand cmd = new SqlCommand("sp_SelectBlessingCount", conn);
                   cmd.CommandType = CommandType.StoredProcedure;
                   conn.Open();
                   strCount = String.Format("{0:#,##0}", cmd.ExecuteScalar());
               }

               //Buffer and output as XML.
               Response.ContentType = "text/xml";
               Response.Charset = "UTF-8";
               string strXML = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
               strXML += "<output>\n";
               strXML += "  <Count>" + strCount + "</Count>\n";
               strXML += "</output>";
               Response.Write(strXML);
           }
           catch (Exception ex)
           {
               Response.Write(ex.ToString());

               //Buffer and output as XML.
               Response.ContentType = "text/xml";
               Response.Charset = "UTF-8";
               string strXML = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
               strXML += "<output>\n";
               strXML += "  <Count>0</Count>\n";
               strXML += "</output>";
               Response.Write(strXML);
           }*/
    }
    protected void btGetTime_Click(object sender, EventArgs e)
    {
        if (Session["GameTimes"].ToString() != "0")
        {
            int Times = int.Parse(Session["GameTimes"].ToString());
            Random rnd = new Random();
            int MinValue = 1;
            int MaxValue = 6;
            int Ballot = rnd.Next(MinValue, MaxValue);
            int CanUsedTimes = Times - 1;
            int UsedTimes = 5 - CanUsedTimes;
            int AllTimes = CanUsedTimes + UsedTimes;

            this.lbBallot.Text = Ballot.ToString();
            this.lbAllTimes.Text = AllTimes.ToString();
            this.lbUsedTimes.Text = UsedTimes.ToString();
            this.lbCanUsedTimes.Text = CanUsedTimes.ToString();
            Session["GameTimes"] = CanUsedTimes.ToString();
        }
        //XMLTag();
    }
}