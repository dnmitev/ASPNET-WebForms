<%@ Page
    Title="Edit Categories"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="EditCategories.aspx.cs"
    Inherits="App.Web.Admin.EditCategories" %>

<asp:Content ID="CategoriesEditorContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="category-editor">
        <asp:ListView
            runat="server"
            ID="CategoriesEditor"
            ItemType="App.Models.Category"
            SelectMethod="CategoriesEditor_GetData"
            DeleteMethod="CategoriesEditor_DeleteItem"
            UpdateMethod="CategoriesEditor_UpdateItem"
            DataKeyNames="Id"
            InsertMethod="CategoriesEditor_InsertItem"
            InsertItemPosition="LastItem">
            <LayoutTemplate>
                <table class="gridview" cellspacing="0" rules="all" border="1" id="MainContent_GridViewCategories" style="border-collapse: collapse;">
                    <tbody>
                        <tr>
                            <th scope="col">
                                <asp:LinkButton Text="Category Name" runat="server" ID="LinkBtnSortByCategory" CommandName="Sort" CommandArgument="Name" />
                            </th>
                            <th scope="col">Action</th>
                        </tr>

                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>

                        <tr>
                            <td colspan="2">
                                <asp:DataPager runat="server" ID="DataPagerCategories" PagedControlID="CategoriesEditor" PageSize="3">
                                    <Fields>
                                        <asp:NumericPagerField />
                                    </Fields>
                                </asp:DataPager>
                                <button id="InsertBtn" class="btn btn-primary pull-right">Insert</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr>
                    <td><%#: Item.Name %></td>
                    <td>
                        <asp:LinkButton Text="Edit" runat="server" ID="EditBtn" CommandName="Edit" CssClass="btn btn-success " />
                        <asp:LinkButton Text="Delete" runat="server" ID="DeleteBtn" CommandName="Delete" CssClass="btn btn-danger" />
                    </td>
                </tr>
            </ItemTemplate>

            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="TextBoxName" Text="<%#: BindItem.Name %>" /></td>
                    <td>
                        <asp:LinkButton Text="Save" runat="server" ID="SaveBtn" CommandName="Update" CssClass="btn btn-success " />
                        <asp:LinkButton Text="Cancel" runat="server" ID="CancelBtn" CommandName="Cancel" CssClass="btn btn-danger" />
                    </td>
                </tr>
            </EditItemTemplate>

            <InsertItemTemplate>
                <tr id="insert-panel">
                    <td>
                        <asp:TextBox runat="server" ID="TextBoxName" Text="<%#: BindItem.Name %>" />
                    </td>
                    <td>
                        <asp:LinkButton Text="Insert" runat="server" ID="InsertBtn" CommandName="Insert" CssClass="btn btn-success " />
                        <button id="CancelBtn" class="btn btn-danger">Cancel</button>
                    </td>
                </tr>
            </InsertItemTemplate>

        </asp:ListView>
    </div>

    <div class="row">
        <asp:HyperLink NavigateUrl="~/" Text="Back to Books" CssClass="btn btn-primary" runat="server" />
    </div>
    <script>
        $(document).ready(function () {
            $('#insert-panel').hide();
            $('#InsertBtn').click(function (ev) {
                ev.preventDefault();
                $('#insert-panel').toggle("slide");
            });
            $('#CancelBtn').click(function (ev) {
                ev.preventDefault();
                $('#insert-panel').toggle("slide");
            });
        });
    </script>
</asp:Content>
