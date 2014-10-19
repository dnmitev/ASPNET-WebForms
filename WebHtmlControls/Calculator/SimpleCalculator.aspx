<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleCalculator.aspx.cs" Inherits="Calculator.SimpleCalculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple Calculator</title>
    <style type="text/css">
        table {
            border-collapse: collapse;
            border: 1px solid black;
        }

        input[type="text"] {
            height: 100%;
            font-size: 2em;
            text-align: right;
            vertical-align: central;
        }

        td {
            padding: inherit;
        }

        input[type="submit"] {
            width: 100%;
        }

        .equals {
            text-align: center;
        }

        #ButtonEquals {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="simpleCalculator" runat="server">
  <table border="0">
            <tr>
                <td colspan="4">
                    <asp:TextBox runat="server" Width="190" ReadOnly="true" ID="TextBoxDisplay" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button Text="1" ID="Button1" runat="server" OnClick="NumberBtn_Click"/>
                </td>
                <td>
                    <asp:Button Text="2" ID="Button2" runat="server" OnClick="NumberBtn_Click" />
                </td>
                <td>
                    <asp:Button Text="3" ID="Button3" runat="server" OnClick="NumberBtn_Click" />
                </td>
                <td>
                    <asp:Button Text="+" ID="ButtonPlus" runat="server" OnClick="ButtonPlus_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button Text="4" ID="Button4" runat="server" OnClick="NumberBtn_Click" />
                </td>
                <td>
                    <asp:Button Text="5" ID="Button5" runat="server" OnClick="NumberBtn_Click" />
                </td>
                <td>
                    <asp:Button Text="6" ID="Button6" runat="server" OnClick="NumberBtn_Click" />
                </td>
                <td>
                    <asp:Button Text="-" ID="ButtonMinus" runat="server" OnClick="ButtonMinus_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button Text="7" ID="Button7" runat="server" OnClick="NumberBtn_Click" />
                </td>
                <td>
                    <asp:Button Text="8" ID="Button8" runat="server" OnClick="NumberBtn_Click" />
                </td>
                <td>
                    <asp:Button Text="9" ID="Button9" runat="server" OnClick="NumberBtn_Click" />
                </td>
                <td>
                    <asp:Button Text="x" ID="ButtonMultiply" runat="server" OnClick="ButtonMultiply_Click"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button Text="Clear" ID="ButtonClear" runat="server" OnClick="ButtonClear_Click" />
                </td>
                <td>
                    <asp:Button Text="0" ID="Button0" runat="server" OnClick="NumberBtn_Click" />
                </td>
                <td>
                    <asp:Button Text="√" ID="ButtonSqrt" runat="server" OnClick="ButtonSqrt_Click"/>                    
                </td>
                <td>
                    <asp:Button Text="/" ID="ButtonDivide" runat="server" OnClick="ButtonDivide_Click"/>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="equals">
                    <asp:Button Text="=" ID="ButtonEquals" runat="server" OnClick="ButtonEquals_Click" />
                </td>
            </tr>
        </table>

        <asp:HiddenField runat="server" ID="FieldStorage" Value="" />
        <asp:HiddenField runat="server" ID="Operator" Value="" />
        <asp:CheckBox runat="server" ID="CheckBoxIsOperatorPressed" Visible="false" Checked="false" />
    </form>
</body>
</html>
