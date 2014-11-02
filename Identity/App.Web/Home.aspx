<%@ Page
    Title="Home"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Home.aspx.cs"
    Inherits="App.Web.Home" %>

<asp:Content ID="HomePageContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%= this.Title %></h1>

    <asp:ListView ID="ListViewMessages" runat="server" ItemType="App.Models.ChatMessage" SelectMethod="ListViewMessages_GetData">
        <ItemTemplate>
            <div class="well">
                <%#: Item.Content %>
                <p>
                    <span class="label label-default pull-right"><%#:string.Format("{0} {1}", Item.Author.FirstName, Item.Author.LastName) %></span>
                </p>
            </div>
        </ItemTemplate>
    </asp:ListView>

    <asp:LoginView runat="server">
        <LoggedInTemplate>
            <button id="create-new-msg-btn" class="btn btn-default">Create New Message</button>
        </LoggedInTemplate>
    </asp:LoginView>

    <div id="messega-creator">
        <div class="form-horizontal">
            <legend>Create new message:</legend>
            <div class="form-group">
                <asp:Label Text="Content" runat="server" AssociatedControlID="TextBoxNewMessage" class="col-lg-2 control-label" />
                <div class="col-lg-10">
                    <asp:TextBox ID="TextBoxNewMessage" runat="server" TextMode="MultiLine" Height="100px" CssClass="form-control" placeholder="Enter your message here..."></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelFirstName" Text="First Name" runat="server" AssociatedControlID="TextBoxFirstName" class="col-lg-2 control-label" />
                <div class="col-lg-10">
                    <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelLastName" Text="Last Name" runat="server" AssociatedControlID="TextBoxLastName" class="col-lg-2 control-label" />
                <div class="col-lg-10">
                    <asp:TextBox ID="TextBoxLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="SendBtn" Text="Send" runat="server" class="btn btn-primary" OnClick="SendBtn_Click" />
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#messega-creator').hide();
            $('#create-new-msg-btn').click(function (ev) {
                ev.preventDefault();
                $('#messega-creator').toggle("slide");
            });
        });
    </script>
</asp:Content>
