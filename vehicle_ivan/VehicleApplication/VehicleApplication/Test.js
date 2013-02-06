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
        PhoneNumber: "'" + $("#txtPhone").val() + "'",
        City: $("#txtCity").val(),
        State: $("#txtState").val(),
        DeInstallRequired: document.getElementById("txtDeInstall").checked,
        InstallComplete: document.getElementById("txtInstallComplete").checked
    };
    var d = "Key=Save";
    d += "&record=" + JSON.stringify(record);
    d += "&files=" + JSON.stringify(files);
    $.ajax({
        url: "ManageDailyRecords.aspx",
        type: "POST",
        data: d,
        success: function (response) {
            oTable.fnDraw();
        }
    });
}
function ClearForm() {
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
    document.getElementById("txtDeInstall").checked = false;
    document.getElementById("txtInstallComplete").checked = false;
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
                $("#txtInstallScheduled").val(new Date(j.InstallScheduled).format('mm/dd/yyyy'));
                $("#txtInstallDate").val(new Date(j.InstallDate).format('mm/dd/yyyy'));
                document.getElementById("txtDeInstall").checked = j.DeInstallRequired;
                document.getElementById("txtInstallComplete").checked = j.InstallComplete;
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