using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_EmailNotification : System.Web.UI.Page
{
    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string url = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            DataTable dtsub = dl.getPanelMenuSubByurl(url);
            //ViewState["SubmemnuId"] = dtsub.Rows[0]["SubMenuId"].ToString();
            //ViewState["MainMenuId"] = dtsub.Rows[0]["MainMenuId"].ToString();
            //getPermision();
            Binddata();
            BindSecurity();
        }
    }

    private void BindSecurity()
    {
        ddlSecurity.DataSource = dl.Get_SecurityDetails("Bullet");
        ddlSecurity.DataTextField = "Security";
        ddlSecurity.DataValueField = "Security";
        ddlSecurity.DataBind();
        ddlSecurity.Items.Insert(0, new ListItem("Choose Security", ""));
    }
    private void Binddata()
    {
        string Security = null, isin = null;
        if (ddlSecurity.SelectedValue != "")
        {
            Security = ddlSecurity.SelectedValue;
        }
        if (txtISINNumber.Text != "")
        {
            isin = txtISINNumber.Text;
        }
        grdData.DataSource = dl.get_ProductsBulletFilter(null, null, null, Security, isin, null);
        grdData.DataBind();
        init_DataTable();
    }

    private void init_DataTable()
    {
        if (grdData.Rows.Count != 0)
        {
            grdData.HeaderRow.TableSection = TableRowSection.TableHeader;
            grdData.UseAccessibleHeader = true;
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup11", "setTimeout(function(){init_DataTable();},2000);", true);
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
        pnlAdd.Visible = Convert.ToBoolean(dtsubpermission.Rows[0]["CanAdd"]);
        pnlView.Visible = true;

    }
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //LinkButton lnkEdit = (e.Row.FindControl("lnkEdit") as LinkButton);
            //LinkButton lnkdelete = (e.Row.FindControl("lnkdelete") as LinkButton);
            //CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
            //DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
            //lnkEdit.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            //lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
            //chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            //grdData.Columns[2].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            //grdData.Columns[3].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            //grdData.Columns[4].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfProductId = e.Row.FindControl("hfProductId") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            grdItems.DataSource = dl.get_RatingAgenciesTags(null, hfProductId.Value, null, true);
            grdItems.DataBind();

        }
    }



    protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void chkShowData_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkShowData = (CheckBox)sender;
        if (dl.update_Products_ShowData(chkShowData.ToolTip, chkShowData.Checked))
        {
            //BindData();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }
    protected void chkInvestNow_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkInvest = (CheckBox)sender;
        if (dl.update_Products_IsInvestNow(chkInvest.ToolTip, chkInvest.Checked))
        {
            //BindData();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    private void BindDataCheck()
    {
        foreach (GridViewRow gr in grdData.Rows)
        {
            CheckBox chkdeleteData = gr.FindControl("chkdeleteData") as CheckBox;
            if (chkdeleteData.Checked == true)
            {
                dl.delete_Products(chkdeleteData.ToolTip, GetUserLoggedIn());
            }
        }
    }


    protected void lnkdeletecheck_Click(object sender, EventArgs e)
    {
        BindDataCheck();
    }
    protected void lnkcheckall_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in grdData.Rows)
        {

            CheckBox chkdeleteData = gr.FindControl("chkdeleteData") as CheckBox;

            chkdeleteData.Checked = true;



        }
    }


    protected void lnkFilter_Click(object sender, EventArgs e)
    {
        Binddata();
    }
}