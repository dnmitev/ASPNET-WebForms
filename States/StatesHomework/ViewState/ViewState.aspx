<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewState.aspx.cs" Inherits="StatesHomework.ViewState.ViewState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    </head>
    <body>
        <form id="form1" runat="server">
            <p>The error is expected!</p>

            <div id="delete-state">
                <asp:TextBox ID="TextBox" runat="server"></asp:TextBox>

                <hr />

                <asp:Button OnClick="Print_Input" runat="server" Text="Submit" />
                <button id="delete-btn" >Delete ViewState</button>

                <asp:Label ID="Label" runat="server"></asp:Label>
            </div>

            <script>
                $(document).ready(
                    $("#delete-state").on("click", "#delete-btn", function () {
                        $("#__VIEWSTATE").val("");
                    })
                );
            </script>
        </form>
    </body>
</html>
