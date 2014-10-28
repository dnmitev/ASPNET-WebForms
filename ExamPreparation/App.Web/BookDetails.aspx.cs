using App.Data;
using App.Data.Contracts;
using Error_Handler_Control;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App.Web
{
    public partial class BookDetails : System.Web.UI.Page
    {
        private IAppData data;

        public BookDetails()
        {
            this.data = new AppData();
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public App.Models.Book BookDetailsFormView_GetItem([QueryString("id")]int? bookId)
        {
            if (bookId ==null)
            {
                ErrorSuccessNotifier.AddWarningMessage("Book not found");
                Response.Redirect("~/");
            }

            return this.data.Books.All().FirstOrDefault(b => b.Id == bookId);
        }
    }
}