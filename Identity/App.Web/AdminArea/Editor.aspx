<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="App.Web.AdminArea.Editor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListViewMessages" runat="server"
        ItemType="App.Models.ChatMessage"
        SelectMethod="ListViewMessages_GetData"
        UpdateMethod="ListViewMessages_UpdateItem"
        InsertMethod="ListViewMessages_InsertItem"
        DeleteMethod="ListViewMessages_DeleteItem"
        InsertItemPosition="LastItem"
        DataKeyNames="Id">

        <ItemTemplate>
            <div class="row">
                <div class="col-md-6"><%# Item.Content %></div>
                <div class="col-md-3"><%# string.Format("{0} {1}", Item.Author.FirstName, Item.Author.LastName) %></div>
                <asp:LinkButton Text="Edit" runat="server" ID="EditBtn" CommandName="Edit" CssClass="btn btn-info" />
                <asp:LinkButton Text="Delete" runat="server" ID="DeleteBtn" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want delete this?');" />
            </div>
        </ItemTemplate>

        <EditItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="TextBoxEditContent" Text="<%#: BindItem.Content %>" />
                </div>
                <asp:LinkButton Text="Save" runat="server" ID="SaveBtn" CommandName="Update" CssClass="btn btn-info" />
                <asp:LinkButton Text="Cancel" runat="server" ID="CancelBtn" CommandName="Cancel" CssClass="btn btn-danger" />
            </div>
        </EditItemTemplate>

        <InsertItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="TextBoxInsertCategory" Text="<%#: BindItem.Content %>" />
                </div>
                <asp:LinkButton Text="Save" runat="server" ID="SaveBtn" CommandName="Insert" CssClass="btn btn-success" />
                <asp:LinkButton Text="Cancel" runat="server" ID="CancelBtn" CommandName="Cancel" CssClass="btn btn-danger" />
            </div>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>
