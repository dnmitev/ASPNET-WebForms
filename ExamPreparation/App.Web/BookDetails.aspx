<%@ Page
    Title="Book Details"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="BookDetails.aspx.cs"
    Inherits="App.Web.BookDetails" %>

<asp:Content ID="BookDetailsContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView
        ID="BookDetailsFormView"
        runat="server"
        ItemType="App.Models.Book"
        SelectMethod="BookDetailsFormView_GetItem">
        <ItemTemplate>
            <header>
                <h1><%# this.Title %></h1>
                <p class="book-title"><%#: Item.Title %></p>
                <p class="book-author"><i>by <%#: Item.Author %></i></p>
                <p class="book-isbn"><i>ISBN <%#: Item.ISBN %></i></p>
                <p class="book-isbn">
                    <i>Web site: 
                        <asp:HyperLink NavigateUrl="<%#: Item.WebSite %>" runat="server" Text="<%#: Item.WebSite %>" />
                    </i>
                </p>
            </header>
            <div class="row-fluid">
                <div class="col-md-12 book-description">
                    <p>
                        <%#: Item.Description %>
                    </p>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

    <div class="row">
        <asp:HyperLink  NavigateUrl="~/" Text="Back to Books" CssClass="btn btn-primary" runat="server" />
    </div>
</asp:Content>
