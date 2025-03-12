using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Reflection.Emit;

public partial class IDProofDetails : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            pnlADD.Visible = true;
            pnlView.Visible = false;
            if (GetUserLoggedIn() !=null)
            {
                BindData();
            }

        }
    }

    private void BindData()
    {
        DataTable dtc = dl.get_BankDetails(null, GetUserLoggedIn(), null);
        DataTable dt = dl.getCustomerKYC(GetUserLoggedIn(), null);
        if (dt.Rows.Count > 0)
        {
            hfAdhar.Value = dt.Rows[0]["AdharStatus"].ToString();
            hfPAN.Value = dt.Rows[0]["Status"].ToString();
            hfDemate.Value = dt.Rows[0]["DemateStatus"].ToString();
        }
        if(dtc.Rows.Count > 0)
        {
            hfBankDetail.Value = dtc.Rows[0]["BankStatus"].ToString();
        }

        DataTable dtm = dl.get_AdharDetails(null,GetUserLoggedIn(), null);
        if(dtm.Rows.Count > 0)
        {
            pnlADD.Visible = false;
            pnlView.Visible = true;
            rptBind.DataSource = dl.getCustomerKYC(GetUserLoggedIn(), null);
            rptBind.DataBind();
        }
        if (hfAdhar.Value == "Approved" && hfPAN.Value == "Approved" && hfDemate.Value == "Approved" && hfBankDetail.Value == "Approved")
        {
            lblStatus.Text = "Approved";
            lblStatus.ForeColor = Color.Green;
        }
        else
        {
            lblStatus.Text = "Pending";
            lblStatus.ForeColor = Color.OrangeRed;
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
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        
        if (txtPAN.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'PAN Number Required', type: 'error',});", true);
            return;
        }
        if (txtAdhar.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter Adhar Number..!!!', type: 'error',});", true);
            return;
        }
        DataTable dt = dl.get_KYCDetails(null, GetUserLoggedIn(), null);
        if (dt.Rows.Count == 0)
        {
            if (dl.add_KYCDetails(null, GetUserLoggedIn(), txtPAN.Text, txtDescription.Text, GetUserLoggedIn()))
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
            if (txtAdhar.Text != "")
            {
                if (dl.add_AdharDetails(null, GetUserLoggedIn(), txtAdhar.Text, txtDescription.Text, GetUserLoggedIn()))
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
            if (txtDemate.Text != "" || txtClientId.Text !="")
            {
                dl.add_DemateAccountDetails(null, GetUserLoggedIn(), txtDemate.Text,txtDescription.Text,txtClientId.Text, GetUserLoggedIn());
            }
        }

        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Add Successfully', type: 'success',});", true);
       
        ScriptManager.RegisterStartupScript(this, GetType(), "BankDetails", "window.open('BankDetails');", true);
    }

    protected void rptBind_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton lnkReSubmit = e.Item.FindControl("lnkReSubmit") as LinkButton;
            TextBox txt1 = (e.Item.FindControl("TextBox1") as TextBox);
            if (hfPAN.Value == "Pending")
            {
                txt1.BorderColor = Color.LightYellow;
                txt1.BorderWidth = 1;
                txt1.ReadOnly = true;
                txt1.Attributes.CssStyle.Add("background", "#ffc10733");
               
            }
            if (hfPAN.Value == "Approved")
            {
                txt1.BorderColor = Color.DarkGreen;
                txt1.BorderWidth = 1;
                txt1.ReadOnly = true;
                txt1.Attributes.CssStyle.Add("background", "#28a74524");
            }
            if(hfPAN.Value == "Reject")
            {
                txt1.BackColor = Color.White;
                txt1.BorderWidth = 2;
                txt1.ReadOnly = false;
                txt1.BorderColor = Color.OrangeRed;
            }
            TextBox txt2 = (e.Item.FindControl("TextBox2") as TextBox);
            if (hfAdhar.Value == "Pending")
            {
                txt2.BorderColor = Color.LightYellow;
                txt2.BorderWidth = 1;
                txt2.ReadOnly = true;
                txt2.Attributes.CssStyle.Add("background", "#ffc10733");


            }
            if (hfAdhar.Value == "Approved")
            {
                txt2.BorderColor = Color.DarkGreen;
                txt2.BorderWidth = 1;
                txt2.ReadOnly = true;
                //txt2.Attributes.CssStyle.Add("border-color", "#28a745");
                txt2.Attributes.CssStyle.Add("background", "#28a74524");
            }
            if(hfAdhar.Value == "Reject")
            {

                txt2.BackColor = Color.White;
                txt2.BorderWidth = 1;
                txt2.ReadOnly = false;
                txt2.BorderColor = Color.OrangeRed;
            }
            TextBox txt3 = (e.Item.FindControl("TextBox3") as TextBox);
            TextBox txt5 = (e.Item.FindControl("TextBox5") as TextBox);
            if (hfDemate.Value == "Pending")
            {
                txt3.BorderColor = Color.Yellow;
                txt3.BorderWidth = 1;
                txt3.ReadOnly = true;
                txt3.Attributes.CssStyle.Add("background", "#ffc10733");
                txt5.BorderColor = Color.Yellow;
                txt5.BorderWidth = 1;
                txt5.ReadOnly = true;
                txt5.Attributes.CssStyle.Add("background", "#ffc10733");

            }
            if (hfDemate.Value == "Approved")
            {
                txt3.BorderColor = System.Drawing.Color.DarkGreen;
                txt3.BorderWidth = 1;
                txt3.ReadOnly = true;
                txt2.Attributes.CssStyle.Add("background", "#28a74524");
                txt5.BorderColor = System.Drawing.Color.DarkGreen;
                txt5.BorderWidth = 1;
                txt5.ReadOnly = true;
                txt5.Attributes.CssStyle.Add("background", "#28a74524");
            }
            if(hfDemate.Value == "Reject")
            {
                txt3.BackColor = Color.White;
                txt3.ReadOnly = false;
                txt3.BorderWidth = 1;
                txt3.BorderColor = Color.DarkOrange;
                txt5.BackColor = Color.White;
                txt5.ReadOnly = false;
                txt5.BorderWidth = 1;
                txt5.BorderColor = Color.DarkOrange;
            }
            if(hfAdhar.Value =="Pending" || hfAdhar.Value =="Approved" && hfPAN.Value=="Pending" || hfPAN.Value=="Approved" && hfDemate.Value=="Pending" || hfDemate.Value == "Approved")
            {
                lnkReSubmit.Visible = false;
            }
            else
            {
                lnkReSubmit.Visible=true;
            }
        }
    }

    protected void lnkView_Click(object sender, EventArgs e)
    {
        Response.Redirect("BankDetails");
    }


    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {

    }


    protected void lnkReSubmit_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptBind.Items)
        {

            TextBox box = (TextBox)item.FindControl("TextBox1");
            TextBox box1 = (TextBox)item.FindControl("TextBox2");
            TextBox box2 = (TextBox)item.FindControl("TextBox3");
            TextBox box5 = (TextBox)item.FindControl("TextBox5");
            if (box.Text != "")
            {
                if (hfPAN.Value != "Pending" && hfPAN.Value != "Approved")
                {
                    dl.update_KYCDetailsRe(null, GetUserLoggedIn(), box.Text, null);
                }
            }
            if (box1.Text !="")
            {
                if (hfAdhar.Value != "Pending" && hfAdhar.Value != "Approved")
                {
                    dl.update_AdharDetailsRe(null, GetUserLoggedIn(), box1.Text, null);
                }
            }
            if(box2.Text !="" || box5.Text !="")
            {
                if(hfDemate.Value !="Pending" && hfDemate.Value !="Approved")
                {
                    dl.update_DemateAccountDetailsRe(null,GetUserLoggedIn(), box2.Text,box5.Text, null);  
                }
            }
        }
    }
}