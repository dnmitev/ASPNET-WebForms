using App.Data;
using App.Data.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace App.Web
{
    public abstract class BasePage : System.Web.UI.Page
    {
        public BasePage()
        {
            this.Data = new AppData();
        }

        public IAppData Data { get; set; }
    }
}