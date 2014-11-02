<%@ Page
    Title="Articles Editor"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="EditArticles.aspx.cs"
    Inherits="App.Web.Admin.EditArticles" %>

<asp:Content ID="ArticlesEditorContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView
        runat="server"
        ID="ArticlesEditor"
        ItemType="App.Web.Models.ArticleViewModel"
        SelectMethod="ArticlesEditor_GetData"
        DeleteMethod="ArticlesEditor_DeleteItem"
        UpdateMethod="ArticlesEditor_UpdateItem"
        DataKeyNames="Id">

        <LayoutTemplate>
            <div class="row">
                <asp:LinkButton Text="Sort By Title" runat="server" ID="LinkBtnSortByTitle" CommandName="Sort" CommandArgument="Title" class="col-md-2 btn btn-default" />
                <asp:LinkButton Text="Sort By Date" runat="server" ID="LinkBtnSortByDate" CommandName="Sort" CommandArgument="Date" class="col-md-2 btn btn-default" />
                <asp:LinkButton Text="Sort By Category" runat="server" ID="LinkBtnSortByCategory" CommandName="Sort" CommandArgument="Category" class="col-md-2 btn btn-default" />
                <asp:LinkButton Text="Sort By Likes" runat="server" ID="LinkBtnSortByLikes" CommandName="Sort" CommandArgument="Likes" class="col-md-2 btn btn-default" />
            </div>

            <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>

            <div class="row">
                <asp:DataPager runat="server" ID="DataPagerCategories" PagedControlID="ArticlesEditor" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField />
                        <asp:NumericPagerField />
                    </Fields>
                </asp:DataPager>
            </div>
            <asp:LinkButton Text="Insert New Article" runat="server"  class="btn btn-info pull-right" PostBackUrl="~/Admin/CreateArticle.aspx" />
        </LayoutTemplate>

        <ItemTemplate>
            <div class="row">
                <h3>
                    <%# Item.Title %>
                    <asp:LinkButton Text="Edit" runat="server" ID="EditBtn" CommandName="Edit" CssClass="btn btn-info" />
                    <asp:LinkButton Text="Delete" runat="server" ID="DeleteBtn" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want delete this?');"></asp:LinkButton>
                </h3>
                <p>Category: <%# Item.Category %></p>
                <p>
                    <%# Item.Content %>
                </p>
                <p>Likes count: <%# Item.Likes %></p>
                <div>
                    <i>by <%# Item.Author %></i>
                    <i>created on: <%#: Item.Date.ToString("MM/dd/yyyy hh:mm:ss tt",System.Globalization.CultureInfo.InvariantCulture) %></i>
                </div>
            </div>
        </ItemTemplate>

        <EditItemTemplate>
            <div class="row">
                <h3>
                    <asp:TextBox runat="server" ID="TextBoxEditTitle" Text="<%# BindItem.Title %>" />
                    <asp:LinkButton Text="Save" runat="server" ID="EditBtn" CommandName="Update" CssClass="btn btn-success" />
                    <asp:LinkButton Text="Cancel" runat="server" ID="DeleteBtn" CommandName="Cancel" CssClass="btn btn-danger" />
                </h3>
                <p>
                    <asp:Label Text="Category:" runat="server" AssociatedControlID="DropdownListCategories" />
                    <asp:DropDownList runat="server"
                        ID="DropdownListCategories"
                        DataTextField="Name"
                        DataValueField="ID"
                        ItemType="App.Models.Category"
                        SelectMethod="DropDownListCategoriesCreate_GetData">
                    </asp:DropDownList>
                </p>
                <p>
                    <asp:TextBox runat="server" ID="TExtBoxEditContent" TextMode="MultiLine" Height="150px" Width="90%" Text=" <%# BindItem.FullContent %>" />
                </p>
                <div>
                    <i>by <%# Item.Author %></i>
                    <i>created on: <%#: Item.Date.ToString("MM/dd/yyyy hh:mm:ss tt",System.Globalization.CultureInfo.InvariantCulture) %></i>
                </div>
            </div>
        </EditItemTemplate>
    </asp:ListView>
</asp:Content>
