<%@ Page
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Employees.aspx.cs"
    Inherits="Northwind.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Northwind Employees</title>
</head>
<body>
    <form id="employeesForm" runat="server">
        <asp:GridView runat="server" ID="EmployeesGrid" AutoGenerateColumns="false">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="EmployeeDetails.aspx?id={0}" DataTextField="FullName" HeaderText="Full Name"/>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
