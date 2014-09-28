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

public partial class GetBallot2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["GameTimes"] == null)
                NullTimes();
            else
                XMLTag();
              //  this.lbBallot.Text = "0";
            //else
            //    this.lbBallot.Text = Session["GameTimes"].ToString();
        }
    }
    protected void XMLTag()
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

            //this.lbBallot.Text = Ballot.ToString();
            //this.lbAllTimes.Text = AllTimes.ToString();
            //this.lbUsedTimes.Text = UsedTimes.ToString();
            //this.lbCanUsedTimes.Text = CanUsedTimes.ToString();
            Session["GameTimes"] = CanUsedTimes.ToString();

            //Buffer and output as XML.
            Response.ContentType = "text/xml";
            Response.Charset = "UTF-8";
            string strXML = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
            strXML += "<output>\n";
            strXML += "  <Ballot>" + Ballot.ToString() + "</Ballot>\n";
            strXML += "  <AllTimes>" + AllTimes.ToString() + "</AllTimes>\n";
            strXML += "  <UsedTimes>" + UsedTimes.ToString() + "</UsedTimes>\n";
            strXML += "  <CanUsedTimes>" + CanUsedTimes.ToString() + "</CanUsedTimes>\n";
            strXML += "</output>";
            Response.Write(strXML);
        }
        else
        {
            NullTimes();
        }
    }
    protected void NullTimes()
    {

        //Buffer and output as XML.
        Response.ContentType = "text/xml";
        Response.Charset = "UTF-8";
        string strXML = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
        strXML += "<output>\n";
        strXML += "  <Ballot>0</Ballot>\n";
        strXML += "  <AllTimes>0</AllTimes>\n";
        strXML += "  <UsedTimes>0</UsedTimes>\n";
        strXML += "  <CanUsedTimes>0</CanUsedTimes>\n";
        strXML += "</output>";
        Response.Write(strXML);
    }
}