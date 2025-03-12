using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_CustomerDetails : System.Web.UI.Page
{

    DAL dl = new DAL();
    SendMailSmS sms = new SendMailSmS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindData();
            pnlView.Visible = true;
            pnlUpdate.Visible = false;
            pnlPassOTP.Visible = false;
        }
    }
    private string GetUserLoggedIn()
    {

        HttpCookie cookieuser = Request.Cookies["DGBAS"];
        if (cookieuser == null)
        {
            return null;
        }
        else
        {
            return cookieuser.Value.ToString();
        }

    }
    private void BindData()
    {
        DataTable dt = dl.getCustomer(GetUserLoggedIn(), null);
        if(dt.Rows.Count > 0)
        {
            lblFullName.Text = dt.Rows[0]["CFullName"].ToString();
            lblEmail.Text = dt.Rows[0]["CEmail"].ToString();
            lblMobile.Text = dt.Rows[0]["CMobile"].ToString();
            hfEmail.Value = lblEmail.Text;
        }
    }
    private void clear()
    {
        txtFullName.Text = string.Empty;
        txtMobile.Text = string.Empty;
        txtEmail.Text = string.Empty;

    }
    protected void lnkUpdate_Click(object sender, EventArgs e)
    {
        if(txtFullName.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter FullName', type: 'error',});", true);
            return;
        }
        if(txtMobile.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter Mobile Number', type: 'error',});", true);
            return;
        }
        if(txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter Email', type: 'error',});", true);
            return;
        }


        if (dl.UpdateCustomerDetails(GetUserLoggedIn(), txtFullName.Text, txtMobile.Text, txtEmail.Text))
        {
            clear();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Profile Update Successfully', type: 'success',});", true);
            return;
        }
        
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Password Mismatch', type: 'error',});", true);
            return;
        }
    }

    protected void lnkProfileUpdate_Click(object sender, EventArgs e)
    {
        pnlView.Visible = false;
        pnlUpdate.Visible = true;
        DataTable dt = dl.getCustomer(GetUserLoggedIn(), null);
        if(dt.Rows.Count>0)
        {
            txtFullName.Text = dt.Rows[0]["CFullName"].ToString();
            txtMobile.Text = dt.Rows[0]["CMobile"].ToString();
            txtEmail.Text = dt.Rows[0]["CEmail"].ToString();
        }

    }

    protected void lnkViewDetails_Click(object sender, EventArgs e)
    {
        pnlView.Visible = true;
        pnlUpdate.Visible = false;
    }



    protected void lnkChange_Click(object sender, EventArgs e)
    {
        string OTP = Generate_otp();
        if(txtNewPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'New Password', type: 'error',});", true);
            return;
        }
        if(txtConfirmPass.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Confirm Password', type: 'error',});", true);
            return;
        }
        hfOTP.Value = OTP;
        if (sms.sendOTPMailVerification(null, OTP, hfEmail.Value))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'OTP send to mail', type: 'success',});", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Some error occur', type: 'error',});", true);
        }
        pnlpass.Visible = false;
        pnlPassOTP.Visible = true;
    }
    protected string Generate_otp()
    {
        char[] charArr = "0123456789".ToCharArray();
        string strrandom = string.Empty;
        Random objran = new Random();
        for (int i = 0; i < 6; i++)
        {
            //It will not allow Repetation of Characters
            int pos = objran.Next(1, charArr.Length);
            if (!strrandom.Contains(charArr.GetValue(pos).ToString())) strrandom += charArr.GetValue(pos);
            else i--;
        }
        return strrandom;
    }
    public bool IsValidMail(string emailaddress)
    {
        try
        {
            MailAddress m = new MailAddress(emailaddress);
            return true;
        }
        catch (FormatException)
        {
            return false;
        }
    }
    private void clears()
    {
        txtNewPassword.Text = string.Empty;
        txtConfirmPass.Text = string.Empty;
    }
    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        pnlView.Visible = false;
        pnlUpdate.Visible = true;
        DataTable dtm = dl.getCustomer(GetUserLoggedIn(), null);
        if(dtm.Rows.Count>0)
        {
            txtFullName.Text = dtm.Rows[0]["CFullName"].ToString();
            txtMobile.Text = dtm.Rows[0]["CMobile"].ToString();
            txtEmail.Text = dtm.Rows[0]["CEmail"].ToString();
        }
    }

    protected void lnkCancel_Click(object sender, EventArgs e)
    {
        pnlView.Visible = true;
        pnlUpdate.Visible = false;
    }

    protected void lnkPassOTP_Click(object sender, EventArgs e)
    {
       
        if(hfOTP.Value == txtOTP.Text)
        {
            if(dl.updateCustomerPassword(txtNewPassword.Text,GetUserLoggedIn()))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Password Change Successfully', type: 'success',});", true);
                pnlpass.Visible = false;
                pnlPassOTP.Visible = false;
                pnlView.Visible = true;
                pnlUpdate.Visible = false;
            }
        }
    }
}