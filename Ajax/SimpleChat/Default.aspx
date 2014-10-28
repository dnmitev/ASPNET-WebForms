<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SimpleChat.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple Chat</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/yeti/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server" />

        <asp:ListView
            ID="ChatListView"
            runat="server"
            ItemType="SimpleChat.DB.Message"
            InsertItemPosition="LastItem"
            DataKeyNames="Id">

            <LayoutTemplate>
                <asp:UpdatePanel ID="ChatUpdatePanel" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger EventName="Tick" ControlID="TimerChatRefresh" />
                    </Triggers>
                    <ContentTemplate>
                        <div id="itemPlaceHolder" runat="server"></div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </LayoutTemplate>

            <ItemTemplate>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><%#: Item.Author %></h3>
                    </div>
                    <div class="panel-body">
                        <%#: Item.Content %>
                    </div>
                </div>
            </ItemTemplate>

            <InsertItemTemplate>
            </InsertItemTemplate>

        </asp:ListView>
        <div class="form-horizontal">
            <fieldset>
                <legend>Message Creator:</legend>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="TextBoxAuthor" ID="AuthorLabel" Text="Author: " class="col-lg-2 control-label" />
                    <div class="col-lg-6">
                        <asp:TextBox runat="server" ID="TextBoxAuthor" Text='<%#Bind("Author") %>' class="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="TextBoxContent" ID="Label1" Text="Message: " class="col-lg-2 control-label" />
                    <div class="col-lg-6">
                        <asp:TextBox runat="server" ID="TextBoxContent" Text='<%#Bind("Content") %>' class="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <asp:LinkButton
                            ID="InsertBtn"
                            runat="server"
                            CommandName="Insert"
                            Text="Insert"
                            OnCommand="InsertBtn_Command"
                            class="btn btn-primary" />
                    </div>
                </div>
            </fieldset>

            <asp:Timer ID="TimerChatRefresh" runat="server" Interval="500" />
        </div>
    </form>
</body>
</html>
