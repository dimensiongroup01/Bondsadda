using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ReAssignRM : System.Web.UI.Page
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
            RMDataBind();
            CustomerDataBind();
            BindData();
        }
    }

    private void BindData()
    {
        grdData.DataSource = dl.get_RMAssign(null, null, null, null);
        grdData.DataBind();
    }
    private void RMDataBind()
    {
        ddlRM.DataSource = dl.getPanelUsersRM(null, null, null);
        ddlRM.DataTextField = "FullName";
        ddlRM.DataValueField = "UserId";
        ddlRM.DataBind();
        ddlRM.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void CustomerDataBind()
    {
        ddlCustomerName.DataSource = dl.get_RMAssign(null, null,null,null);
        ddlCustomerName.DataTextField = "CFullName";
        ddlCustomerName.DataValueField = "CustomerId";
        ddlCustomerName.DataBind();
        ddlCustomerName.Items.Insert(0, new ListItem("Choose one", "-1"));
    }

    private void GetReAssign()
    {
        DataTable dt = dl.get_ReAssignLogTop(null,null,ddlCustomerName.SelectedValue,null);
        if(dt.Rows.Count > 0)
        {
            string ReAssignLogId = dt.Rows[0]["ReAssignLogId"].ToString();
            hfReAssignLogId.Value = ReAssignLogId;
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
    protected void lnkReAssign_Click(object sender, EventArgs e)
    {
        string ReAssignLog = hfReAssignLogId.Value;
        if(ddlCustomerName.SelectedIndex ==0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Customer Must be Choose', type: 'error',});", true);
            return;
        }
        if(ddlRM.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'RM Must be Choose', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"]==null)
        {
            dl.ReAssignRM(null, ddlRM.SelectedValue, ddlCustomerName.SelectedValue);
            if(dl.Update_RMAssignLog(ReAssignLog,ddlCustomerName.SelectedValue,GetUserLoggedIn()))
            {
                dl.UpdateRMAssignId(ddlCustomerName.SelectedValue,ddlRM.SelectedValue);
                dl.add_ReAssignRMLog(null,ddlRM.SelectedValue,ddlCustomerName.SelectedValue,GetUserLoggedIn());
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Customer ReAssign Successfully', type: 'success',});", true);
                return;
            }
        }
    }

    protected void ddlCustomerName_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetReAssign();
    }

    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerView = e.Row.FindControl("hfCustomerView") as HiddenField;
            GridView grdCustomerDeal = e.Row.FindControl("grdCustomerDeal") as GridView;
            grdCustomerDeal.DataSource = dl.get_ReAssignLog(null, null, hfCustomerView.Value, null);
            grdCustomerDeal.DataBind();
        }
    }
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        pnlAdd.Visible = Convert.ToBoolean(dtsubpermission.Rows[0]["CanAdd"]);
        pnlView.Visible = true;

    }
}