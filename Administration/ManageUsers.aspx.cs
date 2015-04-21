using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Administration_ManageUsers : System.Web.UI.Page
{

    private int PageIndex
    {
        get
        {
            object o = ViewState["PageIndex"];
            if (o == null)
                return 0;
            else
                return (int)0;
        }
        set
        {
            ViewState["PageIndex"] = value;
        }
    }

    private int PageSize
    {
        get
        {
            return 3;
        }
    }

    private string UsernameToMatch
    {
        get
        {
            object o = ViewState["UsernameToMatch"];
            if (o == null)
                return string.Empty;
            else
                return (string)o;
        }
        set
        {
            ViewState["UsernameToMatch"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindUserAccounts();
        BindFilteringUI();
    }

    private void BindUserAccounts()
    {
        int totalRecords;
        UserAccounts.DataSource = Membership.FindUsersByName(this.UsernameToMatch + "%", this.PageIndex, this.PageSize, out totalRecords);
        UserAccounts.DataBind();

        bool visitingFirstPage = (this.PageIndex == 0);
        lnkFirst.Enabled = !visitingFirstPage;
        lnkPrev.Enabled = !visitingFirstPage;

        int lastPageIndex = (totalRecords - 1) / this.PageSize;
        bool visitingLastPage = (this.PageIndex >= lastPageIndex);
        lnkNext.Enabled = !visitingLastPage;
        lnkLast.Enabled = !visitingLastPage;

    }
    private void BindFilteringUI()
    {
        string[] filterOptions = { "All", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
        FilteringUI.DataSource = filterOptions;
        FilteringUI.DataBind();
    }
    protected void FilteringUI_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "All")
        {
            this.UsernameToMatch = string.Empty;
        }

        else
        {
            this.UsernameToMatch = e.CommandName;
        }

        BindUserAccounts();
    }
    protected void lnkFirst_Click(object sender, EventArgs e)
    {
        this.PageIndex = 0;
        BindUserAccounts();
    }
    protected void lnkPrev_Click(object sender, EventArgs e)
    {
        this.PageIndex -= 1;
        BindUserAccounts();
    }
    protected void lnkNext_Click(object sender, EventArgs e)
    {
        this.PageIndex = PageIndex + 1;
        BindUserAccounts();
    }
    protected void lnkLast_Click(object sender, EventArgs e)
    {
        // Determine the total number of records
        int totalRecords;
        Membership.FindUsersByName(this.UsernameToMatch + "%", this.PageIndex, this.PageSize, out totalRecords);
        // Navigate to the last page index
        this.PageIndex = (totalRecords - 1) / this.PageSize;
        BindUserAccounts();
    }
}