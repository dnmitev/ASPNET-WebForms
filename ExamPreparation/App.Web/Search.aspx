<%@ Page
    Title="Search Results for Query"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Search.aspx.cs"
    Inherits="App.Web.Search" %>

<asp:Content ID="SearchPageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container body-content">

        <div class="col-md-12">
            <h1>
                <%: this.Title %>
                <asp:Literal ID="SearchQueryLiteral" runat="server" />
            </h1>
        </div>

        <asp:Repeater ID="SearchResult" runat="server" ItemType="App.Models.Book" SelectMethod="SearchResult_GetData">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>

            <ItemTemplate>
                <li>
                    <asp:HyperLink
                        NavigateUrl='<%# string.Format("~/BookDetails?id={0}",Item.Id) %>'
                        runat="server"
                        Text="<%# GetTitle(Item) %>" />
                    (Category: <%# Item.Category.Name %>)
                </li>
            </ItemTemplate>

            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>

        <div class="row">
            <asp:HyperLink NavigateUrl="~/" Text="Back to Books" CssClass="btn btn-primary" runat="server" />
        </div>
    </div>
</asp:Content>
