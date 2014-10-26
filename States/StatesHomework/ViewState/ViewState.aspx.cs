using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatesHomework.ViewState
{
    public partial class ViewState : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (ViewState["values"] == null)
            {
                ViewState.Add("values", new List<string>());
            }
        }

        protected void Print_Input(object sender, EventArgs e)
        {
            var list = (List<string>)ViewState["values"];
            list.Add(this.TextBox.Text);

            this.Label.Text = string.Empty;

            foreach (var item in list)
            {
                this.Label.Text += "<br/>" + item;
            }

            this.TextBox.Text = string.Empty;
        }
    }
}