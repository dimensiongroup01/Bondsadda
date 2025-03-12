using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerKYCDetails : System.Web.UI.Page
{
    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Data();
            BindData();
        }
    }
    private void Data()
    {
        DataTable dt = dl.get_KYCDetails(null, GetUserLoggedIn(), null);
        DataTable dtc = dl.get_AdharDetails(null, GetUserLoggedIn(), null);
        DataTable dtm = dl.get_DemateAccountDetails(null, GetUserLoggedIn());
        if (dt.Rows.Count > 0)
        {

            pnlViewKYCDetails.Visible = true;
            rpt.DataSource = dt;
            rpt.DataBind();

        }
        if (dtc.Rows.Count > 0)
        {
            pnlViewAdhar.Visible = true;
            rptAdhar.DataSource = dtc; rptAdhar.DataBind();
        }
        if (dtm.Rows.Count > 0)
        {
            pnlViewDemate.Visible = true;
            rptDemate.DataSource = dtm; rptDemate.DataBind();
        }
        if (dt.Rows.Count > 0 && dtc.Rows.Count > 0 && dtm.Rows.Count > 0)
        {
            pnlSubmit.Visible = false;
        }

    }
    private void BindData()
    {
        DataTable dtb = dl.get_BankDetails(null, GetUserLoggedIn(), null);
        if (dtb.Rows.Count > 0)
        {

            pnlViewbank.Visible = true;
            rptBank.DataSource = dtb; rptBank.DataBind();
        }
    }

    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        if (txtAccountNumber.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter Account Number..!!!', type: 'error',});", true);
            return;
        }
        if (txtFullName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter Account Holder Name..!!!', type: 'error',});", true);
            return;
        }
        if (txtBankName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter Bank Name..!!!', type: 'error',});", true);
            return;
        }
        if (txtIFSCCode.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter IFSC Code..!!!', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"] == null)
        {
            if (dl.add_BankDetails(null, GetUserLoggedIn(), txtAccountNumber.Text, txtFullName.Text, txtBankName.Text, txtIFSCCode.Text, GetUserLoggedIn()))
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Bank Details Add Successfully', type: 'success',});", true);
                return;
            }

        }
    }
    private string GetUserLoggedIn()
    {

        HttpCookie cookieuser = Request.Cookies["DGBAM"];
        if (cookieuser == null)
        {
            return null;
        }
        else
        {
            return cookieuser.Value.ToString();
        }

    }
    protected void lnkKYCSubmit_Click(object sender, EventArgs e)
    {
        DataTable dt = dl.get_KYCDetails(null, GetUserLoggedIn(), null);
        if (dt.Rows.Count == 0)
        {

            if (dl.add_KYCDetails(null, GetUserLoggedIn(), txtPAN.Text, null, GetUserLoggedIn()))
            {

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'PAN Number Already Exist', type: 'error',});", true);
                return;
            }
        }

        DataTable dtc = dl.get_AdharDetails(null, GetUserLoggedIn(), null);
        if (dtc.Rows.Count == 0)
        {
            if (txtAdhar.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter Adhar Number..!!!', type: 'error',});", true);
                return;
            }
            else
            {
                if (dl.add_AdharDetails(null, GetUserLoggedIn(), txtAdhar.Text, null, GetUserLoggedIn()))
                {

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Adhar Number Already Exist..!!!', type: 'error',});", true);
                    return;
                }
            }
        }
        DataTable dtm = dl.get_DemateAccountDetails(null, GetUserLoggedIn());

        if (dtm.Rows.Count == 0)
        {
            if (txtDemateAccount.Text != "")
            {
                dl.add_DemateAccountDetails(null, GetUserLoggedIn(), txtDemateAccount.Text, null,null, GetUserLoggedIn());
            }
        }



        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Add Successfully', type: 'success',});", true);
        return;

    }
}