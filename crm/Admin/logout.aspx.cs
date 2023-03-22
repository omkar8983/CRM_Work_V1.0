using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM.Admin
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["SALESCRM"] != null)
            {
                HttpCookie myCookie = new HttpCookie("SALESCRM");
                DateTime now = DateTime.Now;

                // Set the cookie value.
                myCookie.Value = now.ToString();
                // Set the cookie expiration date.
                myCookie.Expires = now.AddSeconds(1);

                // Add the cookie.
                Response.Cookies.Add(myCookie);

                Response.Redirect("~/login.aspx");
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }
}