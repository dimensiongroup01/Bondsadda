using DocumentFormat.OpenXml.Drawing;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    DAL dl = new DAL();
    SendMailSmS sms = new SendMailSmS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            votp.Visible = false;
            lnkSubmit.Visible = false;
            pnlResend.Visible = false; 
            //pnlResendOTP.Visible = false;
        }
    }

    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        if (hfOTP.Value == (txtOTP.Text))
        {
            DataTable dtUserDetails = dl.CheckMobileNumberExist(txtUserName.Text);
            if (dtUserDetails != null && dtUserDetails.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Login Successfully..!!!', type: 'success',});", true);
                string ReturnUrl = Convert.ToString(Request.QueryString["url"]);
                if (!string.IsNullOrEmpty(ReturnUrl))
                {
                    WriteCookie(dtUserDetails.Rows[0]["CustomerId"].ToString());
                    Response.Redirect(ReturnUrl);
                }
                else
                {
                    WriteCookie(dtUserDetails.Rows[0]["CustomerId"].ToString());

                    Response.Redirect("index");
                }


            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Invalid Credential..!!!', type: 'error',});", true);
                return;
            }

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Please Enter Correct OTP', type: 'error',});", true);
        }

    }
    private void WriteCookie(string CustomerId)
    {
        //Create a new cookie, passing the name into the constructor
        HttpCookie cookie = new HttpCookie("DGBAM");
        //Set the cookies value
        cookie.Value = CustomerId;
        //cookie.Path = "/; SameSite=None";
        //      cookie.Secure = true;
        //        cookie.HttpOnly = true;

        //Set the cookie to expire in 1 minute
        DateTime dtNow = DateTime.Now;
        TimeSpan tsMinute = new TimeSpan(2, 0, 0, 0);
        cookie.Expires = dtNow + tsMinute;

        //Add the cookie
        Response.Cookies.Add(cookie);
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
    protected void lnkGetOTP_Click(object sender, EventArgs e)
    {
        string otp = Generate_otp();
        string Mobile = null, Email = null;
        if (txtUserName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Mobile must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (!IsValidMail(txtUserName.Text))
        {
            Mobile = txtUserName.Text;
        }
        else
        {
            Email = txtUserName.Text;
        }
        DataTable dt = dl.CheckMobileNumberExist(txtUserName.Text);
        if (dt.Rows.Count > 0)
        {
            if (Mobile != null)
            {
                hfOTP.Value = otp;
                new MSG91SMS().sendOTP("91" + Mobile, otp);
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'OTP sent to your mobile no..!!!', type: 'success',});", true);
                votp.Visible = true;
                txtUserName.ReadOnly = true;
                lnkSubmit.Visible = true;
                lnkGetOTP.Visible = false;
                pnlResend.Visible = true;
                ScriptManager.RegisterStartupScript(Page, GetType(), "lnkresendotp", "<script>lnkresendotp()</script>", false);
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Otp send your mobile ...!!!', type: 'success',});", true);

            }
            else
            {
                hfOTP.Value = otp;
                sendMailMSG91(Email, otp);
                //  sms.sendSignInOtp(txtUserName.Text,otp);
                votp.Visible = true;
                txtUserName.ReadOnly = true;
                lnkSubmit.Visible = true;
                lnkGetOTP.Visible = false;
                pnlResend.Visible = true;
                ScriptManager.RegisterStartupScript(Page, GetType(), "lnkresendotp", "<script>lnkresendotp()</script>", false);
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Otp send your mail plz check mail/span ...!!!', type: 'success',});", true);

            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Mobile/Email number not registered..!!!', type: 'error',});", true);
            return;
        }
    }

    protected void lnkResend_Click(object sender, EventArgs e)
    {

        string otp = Generate_otp();
        string Mobile = null, Email = null;
        if (txtUserName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Mobile must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (!IsValidMail(txtUserName.Text))
        {
            Mobile = txtUserName.Text;
        }
        else
        {
            Email = txtUserName.Text;
        }
        DataTable dt = dl.CheckMobileNumberExist(txtUserName.Text);
        if (dt.Rows.Count > 0)
        {
            if (Mobile != null)
            {
                hfOTP.Value = otp;
                new MSG91SMS().sendOTP("91" + txtUserName.Text, otp);
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'OTP sent to your mobile no..!!!', type: 'success',});", true);
                votp.Visible = true;
                txtUserName.ReadOnly = true;
                lnkSubmit.Visible = true;
                lnkGetOTP.Visible = false;
                ScriptManager.RegisterStartupScript(Page, GetType(), "lnkresendotp", "<script>lnkresendotp()</script>", false);
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Otp send your mobile ...!!!', type: 'success',});", true);

            }
            else
            {
                //sms.sendSignInOtp(txtUserName.Text, hfOTP.Value);
                sendMailMSG91(Email, otp);
                votp.Visible = true;
                txtUserName.ReadOnly = true;
                lnkSubmit.Visible = true;
                lnkGetOTP.Visible = false;
                ScriptManager.RegisterStartupScript(Page, GetType(), "lnkresendotp", "<script>lnkresendotp()</script>", false);
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Otp send your mail plz check mail/span ...!!!', type: 'success',});", true);

            }
        }
    }

    private void sendMailMSG91(string eMail, string otp)
    {
        List<Recipient> _recipients = new List<Recipient>();
        Recipient recipient = new Recipient();
        List<To> to = new List<To>();
        To _to = new To();
        _to.email = eMail;
        Variables _var = new Variables();
        _var.otp = otp;
        _var.company_name = "Bonds Adda";
        to.Add(_to);
        recipient.to = to;
        recipient.variables = _var;
        _recipients.Add(recipient);
        new MSG91mail().send_Mail_Otp(_recipients);
    }

}