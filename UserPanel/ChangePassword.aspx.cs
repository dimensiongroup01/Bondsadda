using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_ChangePassword : System.Web.UI.Page
{
    DAL dl = new DAL();
    SendMailSmS sms = new SendMailSmS();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            getdata();
            pnlpass.Visible = true;
            pnlOTP.Visible = false;
        }
    }
    private void getdata()
    {
        DataTable dt = dl.getCustomer(GetUserLoggedIn(), null);
        if (dt.Rows.Count > 0)
        {
            string Email = dt.Rows[0]["CEmail"].ToString();
            hfEmail.Value = Email;
        }
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
    private string GetUserLoggedIn()
    {
        //Grab the cookie
        HttpCookie cookie = Request.Cookies["DGBAS"];
        //Check to make sure the cookie exists
        if (cookie == null)
        {
            return null;
        }
        else
        {
            return cookie.Value.ToString();
        }
    }
    protected void lnkAdd_Click(object sender, EventArgs e)
    {
        string OTP = Generate_otp();
        if (txtNewPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'New password required..!!!', type: 'error',});", true);
            return;
        }
        if (TxtCNewPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Confirm password required..!!!', type: 'error',});", true);
            return;
        }
        if (txtNewPassword.Text == TxtCNewPassword.Text)
        {
            hfOTP.Value = OTP;
            if (sms.sendOTPMailVerification(null, OTP, hfEmail.Value))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'OTP send to mail', type: 'success',});", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Some error occur', type: 'error',});", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'New and Confirm Password must be Same..!!!', type: 'error',});", true);
            return;

        }
        pnlOTP.Visible = true;
        pnlpass.Visible = false;
    }
    private void clearFields()
    {

        txtNewPassword.Text = "";
        TxtCNewPassword.Text = "";
    }

    protected void lnkSubmot_Click(object sender, EventArgs e)
    {
        if (hfOTP.Value == txtOTP.Text)
        {
            if (dl.updateCustomerPassword(txtNewPassword.Text, GetUserLoggedIn()))
            {
                clearFields();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Password Change Successfully', type: 'success',});", true);
                Response.Redirect("UserProfile.aspx");
            }
        }
    }
}