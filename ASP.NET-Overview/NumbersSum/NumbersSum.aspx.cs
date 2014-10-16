using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NumbersSum
{
    public partial class NumbersSum : System.Web.UI.Page
    {
        protected void ButtonGetSumOnClick(object sender, EventArgs e)
        {
            decimal firstNumber = decimal.Parse(this.TextBoxFirstNumber.Text);
            decimal secondNumber = decimal.Parse(this.TextBoxSecondNumber.Text);
            decimal sum = firstNumber + secondNumber;

            this.TextBoxSum.Text = sum.ToString();
        }
    }
}