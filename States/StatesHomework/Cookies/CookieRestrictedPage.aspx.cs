using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatesHomework.Cookies
{
    public partial class CookieRestrictedPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var cookie = Request.Cookies["data"];
            if (cookie != null)
            {
                this.CookieLabel.Text = cookie.Value;
            }
            else
            {
                Response.Redirect("SimplePage.aspx");
            }
        }
    }
}