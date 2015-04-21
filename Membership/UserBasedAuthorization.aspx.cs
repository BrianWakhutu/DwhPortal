using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Permissions;
using System.IO;

public partial class Membership_UserBasedAuthorization : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string appPath = Request.PhysicalApplicationPath;
            DirectoryInfo dirInfo = new DirectoryInfo(appPath);

            FileInfo[] files = dirInfo.GetFiles();
            FilesGrid.DataSource = files;




            string userName = User.Identity.Name;
            if (string.Compare(userName, "shem", true) == 0)
            {
                FilesGrid.Columns[1].Visible = true;
            }
            else
            {
                FilesGrid.Columns[1].Visible = false;
            }



            FilesGrid.DataBind();
        }
    }
    [PrincipalPermission(SecurityAction.Demand, Authenticated = true)]
    protected void FilesGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        string fullFileName = FilesGrid.SelectedValue.ToString();
        string contents = File.ReadAllText(fullFileName);

        TextBox FileContentsTextBox = LoginViewForFileContentsTextBox.FindControl("FileContents") as TextBox;
        FileContentsTextBox.Text = contents;
        /// FileContents.Text = contents;
    }
    protected void FilesGrid_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }
    [PrincipalPermission(SecurityAction.Demand, Name = "shem")]
    protected void FilesGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TextBox FileContentsTextBox = LoginViewForFileContentsTextBox.FindControl("FileContents") as TextBox;


        string fullFillName = FilesGrid.DataKeys[e.RowIndex].Value.ToString();
        FileContentsTextBox.Text = string.Format("You have opted to delete {0}.", fullFillName);

        //File.Delete(fullFillName);
    }
}