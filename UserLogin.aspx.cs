using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Numerics;
using System.Security.Cryptography;


public partial class UserLogin : System.Web.UI.Page
{
    DAL dl = new DAL();
    SendMailSmS sms = new SendMailSmS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlLogin.Visible = true;
            pnlOTP.Visible = false;
            pnlPassword.Visible = false;
        }
    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        string OTP = Generate_otp();
        string User = hfOTP.Value;
        if(txtEmail.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Mobile/Email must be Enter..!!!', type: 'error',});", true);
            return;
        }
        if(!IsValidMail(txtEmail.Text))
        {
            Int64 res;
            if (!Int64.TryParse(txtEmail.Text, out res))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Mobile/Email must be Enter..!!!', type: 'error',});", true);
                return;
            }

        }
    
        if (ViewState["Id"] == null)
        {
            hfOTP.Value = OTP;
            if (sms.sendOTPMailVerification(null, OTP, txtEmail.Text))
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'OTP send to Email', type: 'success',});", true);
                pnlOTP.Visible = true;
                pnlLogin.Visible = false;
                pnlPassword.Visible=false;
            }
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

    protected void lnkForget_Click(object sender, EventArgs e)
    {
        pnlLogin.Visible = false;
        pnlOTP.Visible = true;
    }
    protected void lnkBackLogin_Click(object sender, EventArgs e)
    {
        pnlLogin.Visible = true;
        pnlOTP.Visible = false;
    }



    protected void lnkOTPSubmit_Click(object sender, EventArgs e)
    {
        if (hfOTP.Value == (txtOTP.Text))
        {
            DataTable dt = dl.CheckCustomerLogin(txtEmail.Text);
            if(dt.Rows.Count > 0)
            {
                WriteCookie(dt.Rows[0]["CustomerId"].ToString());
                Response.Redirect("~/UserPanel/Dashboard.aspx");
            }
            else
            {
                if (!IsValidMail(txtEmail.Text))
                {
                    Int64 parsedValue;
                    if (Int64.TryParse(txtEmail.Text, out parsedValue))
                    {
                       int IId= new DAL().AddCustomerMobile(null, txtEmail.Text);
                        if(IId >0)
                        {
                            WriteCookie(IId.ToString());
                            Response.Redirect("~/UserPanel/Dashboard.aspx");
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Enter Valid Mobile/Email', type: 'error',});", true);
                        return;
                    }

                }
                else
                {
                    int IIId = new DAL().AddCustomerEmail(null, txtEmail.Text);
                    if(IIId >0) 
                    {
                        WriteCookie(IIId.ToString());
                        Response.Redirect("~/UserPanel/Dashboard.aspx");
                    }
                }
            }

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Please Enter Correct OTP', type: 'error',});", true);
            return;
        }
    }

    protected void lnkPassword_Click(object sender, EventArgs e)
    {
        if(txtPassword.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Please Enter Password', type: 'error',});", true);
            return;
        }

        DataTable dt = dl.CheckCustomerPassword(txtEmail.Text,txtPassword.Text);
        if(dt.Rows.Count > 0)
        {
            string Pass = dt.Rows[0]["CPassword"].ToString();
            hfPassword.Value = Pass;
            if (hfPassword.Value == txtPassword.Text)
            {
                WriteCookie(dt.Rows[0]["CustomerId"].ToString());
                Response.Redirect("~/UserPanel/Dashboard.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Invalid Password', type: 'error',});", true);
                return;
            }
        }

        
    }


    protected void BackToOTP_Click(object sender, EventArgs e)
    {
        pnlLogin.Visible = false;
        pnlOTP.Visible = true;
        pnlPassword.Visible = false;
    }

    protected void lnkBackToPassword_Click(object sender, EventArgs e)
    {
        pnlLogin.Visible = false;
        pnlOTP.Visible = false;
        pnlPassword.Visible = true;
    }

    private void WriteCookie(string CustomerId)
    {
        //Create a new cookie, passing the name into the constructor
        HttpCookie cookie = new HttpCookie("DGBAS");
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
}