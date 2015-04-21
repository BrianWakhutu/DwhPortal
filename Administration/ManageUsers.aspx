<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Administration_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="FilteringUI" runat="server" 
        onitemcommand="FilteringUI_ItemCommand">
      <ItemTemplate>
          <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Container.DataItem %>'
 CommandName='<%# Container.DataItem %>'></asp:LinkButton>
      </ItemTemplate>
      <SeparatorTemplate></SeparatorTemplate>
    </asp:Repeater>
    <asp:GridView ID="UserAccounts" runat="server" AutoGenerateColumns="False">
        <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="UserName" 
                    DataNavigateUrlFormatString="UserInformationtwo.aspx?user={0}" Text="Manage" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:CheckBoxField HeaderText="Approved?" DataField="IsApproved" />
            <asp:CheckBoxField HeaderText="Locked Out?" DataField="IsLockedOut" />
            <asp:CheckBoxField HeaderText="Online?" DataField="IsOnline" />
            <asp:BoundField DataField="Comment" HeaderText="Comment" />
        </Columns>
    </asp:GridView>

    <p>
 <asp:LinkButton ID="lnkFirst" runat="server" onclick="lnkFirst_Click"> First</asp:LinkButton> |
 <asp:LinkButton ID="lnkPrev" runat="server" onclick="lnkPrev_Click">  Prev</asp:LinkButton>|
 <asp:LinkButton ID="lnkNext" runat="server" onclick="lnkNext_Click">Next  </asp:LinkButton>|
 <asp:LinkButton ID="lnkLast" runat="server" onclick="lnkLast_Click">Last  </asp:LinkButton>
</p>
</asp:Content>

