using App.Data;
using App.Data.Contracts;
using App.Models;
using Error_Handler_Control;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App.Web.Admin
{
    public partial class EditBooks : System.Web.UI.Page
    {
        private IAppData data;

        public EditBooks()
        {
            this.data = new AppData();
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<App.Models.Book> GridViewBooks_GetData()
        {
            return this.data.Books.All().OrderBy(b => b.Id);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewBooks_UpdateItem(int id)
        {
            App.Models.Book item = null;
            item = this.data.Books.All().FirstOrDefault(b => b.Id == id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                if (string.IsNullOrEmpty(item.Author))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Author name is mandatory");
                    return;
                }

                if (string.IsNullOrEmpty(item.Title))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Author name is mandatory");
                    return;
                }

                this.data.Books.Update(item);
                this.data.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewBooks_DeleteItem(int id)
        {
            var book = this.data.Books.All().FirstOrDefault(b => b.Id == id);
            if (book == null)
            {
                ErrorSuccessNotifier.AddErrorMessage("Book not matched");
                return;
            }

            this.data.Books.Delete(book);
            this.data.SaveChanges();
        }

        public void FormViewInsertBook_InsertItem()
        {
            var item = new App.Models.Book();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                if (string.IsNullOrEmpty(item.Title))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Book title cannot be null or empty");
                    return;
                }

                if (string.IsNullOrEmpty(item.Author))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Book author cannot be null or empty");
                    return;
                }

                this.data.Books.Add(item);
                this.data.SaveChanges();
            }
        }

        public IQueryable<Category> DropDownListCategoriesCreate_GetData()
        {
            return this.data.Categories.All().OrderBy(b => b.Name);
        }

        protected void LinkButtonCreate_Click(object sender, EventArgs e)
        {
            var book = new Book()
            {
                Title = this.TextBoxBookTitleCreate.Text.Trim(),
                Author = this.TextBoxBookAuthorCreate.Text.Trim(),
                ISBN = this.TextBoxBookAuthorCreate.Text.Trim(),
                WebSite = this.TextBoxBookWebSiteCreate.Text.Trim(),
                Description = this.TextBoxBookDescription.Text.Trim(),
                CategoryId = int.Parse(this.DropDownListCategoriesCreate.SelectedValue)
            };

            this.data.Books.Add(book);
            this.data.SaveChanges();
        }
    }
}