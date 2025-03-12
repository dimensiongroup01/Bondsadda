using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BankDeails : System.Web.UI.Page
{
    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlADD.Visible = true;
            pnlView.Visible = false;
            if (GetUserLoggedIn() != null)
            {
                BindData();
            }

        }
    }

    private void BindData()
    {
        DataTable dt = dl.get_BankDetails(null, GetUserLoggedIn(), null);
        DataTable dtc = dl.getCustomerKYC(GetUserLoggedIn(), null);
        if (dtc.Rows.Count > 0)
        {
            hfAdhar.Value = dtc.Rows[0]["AdharStatus"].ToString();
            hfPAN.Value = dtc.Rows[0]["Status"].ToString();
            hfDemate.Value = dtc.Rows[0]["DemateStatus"].ToString();
        }
        if (dt.Rows.Count > 0)
        {
            hfBank.Value = dt.Rows[0]["BankStatus"].ToString();
            if (hfAdhar.Value == "Approved" && hfPAN.Value == "Approved" && hfDemate.Value == "Approved" && hfBank.Value == "Approved")
            {
                lblStatus.Text = "Approved";
                lblStatus.ForeColor = Color.Green;
            }
            else
            {
                lblStatus.Text = "Pending";
                lblStatus.ForeColor = Color.OrangeRed;
            }
            if(hfBank.Value == "Pending" || hfBank.Value == "Approved")
            {
                pnlADD.Visible = false;
                pnlView.Visible = true;
            }
            else
            {
                pnlADD.Visible = true;
                pnlView.Visible = false;
            }
            rptBind.DataSource = dl.get_BankDetails(null, GetUserLoggedIn(), null);
            rptBind.DataBind();
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
    private void clear()
    {
        txtAccountNumber.Text = string.Empty;
        txtBankName.Text = string.Empty;
        txtFullName.Text = string.Empty;
        txtIFSCCode.Text = string.Empty;
    }
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        if(txtAccountNumber.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Account Number Required', type: 'error',});", true);
            return;
        }
        if(txtFullName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Account Holder Name Required', type: 'error',});", true);
            return;
        }
        if(txtBankName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Bank Name Required', type: 'error',});", true);
            return;
        }
        if(txtIFSCCode.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'IFSC Code Required', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"] == null)
        {
            if (dl.add_BankDetails(null, GetUserLoggedIn(), txtAccountNumber.Text, txtFullName.Text, txtBankName.Text, txtIFSCCode.Text, GetUserLoggedIn()))
            {
                clear();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Bank Details Add Successfully', type: 'success',});", true);
                return;
            }

        }
    }

    protected void lnkView_Click(object sender, EventArgs e)
    {
        Response.Redirect("IDProofDetails");
    }

    protected void rptBind_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            TextBox txt1 = (e.Item.FindControl("TextBox1") as TextBox);
            if (hfBank.Value == "Pending")
            {
                txt1.BorderColor = Color.LightYellow;
                txt1.BorderWidth = 1;
                txt1.ReadOnly = true;
                txt1.Attributes.CssStyle.Add("background", "#ffc10733");
            }
            if (hfBank.Value == "Approved")
            {
                txt1.BorderColor = Color.DarkGreen;
                txt1.BorderWidth = 1;
                txt1.ReadOnly = true;
                txt1.Attributes.CssStyle.Add("background", "#28a74524");
            }
            if (hfBank.Value == "Reject")
            {
                txt1.BackColor = Color.White;
                txt1.BorderWidth = 2;
                txt1.ReadOnly = false;
                txt1.BorderColor = Color.OrangeRed;
            }
            TextBox txt2 = (e.Item.FindControl("TextBox2") as TextBox);
            if (hfBank.Value == "Pending")
            {
                txt2.BorderColor = Color.LightYellow;
                txt2.BorderWidth = 1;
                txt2.ReadOnly = true;
                txt2.Attributes.CssStyle.Add("background", "#ffc10733");
            }
            if (hfBank.Value == "Approved")
            {
                txt2.BorderColor = Color.DarkGreen;
                txt2.BorderWidth = 1;
                txt2.ReadOnly = true;
                txt2.Attributes.CssStyle.Add("background", "#28a74524");
            }
            if (hfBank.Value == "Reject")
            {
                txt2.BackColor = Color.White;
                txt2.BorderWidth = 2;
                txt2.ReadOnly = false;
                txt2.BorderColor = Color.OrangeRed;
            }
            TextBox txt3 = (e.Item.FindControl("TextBox3") as TextBox);
            if (hfBank.Value == "Pending")
            {
                txt3.BorderColor = Color.LightYellow;
                txt3.BorderWidth = 1;
                txt3.ReadOnly = true;
                txt3.Attributes.CssStyle.Add("background", "#ffc10733");
            }
            if (hfBank.Value == "Approved")
            {
                txt3.BorderColor = Color.DarkGreen;
                txt3.BorderWidth = 1;
                txt3.ReadOnly = true;
                txt3.Attributes.CssStyle.Add("background", "#28a74524");
            }
            if (hfBank.Value == "Reject")
            {
                txt3.BackColor = Color.White;
                txt3.BorderWidth = 2;
                txt3.ReadOnly = false;
                txt3.BorderColor = Color.OrangeRed;
            }
            TextBox txt4 = (e.Item.FindControl("TextBox4") as TextBox);
            if (hfBank.Value == "Pending")
            {
                txt4.BorderColor = Color.LightYellow;
                txt4.BorderWidth = 1;
                txt4.ReadOnly = true;
                txt4.Attributes.CssStyle.Add("background", "#ffc10733");
            }
            if (hfBank.Value == "Approved")
            {
                txt4.BorderColor = Color.DarkGreen;
                txt4.BorderWidth = 1;
                txt4.ReadOnly = true;
                txt4.Attributes.CssStyle.Add("background", "#28a74524");
            }
            if (hfBank.Value == "Reject")
            {
                txt4.BackColor = Color.White;
                txt4.BorderWidth = 2;
                txt4.ReadOnly = false;
                txt4.BorderColor = Color.OrangeRed;
            }
        }
    }
}