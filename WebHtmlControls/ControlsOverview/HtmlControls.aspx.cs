using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlsOverview
{
    public partial class HtmlControls : System.Web.UI.Page
    {
        private Random randomGenerator = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitBtn_ServerClick(object sender, EventArgs e)
        {
            var lowBound = string.IsNullOrEmpty(this.lowerBound.Value) ? 1 : int.Parse(this.lowerBound.Value);
            var upBound = string.IsNullOrEmpty(this.upperBound.Value) ? 10 : int.Parse(this.upperBound.Value);
            if (lowBound > upBound)
            {
                this.randomlyGeneratedNumber.InnerText = "The upper range bound cannot be less than the lower one.";
                return;
            }


            this.randomlyGeneratedNumber.InnerText = this.randomGenerator.Next(lowBound, upBound+1).ToString();
        }


    }
}