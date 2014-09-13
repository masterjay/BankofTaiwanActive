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

public partial class conn_GetBallot : System.Web.UI.Page
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
        try
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
        }
    }
}