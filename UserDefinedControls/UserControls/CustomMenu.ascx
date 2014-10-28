<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomMenu.ascx.cs" Inherits="UserControls.CustomMenu" %>

<ul>
    <asp:DataList ID="MenuDataList" runat="server">
        <ItemTemplate>
            <a href="<%# Eval("Url") %>" style="color: <%# Eval("FontColor") %>">
                <%# Eval("Name") %>
            </a>
        </ItemTemplate>
    </asp:DataList>
</ul>
