using App.Data;
using App.Data.Contracts;
using App.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App.Web
{
    public partial class Home : System.Web.UI.Page
    {
        private IAppData data;

        public Home()
        {
            this.data = new AppData();
        }

        public IQueryable<Category> ListViewCategories_GetData()
        {
            return this.data.Categories.All();
        }

        protected void SearchLinkBtn_Click(object sender, EventArgs e)
        {
            var queryParam = string.Format("?q={0}", Server.HtmlEncode(this.TextBoxSearchParam.Text));
            Response.Redirect("~/Search.aspx" + queryParam);
        }
    }
}