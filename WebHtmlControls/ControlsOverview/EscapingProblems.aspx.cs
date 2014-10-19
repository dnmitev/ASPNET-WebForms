using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlsOverview
{
    public partial class EscapingProblems : System.Web.UI.Page
    {
        protected void GetTextBoxBtn_Click(object sender, EventArgs e)
        {
            this.TbOutput.Text = this.TbInput.Text;
            this.LabelOutput.Text = this.TbInput.Text;
        }
    }
}