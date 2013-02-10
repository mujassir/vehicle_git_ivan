<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VehicleApplication.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>Admin Login</title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="Styles/general.css" rel="stylesheet" type="text/css" />
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="CssMessage/MessageStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css" media="screen">
        .dataTables_info
        {
            padding-top: 0;
        }
        .dataTables_paginate
        {
            padding-top: 0;
        }
        .css_right
        {
            float: right;
        }
        #example_wrapper .fg-toolbar
        {
            font-size: 0.8em;
        }
        #theme_links span
        {
            float: left;
            padding: 2px 10px;
        }
        .page
        {
            height: 280px;
            margin: 50px auto 0;
            width: 400px;
        }
        .bluebar .corner
        {
            margin-top: -3px;
        }
        .headerTop
        {
            border-bottom: 1px Solid #F08B00;
            margin-bottom: 50px;
        }
        .bluebar
        {
            padding-top: 5px;
        }
        input[type='text'], input[type='password']
        {
            background-color: #FFFFFF;
            border: 1px solid #CCCCCC;
            color: #584C3F;
            font-family: Arial,Calibri;
            font-size: 11px;
            height: 25px;
            width: 100%;
        }
        .main
        {
            padding: 12px;
        }
        .footer
        {
            margin-top: 100px;
        }
        #divLoader
        {
            height: 30px;
            float: right;
            padding-right: 20px;
            padding-top: 5px;
        }
    </style>
    <script type="text/javascript">
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(window.location.search);
            if (results == null)
                return "";
            else
                return decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        $(document).ready(function () {

            $("#txtPassword").keypress(function (e) {
                var code = (e.keyCode ? e.keyCode : e.which);
                if (code == 13) { //Enter keycode
                    LoginUser();
                }
            });
            $("#txtUserName").keypress(function (e) {
                var code = (e.keyCode ? e.keyCode : e.which);
                if (code == 13) { //Enter keycode
                    LoginUser();
                }
            });
        });
        function LoginUser() {
            ShowLoader("", true);
            var un = document.getElementById("txtUserName").value;
            var pa = document.getElementById("txtPassword").value;
            if (un == "") {
                ShowMessage("Please enter username", false);
            }
            else if (pa == "") {
                ShowMessage("Please enter password", false);
            }
            else {
                ShowLoader("<img src='images/ajax-loader_w.gif' /> Authenticating...", true);
                var d = "key=LoginUser";
                d += "&UserName=" + un;
                d += "&Password=" + pa;
                $.ajax({
                    type: "POST",
                    url: "Login.aspx",
                    data: d,
                    timeout: 9000,
                    error: function (e) {
                        ShowMessage("Server is not responding", false);
                    },
                    success: function (d) {
                        var j = jQuery.parseJSON(d);
                        if (j != null) {
                            if (j.Success) {
                                var returnURL = getParameterByName("ReturnURL") + "";
                                if (returnURL != "")
                                    window.location.href = returnURL;
                                else
                                    window.location.href = "ManageDailyRecords.aspx";
                            }
                            else {
                                ShowLoader("", true);
                                ShowMessage(j.Data, false);
                            }
                        }
                        else {
                            ShowMessage("Server is not responding", false);
                        }
                    }
                });
            }
        }
        function ShowMessage(msg, isSuccess) {
            if (isSuccess)
                DrawMessage(msg, "success");
            else
                DrawMessage(msg, "error");
        }

        function DrawMessage(message, type) {
            $("#divMessage").html(message);
            $("#divMessage").attr("class", type);
            setTimeout("HideMessage()", 10000);
        }
        function ShowLoader(msg, isSuccess) {
            if (isSuccess)
                document.getElementById("divLoader").innerHTML = "<span style='color:Green'>" + msg + "</span>";
            else
                document.getElementById("divLoader").innerHTML = "<span style='color:Red'>" + msg + "</span>";
        }
        
    </script>
</head>
<body>
    <div class="headerTop">
        <div class="wrap">
            <div class="logo">
                <a href="javascript:void(0);">
                    <img alt="" src="images/logo.png">
                </a>
            </div>
        </div>
        <!-- Wrap End -->
    </div>
    <div class="page">
        <div class='bluebar'>
            <h1>
                Login</h1>
            <img src="images/corner_blue.png" class='corner' />
        </div>
        <div style="clear: both;">
        </div>
        <div id='divMessage'>
        </div>
        <div class='main'>
            Username
            <br />
            <input type="text" id='txtUserName' />
            <br />
            Password
            <br />
            <input type="password" id='txtPassword' />
            <br />
            <br />
            <input type="button" class="btn" value='Login' onclick='LoginUser()' />
            &nbsp; &nbsp;
            <div id='divLoader'>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="footer">
        Copyright © 2013 / AIM Technical Consultants
    </div>
</body>
</html>
