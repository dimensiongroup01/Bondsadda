using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {

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
        if(txtPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid current password required..!!!', type: 'error',});", true);
            return;
        }
        if (dl.CheckCustomerPasswordReset(GetUserLoggedIn(), txtPassword.Text).Rows.Count == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'In-valid current password..!!!', type: 'error',});", true);
            return;
        }
        if (txtNewPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'New password required..!!!', type: 'error',});", true);
            return;
        }
        if(txtCPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Confirm password required..!!!', type: 'error',});", true);
            return;
        }
        if(txtNewPassword.Text == txtCPassword.Text)
        {
            if (dl.updateCustomerPassword(txtNewPassword.Text, GetUserLoggedIn()))
            {
                //DataTable dtLoginDetails = dl.getAllMembers(GetUserLoggedIn(), null, null, null, null, null);
                //sms.sendUpdatePasswordMail(dtLoginDetails.Rows[0]["MemberName"].ToString(), dtLoginDetails.Rows[0]["Email"].ToString(), dtLoginDetails.Rows[0]["Mobile"].ToString(), dtLoginDetails.Rows[0]["Password"].ToString());

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Password changed/updated Successfully.', type: 'success',});", true);
                clear();
                return;
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Password MisMatch..!!!', type: 'error',});", true);
            return;
        }
    }
    private void clear()
    {
        txtPassword.Text = string.Empty;
        txtNewPassword.Text = string.Empty;
        txtCPassword.Text = string.Empty;
    }
}