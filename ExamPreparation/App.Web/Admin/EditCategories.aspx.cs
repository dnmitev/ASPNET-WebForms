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
    public partial class EditCategories : System.Web.UI.Page
    {
        private IAppData data;

        public EditCategories()
        {
            this.data = new AppData();
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Category> CategoriesEditor_GetData()
        {
            return this.data.Categories.All().OrderBy(c => c.Id);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CategoriesEditor_DeleteItem(int id)
        {
            var category = this.data.Categories.All().FirstOrDefault(c => c.Id == id);
            if (category == null)
            {
                ErrorSuccessNotifier.AddErrorMessage("Category not matched");
                return;
            }

            this.data.Categories.Delete(category);
            this.data.SaveChanges();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CategoriesEditor_UpdateItem(int id)
        {
            App.Models.Category item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
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

                if (string.IsNullOrEmpty(item.Name))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Category name cannot be null or empty");
                    return;
                }

                this.data.Categories.Update(item);
                this.data.SaveChanges();
            }
        }

        public void CategoriesEditor_InsertItem()
        {
            var item = new App.Models.Category();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                if (this.data.Categories.All().Any(c => c.Name == item.Name))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Categories duplication is not allowed");
                    return;
                }

                if (string.IsNullOrEmpty(item.Name))
                {
                    ErrorSuccessNotifier.AddErrorMessage("Category name cannot be null or empty");
                    return;
                }

                this.data.Categories.Add(item);
                this.data.SaveChanges();
            }
        }

        protected void LinkButtonInsert_Click(object sender, EventArgs e)
        {

        }
    }
}