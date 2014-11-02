<%@ Page
    Title="Categories Editor"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="EditCategories.aspx.cs"
    Inherits="App.Web.Admin.EditCategories" %>

<asp:Content ID="CategoriesEdittorContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView
        runat="server"
        ID="CategoriesEditor"
        ItemType="App.Models.Category"
        SelectMethod="CategoriesEditor_GetData"
        DeleteMethod="CategoriesEditor_DeleteItem"
        UpdateMethod="CategoriesEditor_UpdateItem"
        DataKeyNames="Id"
        InsertMethod="CategoriesEditor_InsertItem"
        InsertItemPosition="FirstItem">

        <LayoutTemplate>
            <div class="row">
                <asp:LinkButton Text="Category Name" runat="server" ID="LinkBtnSortByCategory" CommandName="Sort" CommandArgument="Name" class="btn btn-default" />
            </div>

            <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>

            <div class="row">
                <asp:DataPager runat="server" ID="DataPagerCategories" PagedControlID="CategoriesEditor" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField />
                        <asp:NumericPagerField />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>

        <ItemTemplate>
            <div class="row">
                <div class="col-md-3"><%# Item.Name %></div>
                <asp:LinkButton Text="Edit" runat="server" ID="EditBtn" CommandName="Edit" CssClass="btn btn-info" />
                <asp:LinkButton Text="Delete" runat="server" ID="DeleteBtn" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want delete this?');"/>
            </div>
        </ItemTemplate>

        <EditItemTemplate>
            <div class="row">
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="TextBoxEditCategory" Text="<%#: BindItem.Name %>" />
                </div>
                <asp:LinkButton Text="Save" runat="server" ID="SaveBtn" CommandName="Update" CssClass="btn btn-info" />
                <asp:LinkButton Text="Cancel" runat="server" ID="CancelBtn" CommandName="Cancel" CssClass="btn btn-danger" />
            </div>
        </EditItemTemplate>

        <InsertItemTemplate>
            <div class="row">
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="TextBoxInsertCategory" Text="<%#: BindItem.Name %>" />
                </div>
                <asp:LinkButton Text="Save" runat="server" ID="SaveBtn" CommandName="Insert" CssClass="btn btn-success" />
                <asp:LinkButton Text="Cancel" runat="server" ID="CancelBtn" CommandName="Cancel" CssClass="btn btn-danger" />
            </div>
        </InsertItemTemplate>

    </asp:ListView>
</asp:Content>
