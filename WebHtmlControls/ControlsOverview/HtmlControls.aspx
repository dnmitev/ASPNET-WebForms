<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HtmlControls.aspx.cs" Inherits="ControlsOverview.HtmlControls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HTML Server Controls</title>
</head>
<body>
    <form id="formRandomNumbers" runat="server">
        <div>
            <label for="lowerBound">Lower range bound:</label>
            <input type="number" min="1" max="1000" step="1" id="lowerBound" runat="server"/>
            <label for="upperBound">Upper range bound:</label>
            <input type="number" min="1" max="1000" step="1" id="upperBound" runat="server"/>
        </div>
        <div>
            <input id="SubmitBntn" type="button" runat="server" value="Submit" onserverclick="SubmitBtn_ServerClick"/>
        </div>
        <div>
            <h1 id="randomlyGeneratedNumber" runat="server"></h1>
        </div>
    </form>
</body>
</html>
