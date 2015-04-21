<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <tr>
        <td>
            <asp:ChangePassword ID="ChangePwd" runat="server" 
                onchangedpassword="ChangePwd_ChangedPassword">
                   <MailDefinition BodyFileName="~/EmailTemplates/ChangePassword.txt" 
            IsBodyHtml="True" Subject="Your password has Changed!">
        </MailDefinition>
            </asp:ChangePassword>
        </td>
    </tr>
   
</asp:Content>

