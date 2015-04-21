<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegisterUser.aspx.cs" Inherits="RegisterUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   <h4>Register for an Account</h4>

    <asp:CreateUserWizard ID="RegisterMe" runat="server" 
        CancelDestinationPageUrl="~/Default.aspx" 
        ContinueDestinationPageUrl="~/Default.aspx" DisableCreatedUser="True" 
        DisplayCancelButton="True" LoginCreatedUser="False" 
        oncreatinguser="CreateUserWizard1_CreatingUser" 
        oncreateduser="RegisterMe_CreatedUser1" Width="334px" 
        CreateUserButtonText="Register" Height="126px">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterMe1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    <asp:Label ID="InvalidUserNameOrPasswordMessage" ForeColor="Red" runat="server" Text="" EnableViewState ="false"></asp:Label>



</asp:Content>

