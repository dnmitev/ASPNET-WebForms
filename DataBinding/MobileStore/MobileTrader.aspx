<%@ Page
Language="C#"
AutoEventWireup="true"
CodeBehind="MobileTrader.aspx.cs"
Inherits="MobileStore.MobileTrader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Mobile Trader</title>
    </head>
    <body>
        <form id="MobileTrader" runat="server">
            <div>
                <asp:DropDownList runat="server" ID="ManufacturerList" AutoPostBack="true" OnSelectedIndexChanged="ManufacturerList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:DropDownList runat="server" ID="ModelsList" AutoPostBack="true" OnSelectedIndexChanged="ModelsList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:CheckBoxList runat="server" ID="ExtrasList" AutoPostBack="true">
                </asp:CheckBoxList>
                <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" AutoPostBack="true" ID="EngineList">
                </asp:RadioButtonList>
                <asp:Button ID="SubmitDetails" runat="server" OnClick="SubmitDetails_Click" Text="Show Info" />
                <asp:Literal ID="CarDetails" runat="server" Mode="Encode">
                </asp:Literal>
            </div>
        </form>
    </body>
</html>
