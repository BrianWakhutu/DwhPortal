<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <tr>
        <td>
            <asp:PasswordRecovery ID="RecoverPwd" runat="server" 
                onsendingmail="RecoverPwd_SendingMail">
                     <MailDefinition BodyFileName="~/EmailTemplates/PasswordRecovery.txt">
        </MailDefinition>
            </asp:PasswordRecovery>
        </td>
    </tr>
 


</asp:Content>

