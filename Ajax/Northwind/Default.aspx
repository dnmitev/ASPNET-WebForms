<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Northwind.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager" />
        <asp:UpdatePanel ID="UpdatePanelEmployees" runat="server">
            <ContentTemplate>
                <asp:GridView
                    ID="EmployeesGrid"
                    runat="server"
                    DataKeyNames="EmployeeId"
                    OnSelectedIndexChanged="EmployeesGrid_SelectedIndexChanged"
                    AutoGenerateSelectButton="true"
                    AllowPaging="true"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                           <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanelOrders" runat="server">
            <ContentTemplate>
                <asp:GridView 
                    ID="OrdersGrid" 
                    runat="server" 
                    toGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
                        <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                        <asp:BoundField DataField="ShipCountry" HeaderText="ShipCountry" SortExpression="ShipCountry" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgressOrders" AssociatedUpdatePanelID="UpdatePanelEmployees" runat="server">
            <ProgressTemplate>
                <img src="loading.gif" width="50px"/>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>
