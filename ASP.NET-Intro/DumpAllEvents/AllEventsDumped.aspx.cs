namespace DumpAllEvents
{
    using System;

    public partial class AllEventsDumped : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Response.Write("Page_PreInit invoked" + "<br/>");
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Write("Page_Init invoked" + "<br/>");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("Page_Load invoked" + "<br/>");
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            Response.Write("Page_PreRender invoked" + "<br/>");
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            // Response is not available in this context
            // Response.Write("Page_Unload invoked" + "<br/>");
        }

        protected void DumpBtn_Click(object sender, EventArgs e)
        {
            Response.Write("DumpBtn_Click invoked" + "<br/>");
        }

        protected void DumpBtn_Init(object sender, EventArgs e)
        {
            Response.Write("DumpBtn_Init invoked" + "<br/>");
        }

        protected void DumpBtn_Load(object sender, EventArgs e)
        {
            Response.Write("DumpBtn_Load invoked" + "<br/>");
        }

        protected void DumpBtn_PreRender(object sender, EventArgs e)
        {
            Response.Write("DumpBtn_PreRender invoked" + "<br/>");
        }

        protected void DumpBtn_Unload(object sender, EventArgs e)
        {
            // Response is not available in this context
            // Response.Write("DumpBtn_Unload invoked" + "<br/>");
        }
    }
}