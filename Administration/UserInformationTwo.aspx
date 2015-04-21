<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserInformationTwo.aspx.cs" Inherits="Administration_UserInformationTwo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <h2>User Information</h2>
    <p>
        <asp:HyperLink ID="BackLink" runat="server" 
            NavigateUrl="~/Administration/ManageUsers.aspx">&lt;&lt; Back to User List</asp:HyperLink>
    </p>
    <table>
        <tr>
            <td class="tdLabel">Username:</td>
            <td><asp:Label runat="server" ID="UserNameLabel"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdLabel">Approved:</td>
            <td>
                <asp:CheckBox ID="IsApproved" runat="server" AutoPostBack="true" 
                    oncheckedchanged="IsApproved_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="tdLabel">Locked Out:</td>
            <td>
                <asp:Label runat="server" ID="LastLockoutDateLabel"></asp:Label>
                <br />
                <asp:Button runat="server" ID="UnlockUserButton" Text="Unlock User" 
                    onclick="UnlockUserButton_Click" />
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="StatusMessage" CssClass="Important" runat="server"></asp:Label>
    </p>
</asp:Content>

