<%@ Page Title=""
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="MainPage.aspx.cs"
    Inherits="InternationalCompany.WebForm1" %>


<asp:Content ID="MainPageHeading" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">
    <h1>Find us in your country:</h1>
</asp:Content>
<asp:Content ID="Countries" ContentPlaceHolderID="ContentPlaceHolderPageContent" runat="server">
    <div id="mainPageContent">
        <asp:HyperLink runat="server" NavigateUrl="~/Bulgaria/Home.aspx" Text="Bulgaria" />
        <asp:HyperLink runat="server" NavigateUrl="~/USA/Home.aspx" Text="USA" />
    </div>
</asp:Content>
