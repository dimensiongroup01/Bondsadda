using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class login : System.Web.UI.Page
{
    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            votp.Visible = false;
            vmobile.Visible = true;
            lnkSubmit.Visible = false;
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
    protected void lnkGetOTP_Click(object sender, EventArgs e)
    {
        string otp = Generate_otp();
        if (txtUserName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Mobile must be Added..!!!', type: 'error',});", true);
            return;
        }
        DataTable dt = dl.CheckMobileNumberExist(txtUserName.Text);
        if(dt.Rows.Count > 0)
        {
            hfOTP.Value = otp;
            new MSG91SMS().sendOTP(txtUserName.Text, otp);
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'OTP sent to your mobile no..!!!', type: 'success',});", true);
            votp.Visible = true;
            vmobile.Disabled = true;
            lnkSubmit.Visible = true;
            lnkGetOTP.Visible = false;
        }
    }
}