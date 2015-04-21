using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisterUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatingUser(object sender, LoginCancelEventArgs e)
    {
        string trimmedUserName = RegisterMe.UserName.Trim();
        if (RegisterMe.UserName.Length != trimmedUserName.Length)
        {
            // Show the error message
            InvalidUserNameOrPasswordMessage.Text = "The username cannot contain leading or trailing spaces.";
            InvalidUserNameOrPasswordMessage.Visible = true;

            // Cancel the create user workflow
            e.Cancel = true;
        }
        else
        {
            // Username is valid, make sure that the password does not contain the username

            if (RegisterMe.Password.IndexOf(RegisterMe.UserName, StringComparison.OrdinalIgnoreCase) >= 0)
            {
                // Show the error message
                InvalidUserNameOrPasswordMessage.Text = "The username may not appear anywhere in the password.";
                InvalidUserNameOrPasswordMessage.Visible = true;
                // Cancel the create user workflow
                e.Cancel = true;
            }
        }
    }
    protected void RegisterMe_CreatedUser1(object sender, EventArgs e)
    {

    }
}