<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GreetMe.aspx.cs" Inherits="SimpleDemo.GreetMe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label Text="Please enter your name:" runat="server" />
            <asp:TextBox ID="TbName" runat="server" />
        </div>
        <div>
            <asp:Button Text="Greet Me" runat="server" OnClick="OnGreetMe_Click" />
        </div>
        <div>
            <asp:Label ID="Label_Greeting" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
