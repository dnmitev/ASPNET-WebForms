using Error_Handler_Control;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App.Web.Admin
{
    public partial class EditCategories : BasePage
    {
        private const int DefaultMinCategoryNameLength = 2;

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<App.Models.Category> CategoriesEditor_GetData()
        {
            return this.Data.Categories.All().OrderBy(c => c.Id);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CategoriesEditor_DeleteItem(int id)
        {
            var category = this.Data.Categories.All().FirstOrDefault(c => c.Id == id);
            if (category == null)
            {
                ErrorSuccessNotifier.AddErrorMessage("Category not matched");
                return;
            }

            this.Data.Categories.Delete(category);
            this.Data.SaveChanges();

            ErrorSuccessNotifier.AddSuccessMessage(string.Format("{0} successfully deleted.", category.Name));
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CategoriesEditor_UpdateItem(int id)
        {
            App.Models.Category item = null;
            item = this.Data.Categories.All().FirstOrDefault(c => c.Id == id);
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
                if (this.Data.Categories.All().Any(c => c.Name == item.Name))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Category name cannot be duplicated");
                    return;
                }

                if (string.IsNullOrEmpty(item.Name))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Category name be null or empty");
                    return;
                }

                if (item.Name.Trim().Length < DefaultMinCategoryNameLength)
                {
                    ErrorSuccessNotifier.AddErrorMessage("Category name cannot consist only spaces");
                    return;
                }

                item.Name = Server.HtmlEncode(item.Name);

                this.Data.Categories.Update(item);
                this.Data.SaveChanges();

                ErrorSuccessNotifier.AddSuccessMessage("Category successfully updated.");
            }
            else
            {
                ErrorSuccessNotifier.AddWarningMessage("Please enter a valid category name - not an empty and more than 3 symbols long");
            }
        }

        public void CategoriesEditor_InsertItem()
        {
            var item = new App.Models.Category();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                if (this.Data.Categories.All().Any(c => c.Name == item.Name))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Category name cannot be duplicated");
                    return;
                }

                if (string.IsNullOrEmpty(item.Name))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Category name be null or empty");
                    return;
                }

                if (item.Name.Trim().Length < DefaultMinCategoryNameLength)
                {
                    ErrorSuccessNotifier.AddErrorMessage("Category name cannot consist only spaces");
                    return;
                }

                item.Name = Server.HtmlEncode(item.Name);

                this.Data.Categories.Add(item);
                this.Data.SaveChanges();

                ErrorSuccessNotifier.AddSuccessMessage("Category successfully added.");
            }
            else
            {
                ErrorSuccessNotifier.AddWarningMessage("Please enter a valid category name - not an empty and more than 3 symbols long");
            }
        }
    }
}