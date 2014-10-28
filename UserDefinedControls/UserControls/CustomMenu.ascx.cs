using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControls
{
    [System.ComponentModel.DefaultBindingProperty("DataSource")]
    public partial class CustomMenu : System.Web.UI.UserControl
    {
        public string FontFamily { get; set; }

        public string FontColor { get; set; }

        public CustomMenu()
        {
            this.FontFamily = "Tahoma";
            this.FontColor = "yellowgreen";
        }

        public IEnumerable<MenuItem> DataSource
        {
            get
            {
                return this.MenuDataList.DataSource as IEnumerable<MenuItem>;
            }

            set
            {
                foreach (var item in value)
                {
                    if (string.IsNullOrEmpty(item.FontColor))
                    {
                        item.FontColor = this.FontColor;
                    }
                }

                this.MenuDataList.DataSource = value;
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            MenuDataList.Style.Add("font-familly", this.FontFamily);
        }

        public override void DataBind()
        {
            MenuDataList.DataBind();
            base.DataBind();
        }
    }
}