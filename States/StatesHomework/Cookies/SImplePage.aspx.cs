using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatesHomework.Cookies
{
    public partial class SImplePage : System.Web.UI.Page
    {
        protected void GoToBtn_Click(object sender, EventArgs e)
        {
            var cookie = new HttpCookie("data", this.TextBoxInput.Text);

            cookie.Expires = DateTime.Now.AddMinutes(1);

            Response.Cookies.Add(cookie);
            Response.Redirect("CookieRestrictedPage.aspx");
        }
    }
}