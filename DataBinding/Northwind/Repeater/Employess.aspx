<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employess.aspx.cs" Inherits="Northwind.Repeater.Employess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
    </head>
    <body>
        <form id="mainForm" runat="server">
            <asp:Repeater ID="EmployeeRepeater" runat="server" ItemType="NorthwindData.Employee">
                <HeaderTemplate>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>First Name </th>
                                <th>Last Name </th>
                                <th>Job Title </th>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#: Item.FirstName %></td>
                        <td><%#: Item.LastName %></td>
                        <td><%#: Item.JobTitle %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </form>
    </body>
</html>
