using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.SessionState;

namespace com.think4u.SqlInjection
{
    public class SqlInjection : IHttpModule
    {        //Defines the set of characters that will be checked.
        //You can add to this list, or remove items from this list, as appropriate for your site
        public static string[] blackList = {"--",";--",";","/*","*/","@@","@",
                                           "char","nchar","varchar","nvarchar",
                                           "alter","begin","cast","create","cursor","declare","delete","drop","end","exec","execute",
                                           "fetch","insert","kill","open","script",
                                           "select", "sys","sysobjects","syscolumns",
                                           "table","update"};

        public void Dispose()
        {
            //no-op 
        }

        //Tells ASP.NET that there is code to run during BeginRequest
        public void Init(HttpApplication app)
        {
            app.BeginRequest += new EventHandler(app_BeginRequest);
        }

        //For each incoming request, check the query-string, form and cookie values for suspicious values.
        void app_BeginRequest(object sender, EventArgs e)
        {
            HttpRequest Request = (sender as HttpApplication).Context.Request;

            foreach (string key in Request.QueryString)
                CheckInput(Request.QueryString[key], key);
            foreach (string key in Request.Form)
                CheckInput(Request.Form[key], key);
            foreach (string key in Request.Cookies)
                CheckInput(Request.Cookies[key].Value, key);
        }

        //The utility method that performs the blacklist comparisons
        //You can change the error handling, and error redirect location to whatever makes sense for your site.
        private void CheckInput(string parameter, string strKey)
        {
            //HttpContext.Current.Response.Write("1234");
            for (int i = 0; i < blackList.Length; i++)
            {
                if ((parameter.IndexOf(blackList[i], StringComparison.OrdinalIgnoreCase) >= 0))
                {
                    if (parameter.Contains("UpdatePanel"))
                    {
                        continue;
                    }
                    else if (strKey.Contains("txtEmail") && blackList[i] == "@")
                    {
                        continue;
                    }
                    else if (strKey.Contains("txtPassword") && blackList[i] == "@")
                    {
                        continue;
                    }
                    else if (strKey.Contains("Password") && blackList[i] == "@")
                    {
                        continue;
                    }
                    else if (strKey == "__VIEWSTATE")
                    {
                        continue;
                    }
                    else if (strKey.Contains("hidEmail"))
                    {
                        continue;
                    }
                    //
                    //Handle the discovery of suspicious Sql characters here
                    //
                    try
                    {
                        HttpContext.Current.Session.Add("Error",strKey);
                        HttpContext.Current.Session.Add("Input",parameter);
                        HttpContext.Current.Response.Redirect("../Error.aspx");  //generic error page on your site
                    }
                    catch
                    {
                    }
                }
            }
        }

    }
}