using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Permissions;

public partial class Roles_RoleBasedAuthorization : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindUserGrid();
        }
    }

    private void BindUserGrid() {
        MembershipUserCollection allUsers = Membership.GetAllUsers();
        UserGrid.DataSource = allUsers;
        UserGrid.DataBind();
    }
    protected void UserGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        UserGrid.EditIndex = -1;
        BindUserGrid();
    }
    [PrincipalPermission(SecurityAction.Demand, Role = "Administrators")]
    protected void UserGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string UserName = UserGrid.DataKeys[e.RowIndex].Value.ToString();

        Membership.DeleteUser(UserName);

        UserGrid.EditIndex = -1;
        BindUserGrid();
    }
    protected void UserGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        UserGrid.EditIndex = e.NewEditIndex;
        BindUserGrid();
    }

    [PrincipalPermission(SecurityAction.Demand, Role = "Administrators")]
    [PrincipalPermission(SecurityAction.Demand, Role = "Supervisors")]
    protected void UserGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (!Page.IsValid)
            return;
        string UserName = UserGrid.DataKeys[e.RowIndex].Value.ToString();

        TextBox EmailTextBox = UserGrid.Rows[e.RowIndex].FindControl("Email") as TextBox;
        TextBox CommentTextBox = UserGrid.Rows[e.RowIndex].FindControl("Comment") as TextBox;

        MembershipUser UserInfo = Membership.GetUser(UserName);
        UserInfo.Email = EmailTextBox.Text.Trim();
        UserInfo.Comment = CommentTextBox.Text.Trim();

        Membership.UpdateUser(UserInfo);

        UserGrid.EditIndex = -1;
        BindUserGrid();
    }
    protected void UserGrid_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != UserGrid.EditIndex)
        {
            // Programmatically reference the Edit and Delete LinkButtons
            LinkButton EditButton = e.Row.FindControl("EditButton") as LinkButton;
            LinkButton DeleteButton = e.Row.FindControl("DeleteButton") as LinkButton;

            EditButton.Visible = (User.IsInRole("Administrators") || User.IsInRole("Supervisors"));
            DeleteButton.Visible = User.IsInRole("Administrators");
        }
    }
}