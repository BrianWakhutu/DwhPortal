<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserInformation.aspx.cs" Inherits="Administration_UserInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td class="tdLabel">Username:</td>
            <td><asp:Label runat="server" ID="UserNameLabel"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdLabel">Account Created:</td>
            <td><asp:Label runat="server" ID="CreationDateLabel"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdLabel">Password Last Changed:</td>
            <td><asp:Label runat="server" ID="LastPasswordChangedDateLabel"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="tdLabel">New Password:</td>
            <td><asp:TextBox ID="NewPassword1" TextMode="Password" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdLabel">Confirm New Password:</td>
            <td><asp:TextBox ID="NewPassword2" TextMode="Password" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="PwdCompareValidator" runat="server" 
                    ControlToCompare="NewPassword1" ControlToValidate="NewPassword2" 
                    Display="Dynamic" ErrorMessage="The entered password values do not match." Text="*" SetFocusOnError="False"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Label ID="StatusMessage" CssClass="Important" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Button ID="UpdateUser" runat="server" Text="Update User" 
                    onclick="UpdateUser_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="CancelUpdate" CausesValidation="false" runat="server" 
                    Text="Cancel" onclick="CancelUpdate_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

