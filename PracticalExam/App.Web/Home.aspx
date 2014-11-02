<%@ Page
    Title="News"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Home.aspx.cs"
    Inherits="App.Web.Home" %>

<asp:Content ID="HomePageContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%= this.Title %></h1>

    <h2>Most Popular Articles</h2>
    <asp:ListView
        runat="server"
        ID="ListViewPopularArticles"
        ItemType="App.Models.Article"
        SelectMethod="ListViewPopularArticles_GetData">
        <ItemTemplate>
            <div class="row">
                <h3>
                    <asp:HyperLink
                        NavigateUrl='<%# string.Format("~/ArticleDetails.aspx?id={0}",Item.Id) %>'
                        runat="server"
                        Text="<%# Item.Title %>" />
                    <small><%# Item.Category.Name %></small>
                </h3>
                <p>
                    <%#: Item.Content %>
                </p>
                <p>Likes: <%# Item.Likes.Value %></p>
                <div>
                    <i>by <%# Item.Author.UserName %></i>
                    <i>created on: <%#: Item.DateCreated.ToString("MM/dd/yyyy hh:mm:ss tt",System.Globalization.CultureInfo.InvariantCulture) %></i>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>

    <h2>All Categories</h2>
    <asp:ListView
        runat="server"
        ID="ListViewCategories"
        ItemType="App.Models.Category"
        SelectMethod="ListViewCategories_GetData"
        GroupItemCount="2">
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="col-md-6">
                <h3><%# Item.Name %></h3>
                <asp:ListView
                    runat="server"
                    ID="ArticlesList"
                    ItemType="App.Models.Article"
                    DataSource="<%# Item.Articles %>">

                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </ul>
                    </LayoutTemplate>


                    <ItemTemplate>
                        <li>
                            <asp:HyperLink
                                NavigateUrl='<%# string.Format("~/ArticleDetails.aspx?id={0}",Item.Id) %>'
                                runat="server"
                                Text='<%# string.Format("<strong>{0}</strong> <i>by {1}</i>",Item.Title, Item.Author.UserName) %>' />
                        </li>
                    </ItemTemplate>

                    <EmptyDataTemplate>
                        No articles.
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
