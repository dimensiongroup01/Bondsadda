using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AssignRM : System.Web.UI.Page
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
            UserDetails();
            RMData();
            RMDataBind();
            CustomerDataBind();
            BindProduct();
        }
    }
    private void RMDataBind()
    {
        ddlRM.DataSource = dl.getPanelUsersRM(null, null,null);
        ddlRM.DataTextField = "FullName";
        ddlRM.DataValueField = "UserId";
        ddlRM.DataBind();
        ddlRM.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void CustomerDataBind()
    {
        ddlCustomerName.DataSource = dl.getCustomer(null, null);
        ddlCustomerName.DataTextField = "CFullName";
        ddlCustomerName.DataValueField = "CustomerId";
        ddlCustomerName.DataBind();
        ddlCustomerName.Items.Insert(0, new ListItem("Choose one", "-1"));
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
    private void UserDetails()
    {
        DataTable dt = dl.getPanelUsers(GetUserLoggedIn(), null);
        if(dt.Rows.Count > 0)
        {
            string RM = dt.Rows[0]["RM"].ToString();
            hfRM.Value = RM;
            if(hfRM.Value == "True")
            {
                pnlFilter.Visible = false;
            }
            else
            {
                pnlFilter.Visible=true;
            }
        }
    }
    private void RMData()
    {
        grdData.DataSource = dl.get_RMAssign(null,GetUserLoggedIn(),null, null);
        grdData.DataBind();
    }

    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if(dl.update_RMAssign_Active_Status(chkIsActive.ToolTip,chkIsActive.Checked,null))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void ddlRM_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlRM.SelectedValue !=null)
        {
            grdData.DataSource = dl.get_RMAssign(null, ddlRM.SelectedValue, null, null);
            grdData.DataBind();
        }
    }

    protected void ddlCustomerName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlCustomerName.SelectedValue !=null)
        {
            grdData.DataSource = dl.get_RMAssign(null,null, ddlCustomerName.SelectedValue, null);
            grdData.DataBind();
        }
    }

    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());

            chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[6].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);

        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerName = e.Row.FindControl("hfCustomerName") as HiddenField;
            GridView grdCustomer = e.Row.FindControl("grdCustomer") as GridView;
            grdCustomer.DataSource = dl.getCustomer(hfCustomerName.Value, null);
            grdCustomer.DataBind();
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerName = e.Row.FindControl("hfCustomerName") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            grdItems.DataSource = dl.get_AdharDetails(null, hfCustomerName.Value, true);
            grdItems.DataBind();
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerName = e.Row.FindControl("hfCustomerName") as HiddenField;
            GridView grdItemsPAN = e.Row.FindControl("grdItemsPAN") as GridView;
            grdItemsPAN.DataSource = dl.get_KYCDetails(null, hfCustomerName.Value, true);
            grdItemsPAN.DataBind();
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerName = e.Row.FindControl("hfCustomerName") as HiddenField;
            GridView grdItemsDemate = e.Row.FindControl("grdItemsDemate") as GridView;
            grdItemsDemate.DataSource = dl.get_DemateAccountDetails(null, hfCustomerName.Value);
            grdItemsDemate.DataBind();
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerName = e.Row.FindControl("hfCustomerName") as HiddenField;
            GridView grdItemsBank = e.Row.FindControl("grdItemsBank") as GridView;
            grdItemsBank.DataSource = dl.get_BankDetails(null, hfCustomerName.Value, null);
            grdItemsBank.DataBind();
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerViewDeal = e.Row.FindControl("hfCustomerViewDeal") as HiddenField;
            GridView grdCustomerDeal = e.Row.FindControl("grdCustomerDeal") as GridView;
            grdCustomerDeal.DataSource = dl.get_AddDeal(null,null, hfCustomerViewDeal.Value,null, null);
            grdCustomerDeal.DataBind();
        }

    }

    protected void grdCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    HiddenField hfCustomerAdhar = e.Row.FindControl("hfCustomerAdhar") as HiddenField;
        //    GridView grdItems = e.Row.FindControl("grdItems") as GridView;
        //    Panel pnlAdharPending = e.Row.FindControl("pnlAdharPending") as Panel;
        //    Panel pnlAdharApproved = e.Row.FindControl("pnlAdharApproved") as Panel;
        //    Panel pnlAdharReject = e.Row.FindControl("pnlAdharReject") as Panel;
        //    DataTable dt = dl.get_AdharDetails(null, hfCustomerAdhar.Value, true);
        //    if (dt.Rows.Count > 0)
        //    {
        //        string Status = dt.Rows[0]["AdharStatus"].ToString();
        //        hfAdhar.Value = Status;
        //        if (hfAdhar.Value == "Pending")
        //        {
        //            pnlAdharPending.Visible = true;
        //            pnlAdharApproved.Visible = false;
        //            pnlAdharReject.Visible = false;

        //        }
        //        if (hfAdhar.Value == "Approved")
        //        {
        //            pnlAdharPending.Visible = false;
        //            pnlAdharApproved.Visible = true;
        //            pnlAdharReject.Visible = false;

        //        }
        //        if (hfAdhar.Value == "Reject")
        //        {
        //            pnlAdharPending.Visible = false;
        //            pnlAdharApproved.Visible = false;
        //            pnlAdharReject.Visible = true;
        //        }
        //        grdItems.DataSource = dl.get_AdharDetails(null, hfCustomerAdhar.Value, true);
        //        grdItems.DataBind();
        //    }
        //    else
        //    {
        //        e.Row.Cells[6].Text = "";
        //    }

        //}
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    HiddenField hfCustomerPAN = e.Row.FindControl("hfCustomerPAN") as HiddenField;
        //    GridView grdItemsPAN = e.Row.FindControl("grdItemsPAN") as GridView;
        //    Panel pnlPendingPAN = e.Row.FindControl("pnlPendingPAN") as Panel;
        //    Panel pnlApprovedPAN = e.Row.FindControl("pnlApprovedPAN") as Panel;
        //    Panel pnlRejectPAN = e.Row.FindControl("pnlRejectPAN") as Panel;
        //    DataTable dt = dl.get_KYCDetails(null, hfCustomerPAN.Value, true);
        //    if (dt.Rows.Count > 0)
        //    {
        //        string Status = dt.Rows[0]["Status"].ToString();
        //        hfPANStatus.Value = Status;
        //        if (hfPANStatus.Value == "Pending")
        //        {
        //            pnlPendingPAN.Visible = true;
        //            pnlApprovedPAN.Visible = false;
        //            pnlRejectPAN.Visible = false;
        //        }
        //        if (hfPANStatus.Value == "Approved")
        //        {
        //            pnlPendingPAN.Visible = false;
        //            pnlApprovedPAN.Visible = true;
        //            pnlRejectPAN.Visible = false;
        //        }
        //        if (hfPANStatus.Value == "Reject")
        //        {
        //            pnlPendingPAN.Visible = false;
        //            pnlApprovedPAN.Visible = false;
        //            pnlRejectPAN.Visible = true;
        //        }
        //        grdItemsPAN.DataSource = dl.get_KYCDetails(null, hfCustomerPAN.Value, true);
        //        grdItemsPAN.DataBind();
        //    }
        //    else
        //    {
        //        e.Row.Cells[7].Text = "";
        //    }



            //}
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    HiddenField hfCustomerDemate = e.Row.FindControl("hfCustomerDemate") as HiddenField;
            //    GridView grdItemsDemate = e.Row.FindControl("grdItemsDemate") as GridView;
            //    Panel pnlPendingDemate = e.Row.FindControl("pnlPendingDemate") as Panel;
            //    Panel pnlApprovedDemate = e.Row.FindControl("pnlApprovedDemate") as Panel;
            //    Panel pnlRejectDemate = e.Row.FindControl("pnlRejectDemate") as Panel;
            //    DataTable dt = dl.get_DemateAccountDetails(null, hfCustomerDemate.Value);
            //    if (dt.Rows.Count > 0)
            //    {
            //        string DemateStatus = dt.Rows[0]["DemateStatus"].ToString();
            //        hfDemateStatus.Value = DemateStatus;
            //        if (hfDemateStatus.Value == "Pending")
            //        {
            //            pnlPendingDemate.Visible = true;
            //            pnlApprovedDemate.Visible = false;
            //            pnlRejectDemate.Visible = false;
            //        }
            //        if (hfDemateStatus.Value == "Approved")
            //        {
            //            pnlPendingDemate.Visible = false;
            //            pnlApprovedDemate.Visible = true;
            //            pnlRejectDemate.Visible = false;
            //        }
            //        if (hfDemateStatus.Value == "Reject")
            //        {
            //            pnlPendingDemate.Visible = false;
            //            pnlApprovedDemate.Visible = false;
            //            pnlRejectDemate.Visible = true;
            //        }
            //        grdItemsDemate.DataSource = dl.get_DemateAccountDetails(null, hfCustomerDemate.Value);
            //        grdItemsDemate.DataBind();
            //    }
            //    else
            //    {
            //        e.Row.Cells[8].Text = "";
            //    }

            //}
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{

            //    HiddenField hfCustomerBank = e.Row.FindControl("hfCustomerBank") as HiddenField;
            //    GridView grdItemsBank = e.Row.FindControl("grdItemsBank") as GridView;
            //    Panel pnlPendingBank = e.Row.FindControl("pnlPendingBank") as Panel;
            //    Panel pnlApprovedBank = e.Row.FindControl("pnlApprovedBank") as Panel;
            //    Panel pnlRejectBank = e.Row.FindControl("pnlRejectBank") as Panel;
            //    DataTable dt = dl.get_BankDetails(null, hfCustomerBank.Value, null);
            //    if (dt.Rows.Count > 0)
            //    {
            //        string BankStatus = dt.Rows[0]["BankStatus"].ToString();
            //        hfBankStatus.Value = BankStatus;
            //        if (hfBankStatus.Value == "Pending")
            //        {
            //            pnlPendingBank.Visible = true;
            //            pnlApprovedBank.Visible = false;
            //            pnlRejectBank.Visible = false;
            //        }
            //        if (hfBankStatus.Value == "Approved")
            //        {
            //            pnlPendingBank.Visible = false;
            //            pnlApprovedBank.Visible = true;
            //            pnlRejectBank.Visible = false;
            //        }
            //        if (hfBankStatus.Value == "Reject")
            //        {
            //            pnlPendingBank.Visible = false;
            //            pnlApprovedBank.Visible = false;
            //            pnlRejectBank.Visible = true;
            //        }
            //        grdItemsBank.DataSource = dl.get_BankDetails(null, hfCustomerBank.Value, null);
            //        grdItemsBank.DataBind();
            //    }
            //    else
            //    {
            //        e.Row.Cells[9].Text = "";
            //    }

            //}
    }
    private void BindProduct()
    {
        foreach (GridViewRow gr in grdData.Rows)
        {
            DropDownList ddlProduct = gr.FindControl("ddlProduct") as DropDownList;

            ddlProduct.DataSource = dl.get_Products(null, null, null, null);
            ddlProduct.DataTextField = "ProductName";
            ddlProduct.DataValueField = "ProductsId";
            ddlProduct.DataBind();
            ddlProduct.Items.Insert(0, new ListItem("Choose one", "-1"));
        }
    }
    protected void lnkAddDeal_Click(object sender, EventArgs e)
    {
        LinkButton lnkAddDeal=(LinkButton)sender;
        GridViewRow gr = (GridViewRow)lnkAddDeal.NamingContainer;
        DropDownList ddlProduct = gr.FindControl("ddlProduct") as DropDownList;
        HiddenField hfCustomer = gr.FindControl("hfCustomer") as HiddenField;
        TextBox txtDealDate = gr.FindControl("txtDealDate") as TextBox;
        TextBox txtPaymentDate = gr.FindControl("txtPaymentDate") as TextBox;
        if(ddlProduct.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Product Must be Choose', type: 'error',});", true);
            return;
        }

        if(dl.add_AddDeal(null, ddlProduct.SelectedValue, hfCustomer.Value, txtDealDate.Text, txtPaymentDate.Text, GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Added Successfully', type: 'success',});", true);
            return;
        }
    }

    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        pnlView.Visible = true;

    }
}