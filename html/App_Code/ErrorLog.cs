using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// ErrorLog 的摘要描述
/// </summary>
public class ErrorLog
{
	public ErrorLog()
	{
		//
		// TODO: 在此加入建構函式的程式碼
		//
    }
    public static void Add(string strMemberId, string strUrlPath, string strErrMessage, string strFunctionName)
    {
        string IP;
        IP = "[" + HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] + "]";
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != "")
            IP += "[" + HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] + "]";

        ConnectionStringSettings connSettings = ConfigurationManager.ConnectionStrings["ConnString"];
        SqlConnection conn = new SqlConnection(connSettings.ConnectionString);
        conn.Open();

        SqlCommand cmd = new SqlCommand("usp_InsertErrorLog", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parm_MemberId = new SqlParameter("@MemberId", SqlDbType.VarChar, 36);
        SqlParameter parm_UrlPath = new SqlParameter("@UrlPath", SqlDbType.NVarChar, 500);
        SqlParameter parm_ErrMessage = new SqlParameter("@ErrMessage", SqlDbType.NVarChar, 4000);
        SqlParameter parm_FunctionName = new SqlParameter("@FunctionName", SqlDbType.NVarChar, 100);
        parm_MemberId.Value = strMemberId;
        parm_UrlPath.Value = strUrlPath;
        parm_ErrMessage.Value = IP.Replace("[]", "") + strErrMessage;
        parm_FunctionName.Value = strFunctionName;
        cmd.Parameters.Add(parm_MemberId);
        cmd.Parameters.Add(parm_UrlPath);
        cmd.Parameters.Add(parm_ErrMessage);
        cmd.Parameters.Add(parm_FunctionName);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        conn.Close();
        conn.Dispose();
    }
}
