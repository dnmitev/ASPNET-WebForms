<%@ Page
    Title="Books"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Home.aspx.cs"
    Inherits="App.Web.Home" %>

<asp:Content ID="HomePageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h1><%= this.Title %></h1>
        <div class="row">
            <div class="pull-right">
                <asp:TextBox
                    runat="server"
                    ID="TextBoxSearchParam"
                    CssClass="col-lg-8 search-query"
                    placeholder="Search by book title / author..." />

                <asp:LinkButton
                    ID="SearchLinkBtn"
                    runat="server"
                    class="btn  btn-primary search-btn"
                    Text="Search"
                    OnClick="SearchLinkBtn_Click" />
            </div>
        </div>
    </div>

    <asp:ListView
        runat="server"
        ID="ListViewCategories"
        ItemType="App.Models.Category"
        SelectMethod="ListViewCategories_GetData"
        GroupItemCount="3">
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="col-md-4">
                <h2><%# Item.Name %></h2>
                <asp:ListView
                    runat="server"
                    ID="BooksList"
                    ItemType="App.Models.Book"
                    DataSource="<%# Item.Books %>">
                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink
                                NavigateUrl='<%#string.Format("~/BookDetails.aspx?id={0}",Item.Id) %>'
                                runat="server"
                                Text='<%# string.Format(@"""{0} by <i>{1}</i>",Item.Title, Item.Author) %>' />
                        </li>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No books in this category
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
