<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FileUploadDemo.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>File Upload Demo</title>
    <link href="//cdnjs.cloudflare.com/ajax/libs/kendo-ui-core/2014.1.416/styles/kendo.common.core.min.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/kendo-ui-core/2014.1.416/styles/kendo.default.min.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//cdn.kendostatic.com/2014.1.416/js/kendo.all.min.js"></script>
</head>
<body>
    <input name="uploaded" id="uploaded" type="file" runat="server" />

    <script>
        function onUpload(e) {
            var files = e.files;
            $.each(files, function () {
                if (this.extension.toLowerCase() != ".zip") {
                    alert("Only .zip files can be uploaded");
                    e.preventDefault();
                }
            });
        }

        $(document).ready(function () {
            $("#uploaded").kendoUpload({
                async: {
                    saveUrl: "Upload.aspx",
                    autoUpload: true,
                },
                upload: onUpload
            });
        });
    </script>
</body>
</html>