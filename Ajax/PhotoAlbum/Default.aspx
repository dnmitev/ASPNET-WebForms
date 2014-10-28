<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PhotoAlbum.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Photo Gallery</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/yeti/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="PhotoSlideShow" runat="server">
        <div class="jumbotron">
            <ajaxToolkit:ToolkitScriptManager ID="ScriptManager" runat="server">
            </ajaxToolkit:ToolkitScriptManager>

            <div class="image img-rounded">
                <asp:Image
                    ID="img1"
                    runat="server"
                    Width="400px"
                    ImageUrl="~/images/galena.jpg"
                    class="img-rounded" />
            </div>

            <ajaxToolkit:SlideShowExtender
                ID="SlideShowExtender1"
                runat="server"
                BehaviorID="SSBehaviorID"
                TargetControlID="img1"
                SlideShowServiceMethod="GetSlides"
                AutoPlay="true"
                ImageDescriptionLabelID="lblDesc"
                NextButtonID="btnNext"
                PreviousButtonID="btnPrev"
                PlayButtonID="btnPlay"
                PlayButtonText="Play"
                StopButtonText="Stop"
                Loop="true">
            </ajaxToolkit:SlideShowExtender>

            <div class="text-center">
                <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label><br />
                <asp:Button ID="btnPrev" runat="server" Text="Previous" class="btn btn-default"/>
                <asp:Button ID="btnPlay" runat="server" Text="" class="btn btn-info"/>
                <asp:Button ID="btnNext" runat="server" Text="Next" class="btn btn-default"/>
            </div>
        </div>
    </form>
    <script>
        (function () {
            $("#PhotoSlideShow").on("click", ".image", function (ev) {
                var attr = $("#img1").attr("src");

                window.open(attr, 'Popup', 'toolbar=no, location=yes, status=no, menubar=no,scrollbars=yes,resizable=no, width=500,height=750,left=430,top=23');

            });
        })();
    </script>
</body>
</html>
