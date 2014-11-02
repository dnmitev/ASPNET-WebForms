using App.Data;
using App.Data.Contracts;
using App.Models;
using Error_Handler_Control;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            var user = this.data.Users.All().FirstOrDefault(u => u.UserName == this.User.Identity.Name);
            if (user == null)
            {
                return;
            }
            else
            {
                if (!string.IsNullOrEmpty(user.FirstName))
                {
                    this.LabelFirstName.Visible = false;
                    this.TextBoxFirstName.Visible = false;
                }

                if (!string.IsNullOrEmpty(user.LastName))
                {
                    this.LabelLastName.Visible = false;
                    this.TextBoxLastName.Visible = false;
                }
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<App.Models.ChatMessage> ListViewMessages_GetData()
        {
            return this.data.ChatMessages.All().OrderBy(cm => cm.Id);
        }

        protected void SendBtn_Click(object sender, EventArgs e)
        {
            var content = this.TextBoxNewMessage.Text.Trim();
            var user = this.data.Users.All().FirstOrDefault(u => u.UserName == this.User.Identity.Name);

            var message = new ChatMessage()
            {
                AuthorId = user.Id,
                Content = Server.HtmlEncode(content)
            };

            this.data.ChatMessages.Add(message);
            this.data.SaveChanges();

            user.FirstName = Server.HtmlEncode(this.TextBoxFirstName.Text.Trim());
            user.LastName = Server.HtmlEncode(this.TextBoxLastName.Text.Trim());

            this.data.Users.Update(user);
            this.data.SaveChanges();

            ErrorSuccessNotifier.AddSuccessMessage("Your message has been send!");
            Response.Redirect("~/");
        }
    }
}