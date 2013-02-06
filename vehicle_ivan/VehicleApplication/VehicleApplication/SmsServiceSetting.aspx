<%@ Page Title="SMS Service Setting" Language="C#" MasterPageFile="~/SiteForm.master"
    AutoEventWireup="true" CodeBehind="SmsServiceSetting.aspx.cs" Inherits="VehicleApplication.SmsServiceSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    Refresh Time
                </td>
                <td>
                    <asp:TextBox ID="txtRefreshTime" runat="server"></asp:TextBox> &nbsp; minutes
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn" OnClick="Button1_Click" />
                </td>
            </tr>
            
        </table>
    </div>
</asp:Content>
