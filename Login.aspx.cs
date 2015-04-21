using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                // This is an unauthorized, authenticated request...
                Response.Redirect("~/UnauthorizedAccess.aspx");
        }
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {

        //Get the email Address Entered

        TextBox EmailTextBox = Login1.FindControl("Email") as TextBox;
        string email = EmailTextBox.Text.Trim();

        //Verify that the username/Password pair is valid

        if (Membership.ValidateUser(Login1.UserName, Login1.Password))
        {
            MembershipUser usrInfo = Membership.GetUser(Login1.UserName);
            if (usrInfo != null && string.Compare(usrInfo.Email, email, true) == 0)
            {
                e.Authenticated = true;
            }
            else
            {
                e.Authenticated = false;
            }
        }
        else
        {
            e.Authenticated = false;
        }

    }
    protected void Login1_LoginError(object sender, EventArgs e)
    {


        //Determine wy the user could not login
        Login1.FailureText = "Your Attempt was not Succesful. Please Try Again";

        // Does there exist a User account for this user?
        MembershipUser usrInfo = Membership.GetUser(Login1.UserName);
        if (usrInfo != null)
        {
            // Is this user locked out?
            if (usrInfo.IsLockedOut)
            {
                Login1.FailureText = "Your account has been locked out because of too many invalid login attempts. Please contact the administrator to have your account unlocked.";
            }
            else if (!usrInfo.IsApproved)
            {
                Login1.FailureText = "Your account has not yet been approved. You cannot login until an administrator has approved your account.";
            }
        }

    }
}