namespace SimpleDemo
{
    using System;

    public partial class GreetMe : System.Web.UI.Page
    {
        protected void OnGreetMe_Click(object sender, EventArgs e)
        {
            var name = this.TbName.Text;
            var greetingName = string.IsNullOrWhiteSpace(name) ? "anonymous" : name;

            this.Label_Greeting.Text = string.Format("Hello, {0}!", greetingName);
        }
    }
}