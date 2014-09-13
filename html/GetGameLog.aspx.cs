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

public partial class GetGameLog : System.Web.UI.Page
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
        string strID = "";
        string strGameLogId = "";
        string strPrize1 = "";
        string strPrize2 = "";
        string strPrize3 = "";
        string strPrize4 = "";
        string strPrize5 = "";
        string strPrize6 = "";
        string strPrize7 = "";
        string strPrize8 = "";

        if (Session["Event_IDNo"] != null)
        {
            strID = Session["Event_IDNo"].ToString();
           // Response.Write(strID);
            try
            {
                ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
                SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("usp_SelectGameLogId", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parm_ID = new SqlParameter("@ID", SqlDbType.VarChar, 50);
                parm_ID.Value = strID;
                cmd.Parameters.Add(parm_ID);

                SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (myReader.Read())
                {
                    strPrize1 = myReader["Prize1"].ToString();
                    strPrize2 = myReader["Prize2"].ToString();
                    strPrize3 = myReader["Prize3"].ToString();
                    strPrize4 = myReader["Prize4"].ToString();
                    strPrize5 = myReader["Prize5"].ToString();
                    strPrize6 = myReader["Prize6"].ToString();
                    strPrize7 = myReader["Prize7"].ToString();
                    strPrize8 = myReader["Prize8"].ToString();

                    strGameLogId = myReader["GameLogId"].ToString();
                }

                myReader.Close();
                myReader.Dispose();

               // strGameLogId = cmd.ExecuteScalar().ToString();
                cmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
            catch (Exception ex)
            {
                ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), ex.ToString(), "XMLTag");
            }
        }
        else
        {
            ErrorLog.Add(HttpContext.Current.User.Identity.Name, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "Session 抓不到值!!", "XMLTag");
        }

       // ErrorLog.Add(strID, HttpContext.Current.Request.ServerVariables["PATH_INFO"].ToString(), "GetGameLog " + strGameLogId , "XMLTag");

        //Buffer and output as XML.
        Response.ContentType = "text/xml";
        Response.Charset = "UTF8";

        string strXML = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
        strXML += "<output>\n";
        strXML += "  <GameLogId>" + strGameLogId + "</GameLogId>\n";
        strXML += "  <prize1>" + strPrize1 + "</prize1>\n";
        strXML += "  <prize2>" + strPrize2 + "</prize2>\n";
        strXML += "  <prize3>" + strPrize3 + "</prize3>\n";
        strXML += "  <prize4>" + strPrize4 + "</prize4>\n";
        strXML += "  <prize5>" + strPrize5 + "</prize5>\n";
        strXML += "  <prize6>" + strPrize6 + "</prize6>\n";
        strXML += "  <prize7>" + strPrize7 + "</prize7>\n";
        strXML += "  <prize8>" + strPrize8 + "</prize8>\n";
        strXML += "</output>";
        Response.Write(strXML);
    }
}