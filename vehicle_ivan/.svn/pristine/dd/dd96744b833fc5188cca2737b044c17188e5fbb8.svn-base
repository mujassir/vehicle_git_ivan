<%@ Page Title="Manage Roles" Language="C#" MasterPageFile="~/SiteForm.master" AutoEventWireup="true"
    CodeBehind="ManageRoles.aspx.cs" Inherits="VehicleApplication.ManageRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
        <thead>
            <tr>
                <th style='width: 10px;'>
                </th>
                <th>
                    Role
                </th>
                <th style="width: 25px;">
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
    <div id='divdialog'>
        <input type="hidden" id='txtID' value='0' />
        <table>
            <tr>
                <td colspan='2' style='text-align: center;'>
                    <span class='error-label' id='lblError'></span>
                </td>
            </tr>
            <tr>
                <td>
                    Role Name
                </td>
                <td>
                    <input id='txtName' type="text" />
                </td>
            </tr>
        </table>
        <table id='tblModules' class="tablesorter">
            <thead>
                <tr>
                    <th>
                        SN
                    </th>
                    <th>
                        Module &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <input type="checkbox" id='chkAll' onchange='CheckAll(this.checked)' />
                        <label for='chkAll'>
                            All</label>
                    </th>
                    <th>
                        <input type="checkbox" id='chkViewAll' onchange='CheckColumn(this)' />
                        <label for='chkViewAll'>
                            View</label>
                    </th>
                    <th>
                        <input type="checkbox" id='chkAddAll' onchange='CheckColumn(this)' />
                        <label for='chkAddAll'>
                            Add</label>
                    </th>
                    <th>
                        <input type="checkbox" id='chkEditAll' onchange='CheckColumn(this)' />
                        <label for='chkEditAll'>
                            Edit</label>
                    </th>
                    <th>
                        <input type="checkbox" id='chkDeleteAll' onchange='CheckColumn(this)' />
                        <label for='chkDeleteAll'>
                            Delete</label>
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptModules" runat="server">
                    <ItemTemplate>
                        <tr id='tr<%#DataBinder.Eval (Container.DataItem, "ID") %>'>
                            <td>
                                <%# Container.ItemIndex + 1 %>
                                <input type="hidden" value='<%#DataBinder.Eval (Container.DataItem, "ID") %>' />
                            </td>
                            <td>
                                <a target="_blank" href='<%#DataBinder.Eval (Container.DataItem, "URL") %>' title='<%#DataBinder.Eval (Container.DataItem, "Title") %>'>
                                    <%#DataBinder.Eval (Container.DataItem, "Title") %>
                                </a>
                            </td>
                            <td>
                                <input type="checkbox" />
                            </td>
                            <td>
                                <input type="checkbox" />
                            </td>
                            <td>
                                <input type="checkbox" />
                            </td>
                            <td>
                                <input type="checkbox" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            oTable = $('#example').dataTable({
                bJQueryUI: true,
                "sPaginationType": "full_numbers",
                "bProcessing": true,
                "bServerSide": true,
                "sAjaxSource": "ManageRoles.aspx?key=GetDataTable",
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
                width: 600,
                start: "slide",
                title: "Role Detail",
                buttons: [
                            {
                                text: "Close",
                                click: function () { $(this).dialog("close"); }
                            },
                            {
                                text: "Save",
                                click: function () {
                                    Save();
                                    // $(this).dialog("close");
                                }
                            }
                        ]
            });
        });

        function ClearForm() {
            HideMessage();
            $("#txtID").val("0");
            $("#txtName").val("");
            $("#lblError").html("");
            $("#tblModules input[type='checkbox']").attr("checked", false);
        }

        function AddNew() {
            ClearForm();
            $("#divdialog").dialog("open");
        }
        function Save() {
            var roleID = $("#txtID").val();
            var actions = new Array();
            var i = 0;
            $("#tblModules tbody tr").each(function (e, i) {
                actions.push({
                    ID: 0,
                    RoleID: roleID,
                    ModuleID: $(this).find("input[type='hidden']").val(),
                    ModuleTitle: $(this).find("td:eq(1) a").attr("title"),
                    ModuleURL: $(this).find("td:eq(1) a").attr("href").toLowerCase(),
                    CanView: $(this).find("td:eq(2) input[type='checkbox']").attr("checked"),
                    CanAdd: $(this).find("td:eq(3) input[type='checkbox']").attr("checked"),
                    CanEdit: $(this).find("td:eq(4) input[type='checkbox']").attr("checked"),
                    CanDelete: $(this).find("td:eq(5) input[type='checkbox']").attr("checked")
                });
            });
            var role = {
                ID: roleID,
                Name: $("#txtName").val()
            };
            var d = "Key=Save";
            d += "&role=" + JSON.stringify(role);
            d += "&roleActions=" + JSON.stringify(actions);
            $.ajax({
                url: "ManageRoles.aspx",
                type: "POST",
                data: d,
                success: function (response) {
                    var j = $.parseJSON(response);

                    if (!j.Success) {
                        if (j.Data == "1")
                            $("#lblError").html("Role already exist");
                        else
                            ShowMessageJson(response);
                    }
                    else {
                        ShowMessageJson(response);
                        $("#divdialog").dialog("close");
                        oTable.fnDraw();
                    }
                }
            });
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
                url: "ManageRoles.aspx",
                type: "POST",
                data: d,
                success: function (response) {
                }
            });
        }

        function Delete(id) {
            HideMessage();
            if (confirm("Are you sure you want to delete ?")) {
                var d = "key=Delete";
                d += "&id=" + id;
                $.ajax({
                    url: "ManageRoles.aspx",
                    type: "POST",
                    data: d,
                    success: function (response) {
                        ShowMessageJson(response);
                        oTable.fnDraw();
                    }
                });
            }
        }

        function Edit(id) {
            var d = "key=GetByID";
            d += "&id=" + id;
            $.ajax({
                url: "ManageRoles.aspx",
                type: "POST",
                data: d,
                success: function (response) {
                    var j = $.parseJSON(response);
                    if (j != null) {
                        ClearForm();
                        $("#txtID").val(j.ID);
                        $("#txtName").val(j.Name);
                        for (var i = 0; i < j.RoleActions.length; i++) {
                            var ra = j.RoleActions[i];
                            var tr = $("#tr" + ra.ModuleID);
                            $(tr).find("td:eq(2) input[type='checkbox']").attr("checked", ra.CanView);
                            $(tr).find("td:eq(3) input[type='checkbox']").attr("checked", ra.CanAdd);
                            $(tr).find("td:eq(4) input[type='checkbox']").attr("checked", ra.CanEdit);
                            $(tr).find("td:eq(5) input[type='checkbox']").attr("checked", ra.CanDelete);
                        }
                    }
                }
            });
            $("#divdialog").dialog("open");
        }
        function CheckColumn(el) {
            var index = $(el).parent().index();
            $("#tblModules tbody tr").each(function (e, i) {

                $(this).find("td:eq(" + index + ") input[type='checkbox']").attr("checked", $(el).attr("checked"));
            });
        }
        function CheckAll(value) {
            $("#tblModules input[type='checkbox']").attr("checked", value);
        }
    </script>
</asp:Content>
