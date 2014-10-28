namespace SimpleChat
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;
    
    public partial class Default : System.Web.UI.Page
    {
        private DB.SimpleChatEntities db;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.db = new DB.SimpleChatEntities();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.ChatListView.DataSource = db.Messages.ToList();
            this.ChatListView.DataBind();

            if (ViewState["author"] != null)
            {
                this.TextBoxAuthor.Text = ViewState["author"].ToString();
            }

            this.TextBoxContent.Text = string.Empty;
        }

        protected void InsertBtn_Command(object sender, CommandEventArgs e)
        {
            var author = this.TextBoxAuthor.Text;
            if (string.IsNullOrEmpty(author))
            {
                return;
            }

            ViewState["author"] = author;

            var text = this.TextBoxContent.Text;
            db.Messages.Add(new DB.Message()
            {
                Author = author,
                Content = text
            });

            db.SaveChanges();
        }
    }
}