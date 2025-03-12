using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PaymentFrequency : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //string url = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            //DataTable dtsub = dl.getPanelMenuSubByurl(url);
            //ViewState["SubmemnuId"] = dtsub.Rows[0]["SubMenuId"].ToString();
            //ViewState["MainMenuId"] = dtsub.Rows[0]["MainMenuId"].ToString();
            //getPermision();
            BindData();
        }
    }
    private void BindData()
    {
        grdData.DataSource = dl.get_PaymentType(null,null);
        grdData.DataBind();
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
    private void clear()
    {
        //txtPaymentType.Text= string.Empty;  
    }
    //protected void lnkAdd_Click(object sender, EventArgs e)
    //{
    //    if(txtPaymentType.Text == "")
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Payment Type must be Added..!!!', type: 'error',});", true);
    //        return;
    //    }
    //    if (ViewState["Id"]==null)
    //    {
    //        if(dl.add_PaymentType(null,txtPaymentType.Text,GetUserLoggedIn()))
    //        {
    //            clear();
    //            BindData();
    //            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                
    //        }
    //    }
    //    else
    //    {
    //        if (dl.add_PaymentType(ViewState["Id"].ToString(),txtPaymentType.Text,GetUserLoggedIn()))
    //        {
    //            clear();
    //            BindData();
    //            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
    //        }
    //    }
    //}

    //protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    //{
    //    CheckBox chkIsActive = (CheckBox)sender;
    //    if(dl.update_PaymentType_Active_Status(chkIsActive.ToolTip,chkIsActive.Checked,GetUserLoggedIn()))
    //    {

    //        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
    //    }
    //}

    //protected void lnkEdit_Click(object sender, EventArgs e)
    //{
    //    LinkButton lnkEdit = (LinkButton)sender;
    //    DataTable dt = dl.get_PaymentType(lnkEdit.CommandArgument, null);
    //    if (dt.Rows.Count >0)
    //    {
    //        txtPaymentType.Text = dt.Rows[0]["PaymentTypeHead"].ToString();
    //        ViewState["Id"] = lnkEdit.CommandArgument;
    //    }

    //}

    //protected void lnkDelete_Click(object sender, EventArgs e)
    //{
    //    LinkButton lnkDelete = (LinkButton)sender;
    //    if(dl.delete_PaymentType(lnkDelete.CommandArgument,GetUserLoggedIn()))
    //    {
    //        BindData();
    //    }
    //}
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        //pnlAdd.Visible = Convert.ToBoolean(dtsubpermission.Rows[0]["CanAdd"]);
        pnlView.Visible = true;

    }
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    LinkButton lnkEdit = (e.Row.FindControl("lnkEdit") as LinkButton);
        //    LinkButton lnkdelete = (e.Row.FindControl("lnkDelete") as LinkButton);
        //    CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
        //    DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        //    lnkEdit.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
        //    chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
        //    lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
        //    grdData.Columns[2].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
        //    grdData.Columns[2].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
        //    grdData.Columns[2].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);

        //}
    }
}