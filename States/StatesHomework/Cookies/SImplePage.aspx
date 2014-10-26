<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SImplePage.aspx.cs" Inherits="StatesHomework.Cookies.SImplePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox runat="server" ID="TextBoxInput"/>
        <asp:Button 
            ID="GoToBtn"
            Text="Go To The Cookie Restricted Page" 
            runat="server" 
            OnClick="GoToBtn_Click"/>
    </div>
    </form>
</body>
</html>
