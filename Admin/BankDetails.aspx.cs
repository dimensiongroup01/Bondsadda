using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_BankDetails : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string url = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            DataTable dtsub = dl.getPanelMenuSubByurl(url);
            ViewState["SubmemnuId"] = dtsub.Rows[0]["SubMenuId"].ToString();
            ViewState["MainMenuId"] = dtsub.Rows[0]["MainMenuId"].ToString();
            getPermision();
            UserDetails();
            BindData();
        }
    }
    private void UserDetails()
    {
        DataTable dt = dl.getPanelUsers(GetUserLoggedIn(), null);
        if (dt.Rows.Count > 0)
        {
            string RM = dt.Rows[0]["RM"].ToString();
            hfRM.Value = RM;
        }
    }
    private void BindData()
    {
        if(hfRM.Value == "True")
        {
            grdData.DataSource = dl.get_BankDetailsStatusRM(null, null, "Pending",GetUserLoggedIn(), null);
            grdData.DataBind();
        }
        if(hfRM.Value == "False")
        {
            grdData.DataSource = dl.get_BankDetailsStatus(null, null, "Pending", null);
            grdData.DataBind();
        }

    }
    private string GetUserLoggedIn()
    {

        HttpCookie cookieuser = Request.Cookies["DGBA"];
        if (cookieuser == null)
        {
            return null;
        }
        else
        {
            return cookieuser.Value.ToString();
        }

    }
    protected void lnkApproved_Click(object sender, EventArgs e)
    {
        LinkButton lnkApprove = (LinkButton)sender;
        if (dl.update_BankDetails(null, lnkApprove.CommandArgument, GetUserLoggedIn()))
        {
            BindData();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Bank Details Verify And Approved.', type: 'success',});", true);
            return;
        }
    }

    protected void lnkCancel_Click(object sender, EventArgs e)
    {
        LinkButton lnkCancel = (LinkButton)sender;
        if (dl.update_BankDetailsReject(null, lnkCancel.CommandArgument, GetUserLoggedIn()))
        {
            BindData();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Bank Details Reject.', type: 'error',});", true);
            return;
        }
    }
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        // pnlView.Visible = true;

    }
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnkApproved = (e.Row.FindControl("lnkApproved") as LinkButton);
            LinkButton lnkCancel = (e.Row.FindControl("lnkCancel") as LinkButton);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
            lnkApproved.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            lnkCancel.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[7].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[7].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);

        }
    }
}