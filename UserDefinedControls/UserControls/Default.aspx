<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserControls.Default" %>

<%@ Register Src="~/CustomMenu.ascx" TagPrefix="cm" TagName="MenuDataList"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <cm:MenuDataList runat="server" ID="CustomDataMenu"></cm:MenuDataList>
    </div>
    </form>
</body>
</html>
