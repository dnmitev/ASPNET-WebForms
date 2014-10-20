<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeesFormView.aspx.cs" Inherits="Northwind.FormView.EmployeesFormView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formMain" runat="server">
        <div>
            <asp:FormView
                ID="EmployeeFormView"
                runat="server" AllowPaging="true"
                OnPageIndexChanging="FormViewEmployees_PageIndexChanging"
                ItemType="NorthwindData.Employee">
                <ItemTemplate>
                    <div>
                        <h3>Employee Profile</h3>
                    </div>
                    <div>
                        <h4><%#: Item.FirstName + " " + Item.LastName %></h4>
                        <div>
                            <ul>
                                <li>
                                    Position: <%#: Item.JobTitle %>
                                </li>
                                <li>
                                    Hire Date: <%#: Item.HireDate %>
                                </li>
                                <li>
                                    Salary: <%#: Item.Salary %>
                                </li>
                            </ul>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
