using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Administration_UserInformationTwo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string userName = Request.QueryString["user"];
            if (string.IsNullOrEmpty(userName))
                Response.Redirect("ManageUsers.aspx");

            MembershipUser user = Membership.GetUser(userName);
            if (user == null)
                Response.Redirect("ManageUsers.aspx");
            UserNameLabel.Text = user.UserName;
            IsApproved.Checked = user.IsApproved;
            if (user.LastLockoutDate.Year < 2000)
            {
                LastLockoutDateLabel.Text = string.Empty;

            }
            else
            {
                LastLockoutDateLabel.Text = user.LastLockoutDate.ToShortDateString();
            }
            UnlockUserButton.Enabled = user.IsLockedOut;
        }
    }
    protected void UnlockUserButton_Click(object sender, EventArgs e)
    {
        // Unlock the user account
        string userName = Request.QueryString["user"];
        MembershipUser usr = Membership.GetUser(userName);

        usr.UnlockUser();
        UnlockUserButton.Enabled = false;
        StatusMessage.Text = "The user account has been unlocked.";
    }
    protected void IsApproved_CheckedChanged(object sender, EventArgs e)
    {
        // Toggle the user's approved status
        string userName = Request.QueryString["user"];
        MembershipUser usr = Membership.GetUser(userName);
        usr.IsApproved = IsApproved.Checked;
        Membership.UpdateUser(usr);
        StatusMessage.Text = "The user's approved status has been updated.";
    }
}