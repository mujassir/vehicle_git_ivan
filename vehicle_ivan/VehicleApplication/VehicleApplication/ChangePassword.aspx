﻿<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="VehicleApplication.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    Current Password
                </td>
                <td>
                    <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    New Password
                </td>
                <td>
                    <asp:TextBox ID="txtNew" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Confirm Password
                </td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Change Password" CssClass="btn" 
                        onclick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
