using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatesHomework.Session
{
    public partial class SessionState : System.Web.UI.Page
    {
        private IList<string> inputData;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["Text"]!=null)
            {
                var sessionData = Session["Text"].ToString();
                inputData = sessionData.Split(';').ToList();
            }
            else
            {
                inputData = new List<string>();
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.SessionLabel.Text = string.Join(", ", inputData);
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            inputData.Add(this.TextBoxInput.Text);
            Session["Text"] = string.Join(";", inputData);
            this.TextBoxInput.Text = string.Empty;


        }
    }
}