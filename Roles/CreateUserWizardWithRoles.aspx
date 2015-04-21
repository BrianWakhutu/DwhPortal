<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateUserWizardWithRoles.aspx.cs" Inherits="Roles_CreateUserWizardWithRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <h4 style="height: 18px; width: 417px">Create a User Account (with Roles!)</h4>
    
    <asp:CreateUserWizard ID="RegisterUserWithRoles" runat="server" 
        ContinueDestinationPageUrl="~/Default.aspx" 
        onactivestepchanged="RegisterUserWithRoles_ActiveStepChanged" 
        LoginCreatedUser="False" Width="475px">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:WizardStep ID="SpecifyRolesStep" runat="server" StepType="Step" 
                Title="Specify Roles" AllowReturn="False">
                <asp:CheckBoxList ID="RoleList" runat="server">
                </asp:CheckBoxList>
            </asp:WizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>

