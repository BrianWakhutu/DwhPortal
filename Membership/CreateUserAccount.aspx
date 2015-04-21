<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateUserAccount.aspx.cs" Inherits="Membership_CreateUserAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:CreateUserWizard ID="RegisterUser" runat="server" 
        CancelDestinationPageUrl="~/Default.aspx" 
        ContinueDestinationPageUrl="~/Default.aspx" DisableCreatedUser="True" 
        DisplayCancelButton="True" LoginCreatedUser="False" 
        oncreatinguser="CreateUserWizard1_CreatingUser" 
        oncreateduser="RegisterUser_CreatedUser1">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUser1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    <asp:Label ID="InvalidUserNameOrPasswordMessage" ForeColor="Red" runat="server" Text="" EnableViewState ="false"></asp:Label>

</asp:Content>

