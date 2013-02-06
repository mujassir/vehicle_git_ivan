
function ShowMessageJson(response) {
    var result = $.parseJSON(response);
    if (result == null) {
        ShowMessage(false, "There is some issue please contact administrator");

    }
    else {
        ShowMessage(result.Success, result.Data);
    }

}

function ShowMessage(success, data) {
    if (success)
        DrawMessage(data, "success");
    else
        DrawMessage(data, "error");
}

function DrawMessage(message, type) {
    $("#divMessage").html(message);
    $("#divMessage").attr("class", type);
    setTimeout("HideMessage()", 10000);
}

function HideMessage() {
    $("#divMessage").html("");
    $("#divMessage").attr("class", "");

}

function CanView() {
    var result = false;
    var js = $.parseJSON($("#divPageAction").html());
    if (js != null && js.CanView)
        result = true;
    return result;
}
function CanAdd() {
    var result = false;
    var js = $.parseJSON($("#divPageAction").html());
    if (js != null && js.CanAdd)
        result = true;
    return result;
}
function CanEdit() {
    var result = false;
    var js = $.parseJSON($("#divPageAction").html());
    if (js != null && js.CanEdit)
        result = true;
    return result;
}
function CanDelete() {
    var result = false;
    var js = $.parseJSON($("#divPageAction").html());
    if (js != null && js.CanDelete)
        result = true;
    return result;
}