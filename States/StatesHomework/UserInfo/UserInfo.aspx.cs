using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatesHomework._01.UserInfo
{
    public partial class UserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CurrentUserInfo.Text += "Browser: " + Request.Browser.Type + "<hr />";
            this.CurrentUserInfo.Text += "Client IP: " + Request.UserHostAddress + "<hr />";
        }
    }
}