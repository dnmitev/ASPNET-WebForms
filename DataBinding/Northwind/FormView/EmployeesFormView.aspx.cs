namespace Northwind.FormView
{
    using NorthwindData;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class EmployeesFormView : System.Web.UI.Page
    {
        List<Employee> employees = new NorthwindEntities().Employees.ToList();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.EmployeeFormView.DataSource = employees;
                this.EmployeeFormView.DataBind();
            }
        }

        protected void FormViewEmployees_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            this.EmployeeFormView.PageIndex = e.NewPageIndex;
            this.EmployeeFormView.DataSource = employees;
            this.EmployeeFormView.DataBind();
        }
    }
}