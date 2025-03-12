using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    DAL dl = new DAL(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlLogin.Visible = true;
            pnlForget.Visible = false;
        }
    }
    private void claer()
    {
        txtEmail.Text = string.Empty;
    }
    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid User Name must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (txtPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Password must be Added..!!!', type: 'error',});", true);
            return;
        }
        DataTable dtUserDetails = dl.CheckPanelLogin(txtUserName.Text, txtPassword.Text);


        if (dtUserDetails != null && dtUserDetails.Rows.Count > 0)
        {
            string user = dtUserDetails.Rows[0]["UserId"].ToString();
            DataTable dt = dl.CheckPanelMenuMainPermission(user, true);
            if (dt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Login Successfully..!!!', type: 'success',});", true);


                WriteCookie(dtUserDetails.Rows[0]["UserId"].ToString());
                Response.Redirect("~/Admin/Dashboard.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'No Any Permission given..!!!', type: 'error',});", true);
                return;
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Invalid Credential..!!!', type: 'error',});", true);
            return;
        }
    }

    protected void lnkReset_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Email Required..!!!', type: 'error',});", true);
            return;
        }

        DataTable dtMD = dl.getPanelUserPassword(txtEmail.Text);
        if (dtMD.Rows.Count != 0)
        {
            new SendMailSmS().sendForgotPasswordMail(dtMD.Rows[0]["FullName"].ToString(), dtMD.Rows[0]["Email"].ToString(), dtMD.Rows[0]["Password"].ToString());

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Password sent to Mail Please Check Inbox/Spam', type: 'success',});", true);
            claer();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Invalid Credential..!!!', type: 'error',});", true);
            return;
        }
    }

    protected void lnkForget_Click(object sender, EventArgs e)
    {
        pnlLogin.Visible = false;
        pnlForget.Visible = true;
    }
    protected void lnkBackLogin_Click(object sender, EventArgs e)
    {
        pnlLogin.Visible = true;
        pnlForget.Visible = false;
    }

    private void WriteCookie(string UserId)
    {
        //Create a new cookie, passing the name into the constructor
        HttpCookie cookie = new HttpCookie("DGBA");
        //Set the cookies value
        cookie.Value = UserId;
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