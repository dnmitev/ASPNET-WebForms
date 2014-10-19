<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllEventsDumped.aspx.cs" Inherits="DumpAllEvents.AllEventsDumped" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="DumpEvents" runat="server">
        <div>
            <asp:Button Text="Dump" runat="server" ID="DumpBtn" OnClick="DumpBtn_Click" OnInit="DumpBtn_Init" OnLoad="DumpBtn_Load" OnPreRender="DumpBtn_PreRender" OnUnload="DumpBtn_Unload" />
        </div>
    </form>
</body>
</html>
