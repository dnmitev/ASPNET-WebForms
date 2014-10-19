<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SimpleWebFormsApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h3>Hello,ASP.NET. I greet you from the Deafult.aspx file</h3>
        <h3>
            <asp:Label ID="GreetAsp" Text="" runat="server" />
        </h3>
        <h3>
            Current Assembly Location: 
            <asp:Label ID="Assembly_Location" Text="" runat="server" />
        </h3>
    </div>

</asp:Content>
