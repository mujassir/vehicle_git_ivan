﻿<%@ Page Title="Manage Daily Records" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ManageDailyRecords.aspx.cs" Inherits="VehicleApplication.ManageDailyRecords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="container">
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
            <thead>
                <tr>
                    <th style="width: 30px;">
                    </th>
                    <%-- <th>
                        HISTORIC ARC
                    </th>--%>
                    <th>
                        SBC VIN
                    </th>
                    <%-- <th>
                        UUID
                    </th>
                    <th>
                        TRUCK ID
                    </th>--%>
                    <th>
                        Install Type
                    </th>
                    <th>
                        Serial No.
                    </th>
                    <th>
                        Phone No.
                    </th>
                    <th style='width: 220px;'>
                        Message
                    </th>
                    <th>
                        City
                    </th>
                    <th>
                        State
                    </th>
                    <th>
                        Install Date
                    </th>
                    <th style="width: 55px;">
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
    </div>
    <div id='divSmsLogDialog'>
        <table id='tblSmsLog' class='tablesorter' style='width: 100%;'>
            <thead>
                <tr>
                    <th style='width: 10px'>
                        SN
                    </th>
                    <th>
                        Date
                    </th>
                    <th style="width: 70%">
                        Message
                    </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <div id='divdialog'>
        <table style='width: 100%;'>
            <tr>
                <td valign='top'>
                    <table>
                        <tr>
                            <td>
                                HISTORIC ARC
                            </td>
                            <td>
                                <input type="text" id='txtHistoricArc' class="txt" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="hidden" id='txtID' />
                                SBC VIN
                            </td>
                            <td>
                                <input type="text" id="txtSBC" class="txt" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                UUID
                            </td>
                            <td>
                                <input type="text" id="txtUUID" class="txt" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                TRUCK ID
                            </td>
                            <td>
                                <input type="text" id="txtTruckID" class="txt" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Serial Number
                            </td>
                            <td>
                                <input type="text" id="txtSerial" class="txt" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone Number
                            </td>
                            <td>
                                <input type="text" id="txtPhone" class="txt" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Install Type
                            </td>
                            <td>
                                <select id="txtInstallType" class="txt">
                                    <option value="Calamp">Calamp</option>
                                    <option value="IVD">IVD</option>
                                    <option value="IVD-RFID">IVD-RFID</option>
                                    <option value="Service">Service</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Install City
                            </td>
                            <td>
                                <input type="text" id="txtCity" class="txt" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Install State
                            </td>
                            <td>
                                <input type="text" id="txtState" class="txt" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="checkbox" id="txtDeInstall" />
                                <label for='txtDeInstall'>
                                    De-Install Required</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="checkbox" id="txtInstallComplete" />
                                <label for='txtInstallComplete'>
                                    Complete</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Install Scheduled
                            </td>
                            <td>
                                <input type="text" id='txtInstallScheduled' class="txt datepicker" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Date of install / repair
                            </td>
                            <td>
                                <input type="text" id='txtInstallDate' class="txt datepicker" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="checkbox" id="txtVNA" />
                                <label for='txtVNA'>
                                    VNA</label>
                                &nbsp;
                                <input type="checkbox" id="txtCleanOut" />
                                <label for='txtCleanOut'>
                                    Clean Out</label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign='top' style='width: 50%;'>
                    <fieldset>
                        <legend>Comments </legend>
                        <textarea id='txtComments' class="txtarea"></textarea>
                    </fieldset>
                    <fieldset>
                        <legend>Attachments</legend>
                        <div id="filediv">
                            <input type="file" name="file" multiple />
                            <button>
                                Upload</button>
                            <div>
                                Upload files</div>
                        </div>
                        <div class="divFiles">
                            <table id="files_QU">
                            </table>
                            <table id="files_Q" class="tablesorter">
                                <thead>
                                    <tr>
                                        <th style="width: 70%">
                                            File
                                        </th>
                                        <th style="width: 10%">
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" charset="utf-8">

        $('#MainFrom').fileUploadUI({
            url: "FileUpload.ashx",
            method: 'POST',
            uploadTable: $('#files_QU'),
            downloadTable: $('#files_Q'),
            buildUploadRow: function (files, index) {
                return $('<tr><td>' + files[index].name + '<\/td>' +
                            '<td class="file_upload_progress"><div><\/div><\/td>' +
                            '<td class="file_upload_cancel">' +
                            '<button class="ui-state-default ui-corner-all" title="Cancel">' +
                            '<span class="ui-icon ui-icon-cancel">Cancel<\/span>' +
                            '<\/button><\/td><\/tr>');
            },
            buildDownloadRow: function (file) {

                //                d += "&name=" + file.name;
                //                d += "&url=" + file.url;
                //                d += "&type=" + file.type;
                //                d += "&size=" + file.size;
                //                d += "&extension=" + file.ext;
                var html = "<tr><td><a  target='_blank' class='file' href='TempFiles/" + file.url + "'>" + file.name + "<input type='hidden' class='hdurl' value='" + file.url + "' ></td><td><img class='icon' src='images/delete.png' title='Delete' onclick=\"$(this).parent().parent().remove();\" /></td></tr>";
                $("#files_Q tbody").prepend(html);
            }
        });

        $(document).ready(function () {                       // Start of Document ready function
            $(".datepicker").datepicker();
            oTable = $('#example').dataTable({
                bJQueryUI: true,
                "sPaginationType": "full_numbers",
                "bProcessing": true,
                "bServerSide": true,
                "sAjaxSource": "ManageDailyRecords.aspx?key=GetDataTable",
                "fnDrawCallback": function () {
                    if (CanAdd()) {
                        if ($("#btnAddNewRow").attr("id") + "" == "null") {
                            var html = "<button type='button' class='add_row ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ui-state-hover' id='btnAddNewRow' onclick='AddNew()'><span class='ui-button-icon-primary ui-icon ui-icon-plus'></span><span class='ui-button-text'>Add...</span></button>";
                            $('#example_length').append(html);
                        }
                    }
                }
            }).fnSetFilteringDelay(600);

            $("#divdialog").dialog({
                autoOpen: false,
                draggable: true,
                modal: true,
                resizable: true,
                start: "slide",
                title: "Record Detail",
                height: 440,
                width: 750,
                buttons: [
                    {
                        text: "Close",
                        click: function () { $(this).dialog("close"); }
                    },
                    {
                        text: "Save",
                        click: function () {
                            Save();
                            $(this).dialog("close");
                        }
                    },
                    {
                        text: "Send SMS",
                        click: function () {
                            SendSMS();

                        }
                    }
                ]
            });
            $("#divSmsLogDialog").dialog({
                autoOpen: false,
                draggable: true,
                modal: true,
                resizable: true,
                start: "slide",
                title: "SMS Log",
                height: 240,
                width: 600,
                buttons: [
                    {
                        text: "Close",
                        click: function () { $(this).dialog("close"); }
                    }
                ]
            });
        });                                                           // End of Document ready function

        function Delete(id) {
            HideMessage();

            if (confirm("Are you sure you want to delete ?")) {
                var d = "key=Delete";
                d += "&id=" + id;
                $.ajax({
                    url: "ManageDailyRecords.aspx",
                    type: "POST",
                    data: d,
                    success: function (response) {
                        ShowMessageJson(response);
                        oTable.fnDraw();
                    }
                });
            }
        }
        function Save() {

            var files = new Array();
            var i = 0;
            $("#files_Q tbody tr").each(function (index, element) {
                files[i++] = {
                    DailyRecordID: 0,
                    Name: $(this).find("td").text(),
                    URL: $(this).find("td .hdurl").val()
                };
            });
            var record = {
                ID: $("#txtID").val(),
                HistoricArc: $("#txtHistoricArc").val(),
                SBC_VIN: $("#txtSBC").val(),
                UUID: $("#txtUUID").val(),
                TruckID: $("#txtTruckID").val(),
                InstallType: $("#txtInstallType").val(),
                InstallScheduled: $("#txtInstallScheduled").val(),
                InstallDate: $("#txtInstallDate").val(),
                SerialNumber: $("#txtSerial").val(),
                PhoneNumber: $("#txtPhone").val(),
                City: $("#txtCity").val(),
                State: $("#txtState").val(),
                DeInstallRequired: document.getElementById("txtDeInstall").checked,
                InstallComplete: document.getElementById("txtInstallComplete").checked,
                Comments: $("#txtComments").val(),
                VNA: document.getElementById("txtVNA").checked,
                CleanOut: document.getElementById("txtCleanOut").checked
            };
            var d = "Key=Save";
            d += "&record=" + JSON.stringify(record);
            d += "&files=" + JSON.stringify(files);
            $.ajax({
                url: "ManageDailyRecords.aspx",
                type: "POST",
                data: d,
                success: function (response) {
                    ShowMessageJson(response);
                    oTable.fnDraw();
                }
            });
        }

        function SendSMS() {

            var record = {
                ID: $("#txtID").val(),
                HistoricArc: $("#txtHistoricArc").val(),
                SBC_VIN: $("#txtSBC").val(),
                UUID: $("#txtUUID").val(),
                TruckID: $("#txtTruckID").val(),
                InstallType: $("#txtInstallType").val(),
                InstallScheduled: $("#txtInstallScheduled").val(),
                InstallDate: $("#txtInstallDate").val(),
                SerialNumber: $("#txtSerial").val(),
                PhoneNumber: $("#txtPhone").val(),
                City: $("#txtCity").val(),
                State: $("#txtState").val(),
                DeInstallRequired: document.getElementById("txtDeInstall").checked,
                InstallComplete: document.getElementById("txtInstallComplete").checked
            };
            var d = "Key=SendSMS";
            d += "&record=" + JSON.stringify(record);
            $.ajax({
                url: "ManageDailyRecords.aspx",
                type: "POST",
                data: d,
                success: function (response) {
                    ShowMessageJson(response);
                }
            });
        }

        function ClearForm() {
            HideMessage();
            $("#txtID").val("0");
            $("#txtHistoricArc").val("");
            $("#txtSBC").val("");
            $("#txtUUID").val("");
            $("#txtTruckID").val("");
            $("#txtInstallType").val("");
            $("#txtInstallScheduled").val("");
            $("#txtInstallDate").val("");
            $("#txtCity").val("");
            $("#txtState").val("");
            $("#txtSerial").val("");
            $("#txtPhone").val("");
            $("#txtComments").val("");

            document.getElementById("txtDeInstall").checked = false;
            document.getElementById("txtInstallComplete").checked = false;
            document.getElementById("txtVNA").checked = false;
            document.getElementById("txtCleanOut").checked = false;
        }

        function AddNew(id) {
            ClearForm();
            $("#divdialog").dialog("open");
            $("#files_Q tbody").html("");
        }
        function Edit(id) {
            $("#files_Q tbody").html("");
            var d = "key=GetByID";
            d += "&id=" + id;
            $.ajax({
                url: "ManageDailyRecords.aspx",
                type: "POST",
                data: d,
                success: function (response) {
                    var j = $.parseJSON(response);
                    if (j != null) {
                        ClearForm();
                        $("#txtID").val(j.ID);
                        $("#txtHistoricArc").val(j.HistoricArc);
                        $("#txtSBC").val(j.SBC_VIN);
                        $("#txtUUID").val(j.UUID);
                        $("#txtTruckID").val(j.TruckID);
                        $("#txtInstallType").val(j.InstallType);
                        $("#txtSerial").val(j.SerialNumber);
                        $("#txtPhone").val(j.PhoneNumber);
                        $("#txtCity").val(j.City);
                        $("#txtState").val(j.State);
                        $("#txtComments").val(j.Comments);

                        $("#txtInstallScheduled").val(new Date(j.InstallScheduled).format('mm/dd/yyyy'));
                        $("#txtInstallDate").val(new Date(j.InstallDate).format('mm/dd/yyyy'));
                        document.getElementById("txtDeInstall").checked = j.DeInstallRequired;
                        document.getElementById("txtInstallComplete").checked = j.InstallComplete;
                        document.getElementById("txtVNA").checked = j.VNA;
                        document.getElementById("txtCleanOut").checked = j.CleanOut;
                        for (var i = 0; i < j.DailyRecordFiles.length; i++) {
                            var file = j.DailyRecordFiles[i];
                            var html = "<tr><td><a target='_blank' class='file' href='Attachments/" + file.URL + "'>" + file.Name + "</a><input type='hidden' class='hdurl' value='" + file.URL + "' ></td><td><img class='icon' src='images/delete.png' title='Delete' onclick=\"$(this).parent().parent().remove();\" /></td></tr>";
                            $("#files_Q tbody").prepend(html);
                        }
                    }
                }
            });
            $("#divdialog").dialog("open");
        }

        function SmsLog(phone) {
            $("#divSmsLogDialog").dialog("open");

            var d = "key=GetSmsLog";
            d += "&PhoneNumber=" + phone;
            $.ajax({
                url: "ManageDailyRecords.aspx",
                type: "POST",
                data: d,
                success: function (response) {
                    $("#tblSmsLog > tbody").html(response);
                }
            });

        }

    </script>
</asp:Content>
