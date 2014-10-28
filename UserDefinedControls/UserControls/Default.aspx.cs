using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControls
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MenuItem[] options =
            {
                new MenuItem("Plovdiv", "plovdiv.aspx"),
                new MenuItem("Sofia", "sofiaaspx"),
                new MenuItem("Varna", "varna.aspx"),
                new MenuItem("Burgas", "burgas.aspx")
            };

            this.CustomDataMenu.FontFamily = "Consolas";
            this.CustomDataMenu.FontColor = "#FAG655";
            this.CustomDataMenu.DataSource = options;
            this.CustomDataMenu.DataBind();
        }
    }
}