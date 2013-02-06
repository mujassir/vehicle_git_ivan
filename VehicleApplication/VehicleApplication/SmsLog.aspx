<%@ Page Title="SMS Log" Language="C#" MasterPageFile="~/SiteForm.master" AutoEventWireup="true"
    CodeBehind="SmsLog.aspx.cs" Inherits="VehicleApplication.SmsLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <legend>Windows Service Configuration</legend>
        <table style='width: 100%;'>
            <tr>
                <td>
                    Last Refresh Time:
                </td>
                <td>
                    <b>
                        <asp:Literal ID="lblLastRefreshDate" runat="server"></asp:Literal>
                    </b>
                </td>
                <td>
                    <asp:Button ID="btnRefresh" runat="server" Text="Refresh Log" CssClass="btn" OnClick="btnRefresh_Click" />
                </td>
                <td rowspan="2">
                    <table>
                        <tr>
                            <td style='width: 50%;'>
                                <asp:Image ID='imgStopped' ImageUrl="images/ajax-loader.jpg" runat="server" />
                                <asp:Image ID='imgRunning' ImageUrl="images/ajax-loader.gif" runat="server" />
                            </td>
                            <td>
                                SMS Windows Service:
                                <br />
                                <h2>
                                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                </h2>
                                <br />
                                <asp:Button ID="btnStop" runat="server" Text="Stop" CssClass="btn" OnClick="btnStop_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    Refresh Time
                </td>
                <td>
                    <asp:TextBox ID="txtRefreshTime" runat="server"></asp:TextBox>
                    &nbsp; minutes
                </td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" OnClick="btnSave_Click" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    </fieldset>
    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
        <thead>
            <tr>
                <th style="width: 20px;">
                </th>
                <th>
                    Date
                </th>
                <th>
                    Direction
                </th>
                <th>
                    From
                </th>
                <th>
                    To
                </th>
                <th style="width: 30%">
                    Body
                </th>
                <th style="width: 50px;">
                    Status
                </th>
                <th style="width: 20px;">
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="4">
                    Proccessing
                </td>
            </tr>
        </tbody>
    </table>
    <script type="text/javascript">
        $(document).ready(function () {
            oTable = $('#example').dataTable({
                bJQueryUI: true,
                "sPaginationType": "full_numbers",
                "bProcessing": true,
                "bServerSide": true,
                "sAjaxSource": "SmsLog.aspx?key=GetDataTable",
                "aaSorting": [[0, "desc"]],
                "fnDrawCallback": function () {
                    if ($("#chkAll").attr("id") + "" == "null") {
                        var html = "<input  style='margin-left:30px;' type='checkbox' id='chkAll'  onchange='IncludeInactiveSMS(this.checked)' /> <label for='chkAll' >Include Inactive SMS(All)</label>";
                        $('#example_length').append(html);
                    }
                }
            });
        });

        function Delete(id) {
            HideMessage();
            if (confirm("Are you sure you want to delete ?")) {
                var d = "key=Delete";
                d += "&id=" + id;
                $.ajax({
                    url: "SmsLog.aspx",
                    type: "POST",
                    data: d,
                    success: function (response) {
                        ShowMessageJson(response);
                        oTable.fnDraw();
                    }
                });
            }
        }
        function ChangeStatus(el) {
            var id = $(el).attr("data-id");
            var status = $(el).attr("status-id");
            var img = "";
            var title = "";
            if (status == "0") {
                status = "1";
                img = "images/status-offline.png";
                title = "Click to make it active";
            }
            else {
                status = "0";
                img = "images/status-online.png";
                title = "Click to make it inactive";
            }
            $(el).attr("status-id", status);
            $(el).attr("src", img);
            $(el).attr("title", title);
            var d = "key=ChangeStatus";
            d += "&id=" + id;
            d += "&status=" + status;
            $.ajax({
                url: "SmsLog.aspx",
                type: "POST",
                data: d,
                success: function (response) {
                }
            });
        }
        function IncludeInactiveSMS(chk) {
            var d = "key=IncludeInactiveSMS";
            d += "&IncludeInactiveSMS=" + chk;
            $.ajax({
                url: "SmsLog.aspx",
                type: "POST",
                data: d,
                success: function (response) {
                    oTable.fnDraw();
                }
            });
        }
    </script>
</asp:Content>
