<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Validation.SimpleValidation.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/yeti/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="registerForm" runat="server">
        <fieldset>
            <legend>Personal Info</legend>

            <asp:ValidationSummary class="alert alert-dismissable alert-danger" ID="ValidationSummaryPersonalInfo" ValidationGroup="personalInfo" DisplayMode="BulletList" runat="server" />

            <div class="form-group">
                <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="FirstName">First Name</asp:Label>
                <div class="col-md-9">
                    <asp:TextBox ValidationGroup="personalInfo" class="form-control" ID="FirstName" placeholder="First Name" runat="server" />
                </div>

                <asp:RequiredFieldValidator
                    ValidationGroup="personalInfo"
                    ID="FirstNameValitadion"
                    runat="server"
                    ErrorMessage="First name is required!"
                    Text="*"
                    ControlToValidate="FirstName"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="LastName">Last Name</asp:Label>
                <div class="col-md-9">
                    <asp:TextBox ValidationGroup="personalInfo" class="form-control" ID="LastName" placeholder="Last Name" runat="server" />
                </div>

                <asp:RequiredFieldValidator
                    ValidationGroup="personalInfo"
                    ID="LastNameValidation"
                    runat="server"
                    ErrorMessage="Last name is required!"
                    Text="*"
                    ControlToValidate="LastName"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Age">Age</asp:Label>
                <div class="col-md-9">
                    <asp:TextBox ValidationGroup="personalInfo" type="number" class="form-control" ID="Age" runat="server" placeholder="Age" />
                </div>

                <asp:RequiredFieldValidator
                    ValidationGroup="personalInfo"
                    ID="AgeValidation"
                    runat="server"
                    ErrorMessage="Please enter your age!"
                    Text="*"
                    ControlToValidate="Age"
                    Display="Dynamic" />

                <asp:RangeValidator
                    ValidationGroup="personalInfo"
                    ID="AgeRangeValidation"
                    runat="server"
                    ErrorMessage="Age must be between 18 and 81"
                    ControlToValidate="Age"
                    MaximumValue="81"
                    MinimumValue="18"
                    Type="Integer"
                    Text="*" />
            </div>

        </fieldset>
        <br />
        <fieldset>
            <legend>Contact Info</legend>

            <asp:ValidationSummary class="alert alert-dismissable alert-danger" ID="ValidationSummaryContactInfo" ValidationGroup="contactInfo" DisplayMode="BulletList" runat="server" />

            <div class="form-group">
                <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Email">Email</asp:Label>
                <div class="col-md-9">
                    <asp:TextBox ValidationGroup="contactInfo" class="form-control" ID="Email" runat="server" placeholder="Email" />
                </div>

                <asp:RequiredFieldValidator
                    ValidationGroup="contactInfo"
                    ID="EmailValidation"
                    runat="server"
                    ErrorMessage="Email is required!"
                    Text="*"
                    ControlToValidate="Email"
                    Display="Dynamic" />

                <asp:RegularExpressionValidator
                    ValidationGroup="contactInfo"
                    ID="ValidEmailValidation"
                    runat="server"
                    ErrorMessage="Invalid email!"
                    Text="*"
                    ValidationExpression="\b[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b"
                    ControlToValidate="Email" />
            </div>

            <div class="form-group">
                <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Address">Address</asp:Label>
                <div class="col-md-9">
                    <asp:TextBox ValidationGroup="contactInfo" class="form-control" ID="Address" runat="server" placeholder="Address" />
                </div>

                <asp:RequiredFieldValidator
                    ValidationGroup="contactInfo"
                    ID="AddressValidation"
                    runat="server"
                    ErrorMessage="Address is required!"
                    Text="*"
                    ControlToValidate="Address"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Phone">Phone</asp:Label>
                <div class="col-md-9">
                    <asp:TextBox ValidationGroup="contactInfo" class="form-control" ID="Phone" runat="server" placeholder="Phone" />
                </div>

                <asp:RequiredFieldValidator
                    ValidationGroup="contactInfo"
                    ID="PhoneValidation"
                    runat="server"
                    ErrorMessage="Phone is required!"
                    Text="*"
                    ControlToValidate="Phone"
                    Display="Dynamic" />

                <asp:RegularExpressionValidator
                    ValidationGroup="contactInfo"
                    ID="ValidPhoneValidation"
                    runat="server"
                    ErrorMessage="Invalid Phone!"
                    Text="*"
                    ValidationExpression="^\+?\d+(-\d+)*$"
                    ControlToValidate="Phone" />
            </div>


        </fieldset>
        <br />
        <div class="form-group">
            <div class="col-md-2">
                <asp:Button
                    class="btn btn-primary btn-block"
                    runat="server"
                    ID="Submit"
                    Text="Submit"
                    CausesValidation="true"
                    OnClick="Submit_Click" />
            </div>
        </div>
        </div>
    </div>
    </form>
</body>
</html>
