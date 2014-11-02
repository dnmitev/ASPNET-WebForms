<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateArticle.aspx.cs" Inherits="App.Web.Admin.CreateArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="create-article" class="row">
        <h3>
            <asp:Label Text="Title:" runat="server" AssociatedControlID="TextBoxArticleTitle" />
            <asp:TextBox ID="TextBoxArticleTitle" runat="server" Width="300px" Text="<%# BindItem.Title %>" />
            <asp:RequiredFieldValidator
                ErrorMessage="Title is required"
                ControlToValidate="TextBoxArticleTitle"
                runat="server"
                CssClass="label label-warning" />
        </h3>
        <p>
            <asp:Label Text="Category:" runat="server" AssociatedControlID="DropdownListArticleCategories" />
            <asp:DropDownList runat="server"
                ID="DropdownListArticleCategories"
                DataTextField="Name"
                DataValueField="ID"
                ItemType="App.Models.Category"
                SelectMethod="DropDownListCategoriesCreate_GetData">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label Text="Content" runat="server" AssociatedControlID="TextBoxArticleContent" />
            <asp:TextBox
                ID="TextBoxArticleContent"
                runat="server"
                TextMode="MultiLine"
                Height="150px"
                Width="300px"
                Text="<%# BindItem.Content %>" />
            <asp:RequiredFieldValidator
                ErrorMessage="Article content is required"
                ControlToValidate="TextBoxArticleContent"
                runat="server"
                CssClass="label label-warning" />
        </p>
        <div>
            <asp:LinkButton Text="Save" runat="server" ID="SaveBtn" CommandName="Insert" CssClass="btn btn-success" OnClick="SaveBtn_Click" />
            <asp:HyperLink NavigateUrl="~/Admin/EditArticles" runat="server" Text="Cancel" CssClass="btn btn-danger" />
        </div>
    </div>
</asp:Content>
