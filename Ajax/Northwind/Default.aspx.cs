using Northwind.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Northwind
{
    public partial class Default : System.Web.UI.Page
    {
        private NorthwindEntities context;

        protected void Page_Init(object sender, EventArgs e)
        {
            context = new NorthwindEntities();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.EmployeesGrid.DataSource = this.context.Employees.Take(10).ToList();
            this.EmployeesGrid.DataBind();
        }

        protected void EmployeesGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            var grid = sender as GridView;
            if (grid == null)
            {
                throw new ArgumentNullException("Grid is null");
            }

            var currentEmployeeId = Convert.ToInt32(grid.SelectedValue);
            if (currentEmployeeId == 0)
            {
                throw new ArgumentException("Not specified employee");
            }

            Thread.Sleep(3000);

            var orders = this.context.Orders.Take(10).ToList();
            this.OrdersGrid.DataSource = orders;
            this.OrdersGrid.DataBind();
        }
    }
}