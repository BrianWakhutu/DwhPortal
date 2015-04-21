<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdditonalUserInformation.aspx.cs" Inherits="AdditonalUserInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:Label ID="SettingsUpdatedMessage" runat="server" Text="Your Settings Have been Updated"
    EnableViewState ="false" Visible = "false"></asp:Label>

    <asp:DetailsView ID="UserProfile" runat="server" AutoGenerateRows="False" 
        DataKeyNames="UserId" DataSourceID="UserProfileDataSource" 
        DefaultMode="Edit" onitemupdated="UserProfile_ItemUpdated" >
        <Fields>
            <asp:BoundField DataField="HomeTown" HeaderText="Organisation" 
                SortExpression="HomeTown" />
            <asp:BoundField DataField="HomePageUrl" HeaderText="Organisation Url" 
                SortExpression="HomePageUrl" />
            <asp:BoundField DataField="Signature" HeaderText="Signature" 
                SortExpression="Signature" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="UserProfileDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SecurityTutorialsConnectionString %>" 
        onselecting="UserProfileDataSource_Selecting" 
        SelectCommand="SELECT [UserId], [HomeTown], [HomePageUrl], [Signature] FROM [UserProfiles] WHERE ([UserId] = @UserId)" 
        UpdateCommand="UPDATE UserProfiles SET
     HomeTown = @HomeTown,
     HomepageUrl = @HomepageUrl,
     Signature = @Signature
WHERE UserId = @UserId" >
        <SelectParameters>
            <asp:Parameter Name="UserId" Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="HomeTown" />
            <asp:Parameter Name="HomepageUrl" />
            <asp:Parameter Name="Signature" />
            <asp:Parameter Name="UserId" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

