<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="Northwind.EmployeeDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Details</title>
</head>
<body>
    <form id="EmployeeDetails" runat="server">
        <div>
            <asp:DetailsView runat="server" ID="EmployeeDetailsView" AutoGenerateRows="true" />
            <asp:HyperLink NavigateUrl="~/Employees.aspx" runat="server"  Text="Back"/>
        </div>
    </form>
</body>
</html>
