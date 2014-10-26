<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionState.aspx.cs" Inherits="StatesHomework.Session.SessionState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox runat="server"  ID="TextBoxInput"/>
            <asp:Button Text="Submit" runat="server" ID="SubmitBtn" OnClick="SubmitBtn_Click"/>
            <asp:Label Id="SessionLabel" runat="server" />
        </div>
    </form>
</body>
</html>
