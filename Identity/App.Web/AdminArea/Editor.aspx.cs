using App.Data;
using App.Data.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App.Web.AdminArea
{
    public partial class Editor : System.Web.UI.Page
    {
        private IAppData data;

        public Editor()
        {
            this.data = new AppData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<App.Models.ChatMessage> ListViewMessages_GetData()
        {
            return this.data.ChatMessages.All().OrderBy(cm => cm.Id);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewMessages_UpdateItem(int id)
        {
            App.Models.ChatMessage item = null;
            item = this.data.ChatMessages.All().FirstOrDefault(cm => cm.Id == id);
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
                this.data.ChatMessages.Update(item);
                this.data.SaveChanges();
            }
        }

        public void ListViewMessages_InsertItem()
        {
            var item = new App.Models.ChatMessage();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here

                item.AuthorId = this.data.Users.All().FirstOrDefault(u => u.UserName == User.Identity.Name).Id;
                this.data.ChatMessages.Add(item);
                this.data.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewMessages_DeleteItem(int id)
        {
            var msg = this.data.ChatMessages.All().FirstOrDefault(cm => cm.Id == id);
            this.data.ChatMessages.Delete(msg);
            this.data.SaveChanges();
        }
    }
}