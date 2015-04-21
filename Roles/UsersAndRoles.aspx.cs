using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Roles_UsersAndRoles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindUsersToUserList();
            BindRolesToList();
            CheckRolesForSelectedUser();
            DisplayUsersBelongingToRole();
        }
    }

    private void BindUsersToUserList()
    {
        MembershipUserCollection users = Membership.GetAllUsers();
        UserList.DataSource = users;
        UserList.DataBind();
    }

    private void BindRolesToList()
    {
        string[] roles = Roles.GetAllRoles();
        UsersRoleList.DataSource = roles;
        UsersRoleList.DataBind();

        RoleList.DataSource = roles;
        RoleList.DataBind();
    }
    private void CheckRolesForSelectedUser()
    {
        string selectedUserName = UserList.SelectedValue;
        string[] selectedUsersRoles = Roles.GetRolesForUser(selectedUserName);

        foreach (RepeaterItem rI in UsersRoleList.Items)
        {
            CheckBox RoleCheckBox = rI.FindControl("RoleCheckBox") as CheckBox;
            if (selectedUsersRoles.Contains<string>(RoleCheckBox.Text))
            {
                RoleCheckBox.Checked = true;
            }
            else
            {
                RoleCheckBox.Checked = false;
            }

        }
    }

    protected void UserList_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckRolesForSelectedUser();
    }
    protected void RoleCheckBox_CheckChanged(object sender, EventArgs e)
    {
        CheckBox RoleCheckBox = sender as CheckBox;

        string selectedUserName = UserList.SelectedValue;

        string roleName = RoleCheckBox.Text;

        if (RoleCheckBox.Checked)
        {
            Roles.AddUserToRole(selectedUserName, roleName);
            ActionStatus.Text = string.Format("User {0} was added to role {1}.", selectedUserName, roleName);
        }
        else
        {
            Roles.RemoveUserFromRole(selectedUserName, roleName);
            ActionStatus.Text = string.Format("User {0} was removed to role {1}.", selectedUserName, roleName);


        }
        CheckRolesForSelectedUser();
    }

    private void DisplayUsersBelongingToRole()
    {

        string selectedRoleName = RoleList.SelectedValue;

        string[] usersBelongingToRole = Roles.GetUsersInRole(selectedRoleName);

        RolesUserList.DataSource = usersBelongingToRole;
        RolesUserList.DataBind();
    }

    protected void RoleList_SelectedIndexChanged(object sender, EventArgs e)
    {
        DisplayUsersBelongingToRole();
    }
    protected void RolesUserList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {


        string selectedRoleName = RoleList.SelectedValue;

        Label UserNameLabel = RolesUserList.Rows[e.RowIndex].FindControl("UserNameLabel") as Label;

        Roles.RemoveUserFromRole(UserNameLabel.Text, selectedRoleName);

        DisplayUsersBelongingToRole();
        ActionStatus.Text = string.Format("User {0} was removed from role {1}.", UserNameLabel.Text, selectedRoleName);

        CheckRolesForSelectedUser();
    }
    protected void AddUserToRoleButton_Click(object sender, EventArgs e)
    {
        // Get the selected role and username 

        string selectedRoleName = RoleList.SelectedValue;
        string userNameToAddToRole = UserNameToAddToRole.Text;

        // Make sure that a value was entered 
        if (userNameToAddToRole.Trim().Length == 0)
        {
            ActionStatus.Text = "You must enter a username in the textbox.";
            return;
        }

        // Make sure that the user exists in the system 
        MembershipUser userInfo = Membership.GetUser(userNameToAddToRole);
        if (userInfo == null)
        {
            ActionStatus.Text = string.Format("The user {0} does not exist in the system.", userNameToAddToRole);

            return;
        }

        // Make sure that the user doesn't already belong to this role 
        if (Roles.IsUserInRole(userNameToAddToRole, selectedRoleName))
        {
            ActionStatus.Text = string.Format("User {0} already is a member of role {1}.", userNameToAddToRole, selectedRoleName);
            return;
        }

        // If we reach here, we need to add the user to the role 
        Roles.AddUserToRole(userNameToAddToRole, selectedRoleName);

        // Clear out the TextBox 
        UserNameToAddToRole.Text = string.Empty;

        // Refresh the GridView 
        DisplayUsersBelongingToRole();

        // Display a status message 

        ActionStatus.Text = string.Format("User {0} was added to role {1}.", userNameToAddToRole, selectedRoleName);


        CheckRolesForSelectedUser();
    }
}