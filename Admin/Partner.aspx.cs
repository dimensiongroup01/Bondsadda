using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Partner : System.Web.UI.Page
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
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
            chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[11].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfPartner = e.Row.FindControl("hfPartner") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            grdItems.DataSource = dl.get_PartnerBankDetails(null, hfPartner.Value, true);
            grdItems.DataBind();

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfPartners = e.Row.FindControl("hfPartners") as HiddenField;
            GridView grdItemsData = e.Row.FindControl("grdItemsData") as GridView;
            grdItemsData.DataSource = dl.get_PartnerDemateDetails(null, hfPartners.Value, true);
            grdItemsData.DataBind();
        }
    }
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        // pnlView.Visible = true;

    }
    private void BindData()
    {
        grdData.DataSource = dl.get_PartnerDetails(null, null);
        grdData.DataBind();
    }

    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if(dl.update_PartnerDetails_Active_Status(chkIsActive.ToolTip,chkIsActive.Checked,GetUserLoggedIn()))
        {
            dl.update_PartnerBankDetails_Active_Status(chkIsActive.ToolTip, chkIsActive.Checked, GetUserLoggedIn());
            dl.update_PartnerDemateDetails_Active_Status(chkIsActive.ToolTip, chkIsActive.Checked, GetUserLoggedIn());

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }
}