<%@ Page
    Title="Home"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Home.aspx.cs"
    Inherits="App.Web.Home" %>

<asp:Content ID="HomePageContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%= this.Title %></h1>
</asp:Content>
