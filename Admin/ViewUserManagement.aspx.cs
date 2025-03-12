using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewUserManagement : System.Web.UI.Page
{
    DAL dl = new DAL(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string url = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            DataTable dtsub = dl.getPanelMenuSubByurl(url);
            ViewState["SubmemnuId"] = dtsub.Rows[0]["SubMenuId"].ToString();
            ViewState["MainMenuId"] = dtsub.Rows[0]["MainMenuId"].ToString();
            getPermision();
            load_Data();
        }
    }

    private void load_Data()
    {
        grdData.DataSource = dl.getPanelUsers(null, null);
        grdData.DataBind();
    }
    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if (dl.updatePanelUserActiveStatus(chkIsActive.Checked, chkIsActive.ToolTip))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'Success',});", true);
        }
    }



    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        if (dl.deletePanelUser(lnkDelete.CommandArgument, null))
        {
            string url = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            DataTable dtsub = dl.getPanelMenuSubByurl(url);
          
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
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());

         pnlView.Visible = true;

    }
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    LinkButton lnkEdit = (e.Row.FindControl("lnkEdit") as LinkButton);
        //    LinkButton lnkdelete = (e.Row.FindControl("lnkdelete") as LinkButton);
        //    CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
        //    DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        //    lnkEdit.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
        //    lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
        //    chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
        //    grdData.Columns[6].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
        //    grdData.Columns[6].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
        //    grdData.Columns[6].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);

        //}
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;

        Response.Redirect("UserManagement.aspx");
    }
}