<%@ Page
    Title="Friends"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="~/Friends.aspx.cs"
    Inherits="PersonalProfile.Friends"
     %>

<asp:Content ID="PersonalInfoContent" ContentPlaceHolderID="MainContentPlaceholder" runat="server">
    <fieldset>
        <legend>Friends:</legend>
        <ul>
            <li>Batman</li>
            <li>Catwoman</li>
            <li>Superman</li>
            <li>Bat Georgi</li>
        </ul>
    </fieldset>
</asp:Content>