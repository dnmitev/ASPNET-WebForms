<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="Students.StudentRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Students Registration</title>
    </head>
    <body>
        <form id="RegisterStudentForm" runat="server">
            <div>
                <asp:Label Text="First Name:" runat="server" AssociatedControlID="FirstName" />
                <asp:TextBox ID="FirstName" runat="server" />
            </div>
            <div>
                <asp:Label Text="Last Name:" runat="server" AssociatedControlID="LastName" />
                <asp:TextBox ID="LastName" runat="server" />
            </div>
            <div>
                <asp:Label Text="Faculty Number:" runat="server" AssociatedControlID="FacultyNumber" />
                <asp:TextBox ID="FacultyNumber" runat="server" />
            </div>
            <div>
                <asp:Label Text="University:" runat="server" AssociatedControlID="University" />
                <asp:DropDownList ID="University" runat="server">
                    <asp:ListItem Text="UNWE" />
                    <asp:ListItem Text="UACEG" />
                    <asp:ListItem Text="FMI" />
                    <asp:ListItem Text="PU" />
                </asp:DropDownList>
            </div>
            <div>
                <asp:Label Text="Courses:" runat="server" AssociatedControlID="Courses" />
                <asp:ListBox ID="Courses" runat="server" SelectionMode="Multiple" >
                    <asp:ListItem Text="FEM" />
                    <asp:ListItem Text="Economics" />
                    <asp:ListItem Text="Strength of materials" />
                    <asp:ListItem Text="Math" />
                </asp:ListBox>
            </div>
            <div>
                <asp:Button ID="RegisterBtn" Text="Register" runat="server" OnClick="RegisterBtn_Click"/>
            </div>
        </form>
    </body>
</html>
