using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CloseDeal : System.Web.UI.Page
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
        grdData.DataSource = dl.get_CloseDeal(null, null, null,null, null);
        grdData.DataBind();
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        if(dl.delete_CloseDeal(lnkDelete.CommandArgument,GetUserLoggedIn()))
        {
            dl.delete_CloseDealInterestDetails(null, lnkDelete.CommandArgument, GetUserLoggedIn());
            BindData();
        }
    }

    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if (dl.update_CloseDeal_Active_Status(chkIsActive.ToolTip, chkIsActive.Checked, GetUserLoggedIn()))
        {
            dl.update_CloseDealInterestDetails_Active_Status(null, chkIsActive.ToolTip, chkIsActive.Checked, GetUserLoggedIn());
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Close Deal Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
            LinkButton lnkdelete = (e.Row.FindControl("lnkdelete") as LinkButton);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
            chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
            grdData.Columns[17].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[18].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);


        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCashflowChartId = e.Row.FindControl("hfCashflowChartId") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            grdItems.DataSource = dl.get_CloseDealInterestDetails(null, hfCashflowChartId.Value, null, true);
            grdItems.DataBind();
        

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

        //pnlView.Visible = true;

    }
}