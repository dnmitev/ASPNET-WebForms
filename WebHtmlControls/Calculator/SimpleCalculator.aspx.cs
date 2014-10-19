namespace Calculator
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class SimpleCalculator : System.Web.UI.Page
    {
        private const string ErrorMessage = "Error!";

        protected void NumberBtn_Click(object sender, EventArgs e)
        {
            if (this.CheckBoxIsOperatorPressed.Checked)
            {
                this.CheckBoxIsOperatorPressed.Checked = false;
                this.TextBoxDisplay.Text = string.Empty;
            }

            var btn = sender as Button;
            if (btn == null)
            {
                throw new ArgumentNullException("Error in pressing number key");
            }

            this.TextBoxDisplay.Text += btn.Text;
        }

        protected void ButtonPlus_Click(object sender, EventArgs e)
        {
            this.PerformOperation();
            this.Operator.Value = "+";
        }

        protected void ButtonMinus_Click(object sender, EventArgs e)
        {
            this.PerformOperation();
            this.Operator.Value = "-";
        }

        protected void ButtonMultiply_Click(object sender, EventArgs e)
        {
            this.PerformOperation();
            this.Operator.Value = "*";
        }

        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            this.TextBoxDisplay.Text = string.Empty;
            this.FieldStorage.Value = string.Empty;
        }

        protected void ButtonSqrt_Click(object sender, EventArgs e)
        {
            this.PerformOperation();
            this.Operator.Value = "sqrt";
        }

        protected void ButtonDivide_Click(object sender, EventArgs e)
        {
            this.PerformOperation();
            this.Operator.Value = "/";
        }

        protected void ButtonEquals_Click(object sender, EventArgs e)
        {
            this.PerformOperation();
            this.Operator.Value = "=";
        }

        private void PerformOperation()
        {
            double display = 0.0;
            double storage = 0.0;

            if (this.TextBoxDisplay.Text != string.Empty && this.TextBoxDisplay.Text != ErrorMessage)
            {
                display = double.Parse(this.TextBoxDisplay.Text);
            }

            if (this.FieldStorage.Value != string.Empty)
            {
                storage = double.Parse(this.FieldStorage.Value);
            }

            try
            {
                double result = this.GetResult(display, storage);
                this.FieldStorage.Value = result.ToString();
                this.TextBoxDisplay.Text = result.ToString();
            }
            catch (Exception)
            {
                this.TextBoxDisplay.Text = ErrorMessage;
                this.FieldStorage.Value = string.Empty;
            }

            this.CheckBoxIsOperatorPressed.Checked = true;
        }

        private double GetResult(double display, double storage)
        {
            double result = 0.0;

            switch (this.Operator.Value)
            {
                case "=":
                    result = display;
                    break;
                case "+":
                    result = storage + display;
                    break;
                case "-":
                    result = storage - display;
                    break;
                case "*":
                    result = storage * display;
                    break;
                case "/":
                    result = storage / display;
                    break;
                case "sqrt":
                    result = Math.Sqrt(display);
                    break;
                default:
                    throw new InvalidOperationException("The operation is not defined.");
            }

            return result;
        }
    }
}