<%@ Page
    Title="Edit Books"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="EditBooks.aspx.cs"
    Inherits="App.Web.Admin.EditBooks" %>

<asp:Content ID="BookEditorContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView runat="server" ID="GridViewBooks"
        ItemType="App.Models.Book"
        SelectMethod="GridViewBooks_GetData"
        UpdateMethod="GridViewBooks_UpdateItem"
        DeleteMethod="GridViewBooks_DeleteItem"
        AllowSorting="true"
        AllowPaging="true"
        PageSize="5"
        AutoGenerateColumns="false"
        DataKeyNames="Id">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="WebSite" HeaderText="Web Site" SortExpression="WebSite" />
            <asp:BoundField DataField="Category.Name" HeaderText="Category" SortExpression="Category.Name" />
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>

    <div class="row">
        <button id="insert-btn" type="button" class="btn btn-primary pull-right">Insert</button>
    </div>

    <div class="row">
        <div id="create-book" class="col-md-12">
<%--            <asp:UpdatePanel runat="server" ID="BookUpdatePanel">
                <ContentTemplate>
                    <asp:FormView ID="FormViewInsertBook" runat="server"
                        DefaultMode="Insert"
                        ItemType="App.Models.Book"
                        InsertMethod="FormViewInsertBook_InsertItem">
                        <InsertItemTemplate>--%>
                            <div class="form-horizontal">
                                <legend>Create New Book</legend>
                                <div class="form-group">
                                    <asp:Label Text="Title" runat="server" class="col-lg-2 control-label" AssociatedControlID="TextBoxBookTitleCreate" />
                                    <div class="col-lg-10">
                                        <asp:TextBox runat="server"
                                            ID="TextBoxBookTitleCreate"
                                            placeholder="Enter book title ..."
                                            class="form-control"
                                            Text=" <%#: BindItem.Title %>">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ErrorMessage="Title is required" ControlToValidate="TextBoxBookTitleCreate" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label Text="Author" runat="server" class="col-lg-2 control-label" AssociatedControlID="TextBoxBookAuthorCreate" />
                                    <div class="col-lg-10">
                                        <asp:TextBox runat="server"
                                            ID="TextBoxBookAuthorCreate"
                                            placeholder="Enter book author ..."
                                            class="form-control"
                                            Text=" <%#: BindItem.Author %>">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ErrorMessage="Author is required" ControlToValidate="TextBoxBookAuthorCreate" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label Text="ISBN" runat="server" class="col-lg-2 control-label" AssociatedControlID="TextBoxBookIsbnCreate" />
                                    <div class="col-lg-10">
                                        <asp:TextBox runat="server"
                                            ID="TextBoxBookIsbnCreate"
                                            placeholder="Enter book ISBN ..."
                                            class="form-control"
                                            Text=" <%#: BindItem.ISBN %>">
                                        </asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label Text="Web Site" runat="server" class="col-lg-2 control-label" AssociatedControlID="TextBoxBookWebSiteCreate" />
                                    <div class="col-lg-10">
                                        <asp:TextBox runat="server"
                                            ID="TextBoxBookWebSiteCreate"
                                            placeholder="Enter book Web Site ..."
                                            class="form-control"
                                            Text=" <%#: BindItem.WebSite %>">
                                        </asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label Text="Description" runat="server" class="col-lg-2 control-label" AssociatedControlID="TextBoxBookDescription" />
                                    <div class="col-lg-10">
                                        <asp:TextBox runat="server"
                                            ID="TextBoxBookDescription"
                                            placeholder="Enter book description ..."
                                            TextMode="MultiLine"
                                            Height="100px"
                                            class="form-control"
                                            Text=" <%#: BindItem.Description %>">
                                        </asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label Text="Category" runat="server" class="col-lg-2 control-label" AssociatedControlID="DropDownListCategoriesCreate" />
                                    <div class="col-lg-10">
                                        <asp:DropDownList 
                                            runat="server" 
                                            ID="DropDownListCategoriesCreate" 
                                            DataTextField="Name" 
                                            DataValueField="ID" 
                                            ItemType="App.Models.Category"
                                            SelectMethod="DropDownListCategoriesCreate_GetData">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-10 col-lg-offset-2">
                                        <asp:LinkButton runat="server" ID="LinkButtonCreate" CssClass="btn btn-primary" Text="Create" OnClick="LinkButtonCreate_Click" PostBackUrl="~/Admin/EditBooks.aspx" />
                                        <asp:LinkButton runat="server" ID="LinkButtonCancel" CssClass="btn btn-default" Text="Cancel" CommandName="Cancel" PostBackUrl="~/Admin/EditBooks.aspx" />
                                    </div>
                                </div>

                            </div>
             <%--           </InsertItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
    </div>

    <div class="row">
        <asp:HyperLink NavigateUrl="~/" Text="Back to Books" CssClass="btn btn-primary" runat="server" />
    </div>

    <script>
        $(document).ready(function () {
            $('#create-book').hide();
            $('#insert-btn').click(function (ev) {
                ev.preventDefault();
                $('#create-book').toggle("slide");
            });
        });
    </script>
</asp:Content>
