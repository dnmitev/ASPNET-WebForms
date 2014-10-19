<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EscapingProblems.aspx.cs" Inherits="ControlsOverview.EscapingProblems" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
    </head>
    <body>
        <form id="escapingForm" runat="server">
            <div>
                <asp:TextBox runat="server" ID="TbInput" />
                <asp:Button Text="Get TextBox Value" runat="server" id="GetTextBoxBtn" OnClick="GetTextBoxBtn_Click"/>
            </div>
             <div>
                <asp:TextBox runat="server" ID="TbOutput"  />
                 <asp:Label Text="" runat="server" ID="LabelOutput" />
            </div>
        </form>
    </body>
</html>
