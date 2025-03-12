using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewRegisteredCustomer : System.Web.UI.Page
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
            load_Data();
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
    private void load_Data()
    {
        if(hfRM.Value == "True")
        {
            grdData.DataSource = dl.getCustomerRM(null,GetUserLoggedIn(), null);
            grdData.DataBind();
        }
        if(hfRM.Value == "False")
        {
            grdData.DataSource = dl.getCustomer(null, null);
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
            grdData.Columns[10].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);


        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox txtPassword = e.Row.FindControl("txtPassword") as TextBox;  
            txtPassword.ReadOnly = true;

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerAdhar = e.Row.FindControl("hfCustomerAdhar") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            Panel pnlAdharPending = e.Row.FindControl("pnlAdharPending") as Panel;
            Panel pnlAdharApproved = e.Row.FindControl("pnlAdharApproved") as Panel;
            Panel pnlAdharReject = e.Row.FindControl("pnlAdharReject") as Panel;
            DataTable dt = dl.get_AdharDetails(null, hfCustomerAdhar.Value, true);
            if(dt.Rows.Count > 0)
            {
                string Status = dt.Rows[0]["AdharStatus"].ToString();
                hfAdhar.Value = Status;
                if(hfAdhar.Value=="Pending")
                {
                    pnlAdharPending.Visible = true;
                    pnlAdharApproved.Visible = false;
                    pnlAdharReject.Visible = false;
                  
                }
                if(hfAdhar.Value =="Approved")
                {
                    pnlAdharPending.Visible = false;
                    pnlAdharApproved.Visible = true;
                    pnlAdharReject.Visible = false;
                 
                }
                if(hfAdhar.Value == "Reject")
                {
                    pnlAdharPending.Visible = false;
                    pnlAdharApproved.Visible = false;
                    pnlAdharReject.Visible = true;
                }
                grdItems.DataSource = dl.get_AdharDetails(null, hfCustomerAdhar.Value, true);
                grdItems.DataBind();
            }
            else
            {
                e.Row.Cells[6].Text = "";
            }
           
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerPAN = e.Row.FindControl("hfCustomerPAN") as HiddenField;
            GridView grdItemsPAN = e.Row.FindControl("grdItemsPAN") as GridView;
            Panel pnlPendingPAN = e.Row.FindControl("pnlPendingPAN") as Panel;
            Panel pnlApprovedPAN = e.Row.FindControl("pnlApprovedPAN") as Panel;
            Panel pnlRejectPAN = e.Row.FindControl("pnlRejectPAN") as Panel;
            DataTable dt = dl.get_KYCDetails(null,hfCustomerPAN.Value, true);
            if(dt.Rows.Count > 0)
            {
                string Status = dt.Rows[0]["Status"].ToString();
                hfPANStatus.Value = Status;
                if (hfPANStatus.Value == "Pending")
                {
                    pnlPendingPAN.Visible = true;
                    pnlApprovedPAN.Visible = false;
                    pnlRejectPAN.Visible = false;
                }
                if (hfPANStatus.Value == "Approved")
                {
                    pnlPendingPAN.Visible = false;
                    pnlApprovedPAN.Visible = true;
                    pnlRejectPAN.Visible = false;
                }
                if(hfPANStatus.Value == "Reject")
                {
                    pnlPendingPAN.Visible = false;
                    pnlApprovedPAN.Visible = false;
                    pnlRejectPAN.Visible = true;
                }
                grdItemsPAN.DataSource = dl.get_KYCDetails(null, hfCustomerPAN.Value, true);
                grdItemsPAN.DataBind();
            }
            else
            {
                e.Row.Cells[7].Text = "";
            }



        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomerDemate = e.Row.FindControl("hfCustomerDemate") as HiddenField;
            GridView grdItemsDemate = e.Row.FindControl("grdItemsDemate") as GridView;
            Panel pnlPendingDemate = e.Row.FindControl("pnlPendingDemate") as Panel;
            Panel pnlApprovedDemate = e.Row.FindControl("pnlApprovedDemate") as Panel;
            Panel pnlRejectDemate = e.Row.FindControl("pnlRejectDemate") as Panel;
            DataTable dt = dl.get_DemateAccountDetails(null, hfCustomerDemate.Value);
            if(dt.Rows.Count > 0)
            {
                string DemateStatus = dt.Rows[0]["DemateStatus"].ToString();
                hfDemateStatus.Value = DemateStatus;
                if (hfDemateStatus.Value == "Pending")
                {
                    pnlPendingDemate.Visible = true;
                    pnlApprovedDemate.Visible = false;
                    pnlRejectDemate.Visible = false;
                }
                if (hfDemateStatus.Value == "Approved")
                {
                    pnlPendingDemate.Visible = false;
                    pnlApprovedDemate.Visible = true;
                    pnlRejectDemate.Visible = false;
                }
                if(hfDemateStatus.Value == "Reject")
                {
                    pnlPendingDemate.Visible = false;
                    pnlApprovedDemate.Visible = false;
                    pnlRejectDemate.Visible = true;
                }
                grdItemsDemate.DataSource = dl.get_DemateAccountDetails(null, hfCustomerDemate.Value);
                grdItemsDemate.DataBind();
            }
            else
            {
                e.Row.Cells[8].Text = "";
            }

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            HiddenField hfCustomerBank = e.Row.FindControl("hfCustomerBank") as HiddenField;
            GridView grdItemsBank = e.Row.FindControl("grdItemsBank") as GridView;
            Panel pnlPendingBank = e.Row.FindControl("pnlPendingBank") as Panel;
            Panel pnlApprovedBank = e.Row.FindControl("pnlApprovedBank") as Panel;
            Panel pnlRejectBank = e.Row.FindControl("pnlRejectBank") as Panel;
            DataTable dt = dl.get_BankDetails(null, hfCustomerBank.Value, null);
            if(dt.Rows.Count > 0)
            {
                string BankStatus = dt.Rows[0]["BankStatus"].ToString();
                hfBankStatus.Value = BankStatus;
                if (hfBankStatus.Value == "Pending")
                {
                    pnlPendingBank.Visible = true;
                    pnlApprovedBank.Visible = false;
                    pnlRejectBank.Visible = false;
                }
                if (hfBankStatus.Value == "Approved")
                {
                    pnlPendingBank.Visible = false;
                    pnlApprovedBank.Visible = true;
                    pnlRejectBank.Visible = false;
                }
                if(hfBankStatus.Value =="Reject")
                {
                    pnlPendingBank.Visible = false;
                    pnlApprovedBank.Visible = false;
                    pnlRejectBank.Visible = true;
                }
                grdItemsBank.DataSource = dl.get_BankDetails(null, hfCustomerBank.Value, null);
                grdItemsBank.DataBind();
            }
            else
            {
                e.Row.Cells[9].Text = "";
            }

        }
    }

    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;    
        if(dl.updateCustomerActiveStatus(chkIsActive.Checked,chkIsActive.ToolTip))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
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
    //protected void lnkSubmit_Click(object sender, EventArgs e)
    //{
    //    LinkButton btnSubmit = (LinkButton)sender;
    //    GridViewRow gvr = ((LinkButton)sender).NamingContainer as GridViewRow;

    //    HiddenField hfCustId = (HiddenField)gvr.FindControl("hfCustId");

    //    DataTable dt = dl.get_AdharDetails(null, btnSubmit.CommandArgument, null);
    //    if (dt.Rows.Count > 0)
    //    {
    //        string Adhar = dt.Rows[0]["AdharStatus"].ToString();
    //        hfAdhar.Value = Adhar;
    //    }
    //    if (hfAdhar.Value == "Pending")
    //    {
    //        if (dl.update_AdharDetails(null, hfCustId.Value, GetUserLoggedIn()))
    //        {
    //            load_Data();
    //            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Adhar Verify And Approved.', type: 'success',});", true);
    //            return;
    //        }
    //    }
    //    else
    //    {
    //        //load_Data();
    //        //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Adhar Already Approved.', type: 'success',});", true);
    //    }

    //}


    //protected void lnlPAN_Click(object sender, EventArgs e)
    //{
    //    GridViewRow gvr = ((LinkButton)sender).Parent.Parent as GridViewRow;
    //    foreach (GridViewRow gv in grdData.Rows)
    //    {
    //        HiddenField hfCustomerPAN = (HiddenField)gv.FindControl("hfCustomerPAN");
    //        GridView grdItemsPAN = (GridView)gv.FindControl("grdItemsPAN");

    //        foreach (GridViewRow gr in grdItemsPAN.Rows)
    //        {

    //            if (grdItemsPAN.Rows.Count != 0)
    //            {
    //                DataTable dt = dl.get_KYCDetails(null, hfCustomerPAN.Value, null);
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string Adhar = dt.Rows[0]["Status"].ToString();
    //                    hfPAN.Value = Adhar;
    //                }
    //                if (hfPAN.Value == "Pending")
    //                {
    //                    if (dl.update_KYCDetails(null, hfCustomerPAN.Value, GetUserLoggedIn()))
    //                    {
    //                        load_Data();
    //                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'PAN Verify And Approved.', type: 'success',});", true);

    //                    }
    //                }
    //                else
    //                {
    //                    load_Data();
    //                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'PAN Already Approved.', type: 'success',});", true);
    //                }


    //            }

    //        }
    //    }



    //}

    //protected void lnkDemate_Click(object sender, EventArgs e)
    //{
    //    GridViewRow gvr = ((LinkButton)sender).Parent.Parent as GridViewRow;
    //    foreach (GridViewRow gv in grdData.Rows)
    //    {
    //        HiddenField hfCustomerDemate = (HiddenField)gv.FindControl("hfCustomerDemate");
    //        GridView grdItemsDemate = (GridView)gv.FindControl("grdItemsDemate");

    //        foreach (GridViewRow gr in grdItemsDemate.Rows)
    //        {

    //            if (grdItemsDemate.Rows.Count != 0)
    //            {
    //                DataTable dt = dl.get_DemateAccountDetails(null, hfCustomerDemate.Value);
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string Adhar = dt.Rows[0]["DemateStatus"].ToString();
    //                    hfDemate.Value = Adhar;
    //                }
    //                if (hfDemate.Value == "Pending")
    //                {
    //                    if (dl.update_DemateAccountDetails(null, hfCustomerDemate.Value, GetUserLoggedIn()))
    //                    {
    //                        load_Data();
    //                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Demate Account Verify And Approved.', type: 'success',});", true);

    //                    }
    //                }
    //                else
    //                {
    //                    load_Data();
    //                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Demate Account Already Approved.', type: 'success',});", true);
    //                }


    //            }

    //        }
    //    }

    //}

    //protected void lnkBank_Click(object sender, EventArgs e)
    //{
    //    GridViewRow gvr = ((LinkButton)sender).Parent.Parent as GridViewRow;
    //    foreach (GridViewRow gv in grdData.Rows)
    //    {
    //        HiddenField hfCustomerBank = (HiddenField)gv.FindControl("hfCustomerBank");
    //        GridView grdItemsBank = (GridView)gv.FindControl("grdItemsBank");

    //        foreach (GridViewRow gr in grdItemsBank.Rows)
    //        {

    //            if (grdItemsBank.Rows.Count != 0)
    //            {
    //                DataTable dt = dl.get_BankDetails(null, hfCustomerBank.Value,null);
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string Adhar = dt.Rows[0]["BankStatus"].ToString();
    //                    hfBank.Value = Adhar;
    //                }
    //                if (hfBank.Value == "Pending")
    //                {
    //                    if (dl.update_BankDetails(null, hfCustomerBank.Value, GetUserLoggedIn()))
    //                    {
    //                        load_Data();
    //                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Bank Details Verify And Approved.', type: 'success',});", true);

    //                    }
    //                }
    //                else
    //                {
    //                    load_Data();
    //                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Bank Details Already Approved.', type: 'success',});", true);
    //                }


    //            }

    //        }
    //    }
    //}
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());

        // pnlView.Visible = true;

    }


    //protected void lnkCancelAdhar_Click(object sender, EventArgs e)
    //{
    //    GridViewRow gvr = ((LinkButton)sender).Parent.Parent as GridViewRow;
    //    foreach (GridViewRow gv in grdData.Rows)
    //    {
    //        HiddenField hfCustomerAdhar = (HiddenField)gv.FindControl("hfCustomerAdhar");
    //        GridView grdItems = (GridView)gv.FindControl("grdItems");

    //        foreach (GridViewRow gr in grdItems.Rows)
    //        {

    //            if (grdItems.Rows.Count != 0)
    //            {
    //                DataTable dt = dl.get_AdharDetails(null, hfCustomerAdhar.Value, null);
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string Adhar = dt.Rows[0]["AdharStatus"].ToString();
    //                    hfAdhar.Value = Adhar;
    //                }
    //                if (hfAdhar.Value == "Pending")
    //                {
    //                    if (dl.update_AdharDetailsReject(null, hfCustomerAdhar.Value, GetUserLoggedIn()))
    //                    {
    //                        load_Data();
    //                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Adhar Number Reject.', type: 'success',});", true);

    //                    }
    //                }
    //                else
    //                {
    //                    load_Data();
    //                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Adhar Already Approved.', type: 'success',});", true);
    //                }


    //            }

    //        }
    //    }
    //}

    //protected void lnkCancelPAN_Click(object sender, EventArgs e)
    //{
    //    GridViewRow gvr = ((LinkButton)sender).Parent.Parent as GridViewRow;
    //    foreach (GridViewRow gv in grdData.Rows)
    //    {
    //        HiddenField hfCustomerPAN = (HiddenField)gv.FindControl("hfCustomerPAN");
    //        GridView grdItemsPAN = (GridView)gv.FindControl("grdItemsPAN");

    //        foreach (GridViewRow gr in grdItemsPAN.Rows)
    //        {

    //            if (grdItemsPAN.Rows.Count != 0)
    //            {
    //                DataTable dt = dl.get_KYCDetails(null, hfCustomerPAN.Value, null);
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string Adhar = dt.Rows[0]["Status"].ToString();
    //                    hfPAN.Value = Adhar;
    //                }
    //                if (hfPAN.Value == "Pending")
    //                {
    //                    if (dl.update_KYCDetailsReject(null, hfCustomerPAN.Value, GetUserLoggedIn()))
    //                    {
    //                        load_Data();
    //                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'PAN Number Raject.', type: 'success',});", true);

    //                    }
    //                }
    //                else
    //                {
    //                    load_Data();
    //                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'PAN Already Approved.', type: 'success',});", true);
    //                }


    //            }

    //        }
    //    }
    //}

    //protected void lnkCancelDemate_Click(object sender, EventArgs e)
    //{
    //    GridViewRow gvr = ((LinkButton)sender).Parent.Parent as GridViewRow;
    //    foreach (GridViewRow gv in grdData.Rows)
    //    {
    //        HiddenField hfCustomerDemate = (HiddenField)gv.FindControl("hfCustomerDemate");
    //        GridView grdItemsDemate = (GridView)gv.FindControl("grdItemsDemate");

    //        foreach (GridViewRow gr in grdItemsDemate.Rows)
    //        {

    //            if (grdItemsDemate.Rows.Count != 0)
    //            {
    //                DataTable dt = dl.get_DemateAccountDetails(null, hfCustomerDemate.Value);
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string Adhar = dt.Rows[0]["DemateStatus"].ToString();
    //                    hfDemate.Value = Adhar;
    //                }
    //                if (hfDemate.Value == "Pending")
    //                {
    //                    if (dl.update_DemateAccountDetailsReject(null, hfCustomerDemate.Value, GetUserLoggedIn()))
    //                    {
    //                        load_Data();
    //                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Demate Account Reject.', type: 'success',});", true);

    //                    }
    //                }
    //                else
    //                {
    //                    load_Data();
    //                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Demate Account Already Approved.', type: 'success',});", true);
    //                }


    //            }

    //        }
    //    }
    //}

    //protected void lnkCancelBank_Click(object sender, EventArgs e)
    //{
    //    GridViewRow gvr = ((LinkButton)sender).Parent.Parent as GridViewRow;
    //    foreach (GridViewRow gv in grdData.Rows)
    //    {
    //        HiddenField hfCustomerBank = (HiddenField)gv.FindControl("hfCustomerBank");
    //        GridView grdItemsBank = (GridView)gv.FindControl("grdItemsBank");

    //        foreach (GridViewRow gr in grdItemsBank.Rows)
    //        {

    //            if (grdItemsBank.Rows.Count != 0)
    //            {
    //                DataTable dt = dl.get_BankDetails(null, hfCustomerBank.Value, null);
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string Adhar = dt.Rows[0]["BankStatus"].ToString();
    //                    hfBank.Value = Adhar;
    //                }
    //                if (hfBank.Value == "Pending")
    //                {
    //                    if (dl.update_BankDetailsReject(null, hfCustomerBank.Value, GetUserLoggedIn()))
    //                    {
    //                        load_Data();
    //                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Bank Details Reject.', type: 'success',});", true);

    //                    }
    //                }
    //                else
    //                {
    //                    load_Data();
    //                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Bank Details Already Approved.', type: 'success',});", true);
    //                }


    //            }

    //        }
    //    }
    //}

    protected void grdItems_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}