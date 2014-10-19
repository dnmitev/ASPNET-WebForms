<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebControls.aspx.cs" Inherits="ControlsOverview.WebControls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="randomNumberGeneratorForm" runat="server">
        <div>
            <asp:Label Text="Lower Range Bound:" runat="server" AssociatedControlID="LowerRangeBound" />
            <asp:TextBox runat="server" ID="LowerRangeBound" TextMode="Number" />
        </div>
        <div>
            <asp:Label Text="Upper Range Bound:" runat="server" AssociatedControlID="UpperRangeBound" />
            <asp:TextBox runat="server" ID="UpperRangeBound" TextMode="Number" />
        </div>
        <div>
            <asp:Button Text="Get Random" runat="server" OnClick="OnGetRandom_Click" />
        </div>
        <div>
            <asp:Literal Text="" runat="server" ID="RandomlyGeneratedNumber" />
        </div>
    </form>
</body>
</html>
