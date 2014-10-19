namespace SimpleWebFormsApp
{
    using System;
    using System.Reflection;
    using System.Web.UI;

    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.GreetAsp.Text = "Hello, ASP.NET! I greet you from the default.aspx.cs file.";
            this.Assembly_Location.Text = Assembly.GetExecutingAssembly().Location;
        }
    }
}