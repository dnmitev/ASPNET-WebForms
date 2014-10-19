using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlsOverview
{
    public partial class WebControls : System.Web.UI.Page
    {
        private Random randomGenerator = new Random();

        protected void OnGetRandom_Click(object sender, EventArgs e)
        {
            var low = string.IsNullOrEmpty(this.LowerRangeBound.Text) ? 1 : int.Parse(this.LowerRangeBound.Text);
            var up = string.IsNullOrEmpty(this.UpperRangeBound.Text) ? 10 : int.Parse(this.UpperRangeBound.Text);

            if (low > up)
            {
                this.RandomlyGeneratedNumber.Text = "Upper bound cannot be before the lower one.";
                return;
            }

            this.RandomlyGeneratedNumber.Text = this.randomGenerator.Next(low, up + 1).ToString();
        }
    }
}