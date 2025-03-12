using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddVideo : System.Web.UI.Page
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
            BindData();
        }
    }

    private void BindData()
    {
        grdData.DataSource = dl.get_Video(null,null);
        grdData.DataBind();
    }

    protected void lnkAdd_Click(object sender, EventArgs e)
    {
        if(txtVideo.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Video Link Required', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"] == null)
        {
            if(dl.add_Video(null,txtVideo.Text,GetUserLoggedIn()))
            {
                clear();
                BindData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Video Added Successfully', type: 'success',});", true);
                
            }
        }
        else
        {
            if (dl.add_Video(ViewState["Id"].ToString(),txtVideo.Text,GetUserLoggedIn()))
            {
                clear();
                BindData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Video Updated Successfully', type: 'success',});", true);
                return;
            }
        }
    }
    private void clear()
    {
        txtVideo.Text   = string.Empty;
        ViewState["Id"] = null;
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
    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if(dl.update_Video_Active_Status(chkIsActive.ToolTip,chkIsActive.Checked,GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;
        DataTable dt = dl.get_Video(lnkEdit.CommandArgument, null);
        if(dt.Rows.Count > 0)
        {
            txtVideo.Text = dt.Rows[0]["VideoPath"].ToString();
            ViewState["Id"] = lnkEdit.CommandArgument;
        }
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        if(dl.delete_Video(lnkDelete.CommandArgument, null))
        {
            BindData();
        }
    }
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        pnlAdd.Visible = Convert.ToBoolean(dtsubpermission.Rows[0]["CanAdd"]);
        // pnlView.Visible = true;

    }
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnkEdit = (e.Row.FindControl("lnkEdit") as LinkButton);
            LinkButton lnkdelete = (e.Row.FindControl("lnkdelete") as LinkButton);
            CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
            lnkEdit.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
            chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[2].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[2].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[3].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);

        }
    }
}