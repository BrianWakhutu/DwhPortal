<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RoleBasedAuthorization.aspx.cs" Inherits="Roles_RoleBasedAuthorization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            You are not logged into the sytem. Therefore you cannot edit or delete any user information.
        </AnonymousTemplate>
        <LoggedInTemplate>
            You are not a member of the supervisor or Administrator roles. 
            Therefore you cannot edit or delete any user information
        </LoggedInTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Administrators">
                <ContentTemplate>
                    As an Administrator, you may edit and delete user accounts.
                    Remember: With great power comes great responsibility!
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Supervisors">
                <ContentTemplate>
                    As a supervisor, you may edit users&#39; Email and Comment information 
                    Simply click the Edit button, make your changes, and then click update.
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>

    <asp:GridView ID="UserGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName"
        onrowcancelingedit="UserGrid_RowCancelingEdit" 
        onrowdeleting="UserGrid_RowDeleting" onrowediting="UserGrid_RowEditing" 
        onrowupdating="UserGrid_RowUpdating" onrowcreated="UserGrid_RowCreated">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" />
            <asp:BoundField DataField="LastLoginDate" DataFormatString="{0:d}" 
                HeaderText="Last Login" HtmlEncode="False" ReadOnly="True" />
            <asp:TemplateField HeaderText="Email">
                <EditItemTemplate>
           <asp:TextBox runat="server" ID="Email" Text='<%# Bind("Email") %>'></asp:TextBox>    

          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"    
               ControlToValidate="Email" Display="Dynamic"    
               ErrorMessage="You must provide an email address." 
               SetFocusOnError="True">*</asp:RequiredFieldValidator>    

          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"    
               ControlToValidate="Email" Display="Dynamic"    
               ErrorMessage="The email address you have entered is not valid. Please fix 
               this and try again."    
               SetFocusOnError="True"    

               ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*
          </asp:RegularExpressionValidator>    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Comment" >
             <ItemTemplate>    
          <asp:Label runat="server" ID="Label2" Text='<%# Eval("Comment") %>'></asp:Label>    

     </ItemTemplate>    
     <EditItemTemplate>    
          <asp:TextBox runat="server" ID="Comment" TextMode="MultiLine"
               Columns="40" Rows="4" Text='<%# Bind("Comment") %>'>

          </asp:TextBox>    
     </EditItemTemplate>   
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ValidationSummary ID="ValidationSummary1"
               runat="server"
               ShowMessageBox="True"
               ShowSummary="False" />
</asp:Content>


