using NorthwindData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Northwind.Repeater
{
    public partial class Employess : System.Web.UI.Page
    {
        List<Employee> employees = new NorthwindEntities().Employees.ToList();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.EmployeeRepeater.DataSource = employees;
            this.DataBind();
        }
    }
}