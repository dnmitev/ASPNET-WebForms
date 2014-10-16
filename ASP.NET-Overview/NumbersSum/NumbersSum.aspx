<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NumbersSum.aspx.cs" Inherits="NumbersSum.NumbersSum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="sumForm" runat="server">
        <div>
            <h1>Sum Up Numbers</h1>

            <label for="TextBoxFirstNumber">First Number:</label>
            <asp:TextBox ID="TextBoxFirstNumber" runat="server"></asp:TextBox>
            <br />
            <label for="TextBoxSecondNumber">Second Number:</label>
            <asp:TextBox ID="TextBoxSecondNumber" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonGetSum" runat="server" Text="Button" onclick="ButtonGetSumOnClick"/>
            <br />
            <label for="TextBoxSum">Sum:</label>
            <asp:TextBox ID="TextBoxSum" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
