<%@ Page
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="Atlas.Web.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>World Atlas</title>
</head>
<body>

    <form id="form1" runat="server">
        <ef:EntityDataSource
            runat="server"
            ID="ContinentsData"
            EntitySetName="Continents"
            OnContextCreating="Get_Data"
            EnableFlattening="false">
        </ef:EntityDataSource>

        <h4>Continents</h4>
        <p>
            Click on a continent to view countries from the DB in it.
        </p>
        <asp:ListBox
            ID="ListBoxContinents"
            runat="server"
            DataSourceID="ContinentsData"
            DataTextField="Name"
            DataValueField="Id"
            AutoPostBack="true"></asp:ListBox>

        <hr />

        <ef:EntityDataSource
            runat="server"
            ID="CountriesData"
            EntitySetName="Countries"
            OnContextCreating="Get_Data"
            EnableFlattening="false"
            Where="it.Continent.Id=@continentId">

            <WhereParameters>
                <asp:ControlParameter Name="continentId" Type="Int32"
                    ControlID="ListBoxContinents" />
            </WhereParameters>

        </ef:EntityDataSource>

        <h4>Countries</h4>
        <asp:GridView
            ID="GridViewCountries"
            runat="server"
            DataSourceID="CountriesData"
            AutoGenerateColumns="False"
            DataKeyNames="Id"
            AllowPaging="True"
            AllowSorting="True">

            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Population" HeaderText="Population" SortExpression="Population" />
            </Columns>
        </asp:GridView>

        <h4>Towns</h4>

        <ef:EntityDataSource
            runat="server"
            ID="TownsData"
            EntitySetName="Towns"
            OnContextCreating="Get_Data"
            Where="it.Country.Id=@OcountryId"
            EnableFlattening="False">

            <WhereParameters>
                <asp:ControlParameter Name="OcountryId" Type="Int32"
                    ControlID="GridViewCountries" />
            </WhereParameters>

        </ef:EntityDataSource>

        <asp:ListView
            ID="ListViewTowns"
            runat="server"
            DataSourceID="TownsData"
            ItemPlaceholderID="ItemPlace">

            <ItemTemplate>
                <tr runat="server">
                    <td>
                        <%#: Eval("Id") %>
                    </td>
                    <td>
                        <%#: Eval("Name") %>
                    </td>
                    <td>
                        <%#: Eval("Population")%>
                    </td>
                </tr>
            </ItemTemplate>

            <LayoutTemplate>

                <table class="table table-striped table-bordered table-hover">
                    <tr runat="server">
                        <th runat="server">Id</th>
                        <th runat="server">Name</th>
                        <th runat="server">Population</th>
                    </tr>
                    <tr runat="server" id="ItemPlace" />
                </table>

                <div class="row">
                    <asp:DataPager
                        ID="ItemsPager"
                        runat="server"
                        PagedControlID="ListViewTowns"
                        PageSize="1">

                        <Fields>
                            <asp:NextPreviousPagerField
                                ShowFirstPageButton="true"
                                ShowNextPageButton="false"
                                ShowPreviousPageButton="false"/>

                            <asp:NumericPagerField
                                CurrentPageLabelCssClass="btn btn-default" />

                            <asp:NextPreviousPagerField
                                ShowLastPageButton="true"
                                ShowNextPageButton="false"
                                ShowPreviousPageButton="false"/>
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
        </asp:ListView>
    </form>

</body>
</html>
