<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeesListView.aspx.cs" Inherits="Northwind.ListView.EmployeesListView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="ListViewEmployees" runat="server" ItemType="NorthwindData.Employee">
                <LayoutTemplate>
                    <h2>Employees</h2>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemSeparatorTemplate>
                    <hr />
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <div>
                        <h3><%#: Item.FirstName + " "+ Item.LastName %></h3>
                        Job Title: <%#: Item.JobTitle %>
                        <br />
                        Hire Date: <%#: Item.HireDate %>; Sallary: <%#: Item.Salary %>;
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </form>
</body>
</html>
