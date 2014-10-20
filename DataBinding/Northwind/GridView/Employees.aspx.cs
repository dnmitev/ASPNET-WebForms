namespace Northwind
{
    using NorthwindData;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var employess = new NorthwindEntities().Employees.ToList().Select(emp => new
            {
                Id = emp.EmployeeID,
                FullName = string.Format("{0} {1}", emp.FirstName, emp.LastName)
            });

            if (!Page.IsPostBack)
            {
                this.EmployeesGrid.DataSource = employess;
                this.DataBind();
            }
        }
    }
}