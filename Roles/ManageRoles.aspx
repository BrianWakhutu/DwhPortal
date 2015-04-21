<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeFile="ManageRoles.aspx.cs" Inherits="Roles_ManageRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <tr>
   
        <td>
        Create New Role:
   <asp:TextBox ID="RoleName" runat="server"></asp:TextBox>
   <br />
<asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" 
        onclick="CreateRoleButton_Click" />
        <br />
    <asp:GridView ID="RoleList" runat="server" AutoGenerateColumns="False" 
        onrowdeleting="RoleList_RowDeleting">
    <Columns> 
      <asp:TemplateField HeaderText = "Role">
        <ItemTemplate>
                  <asp:Label runat="server" ID="RoleNameLabel" Text='<%# Container.DataItem %>'>'></asp:Label>
        </ItemTemplate>

    </asp:TemplateField>
        <asp:CommandField DeleteText="Delete Role" ShowDeleteButton="True" />
    </Columns>
 
    </asp:GridView>
        </td>
    </tr>
</asp:Content>

