using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgetPassword : System.Web.UI.Page
{
    DAL dl = new DAL();
    SendMailSmS smS = new SendMailSmS();
    protected void Page_Load(object sender, EventArgs e)
    {

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
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Email Required..!!!', type: 'error',});", true);
            return;
        }
        if (!IsValidMail(txtEmail.Text))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Email Enter..!!!', type: 'error',});", true);
            return;
        }
        DataTable dtMD = dl.getCustomerPassword(txtEmail.Text);
        if (dtMD.Rows.Count != 0)
        {
            if (new SendMailSmS().sendForgotPasswordMail(dtMD.Rows[0]["CFullName"].ToString(), dtMD.Rows[0]["CEmail"].ToString(), dtMD.Rows[0]["CPassword"].ToString()))
            {
                clear();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Password sent to Mail Please Check Inbox/Spam', type: 'success',});", true);
            }

           
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Invalid Credential..!!!', type: 'error',});", true);
            return;
        }
    }
    private void clear()
    {
        txtEmail.Text = string.Empty;
    }
}