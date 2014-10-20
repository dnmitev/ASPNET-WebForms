namespace Northwind
{
    using NorthwindData;
    using System;
    using System.Linq;

    public partial class EmployeeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = int.Parse(Request.QueryString["id"]);
            var employee = new NorthwindEntities().Employees.Where(emp => emp.EmployeeID == id).ToList();

            this.EmployeeDetailsView.DataSource = employee;
            this.DataBind();
        }
    }
}