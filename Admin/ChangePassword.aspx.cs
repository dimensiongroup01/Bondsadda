using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ChangePassword : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string GetUserLoggedIn()
    {
        //Grab the cookie
        HttpCookie cookie = Request.Cookies["DGBA"];
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
        if (txtCurrentPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid current password required..!!!', type: 'error',});", true);
            return;
        }
        if (dl.CheckPanelUserPassword(GetUserLoggedIn(), txtCurrentPassword.Text).Rows.Count == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'In-valid current password..!!!', type: 'error',});", true);
            return;
        }
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
            if (dl.updatePanelUserPassword(txtNewPassword.Text, GetUserLoggedIn()))
            {
                //DataTable dtLoginDetails = dl.getAllMembers(GetUserLoggedIn(), null, null, null, null, null);
                //sms.sendUpdatePasswordMail(dtLoginDetails.Rows[0]["MemberName"].ToString(), dtLoginDetails.Rows[0]["Email"].ToString(), dtLoginDetails.Rows[0]["Mobile"].ToString(), dtLoginDetails.Rows[0]["Password"].ToString());

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Password changed/updated Successfully.', type: 'success',});", true);
                clearFields();
                return;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Unable to Update Password..!!!', type: 'error',});", true);
                return;
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'New and Confirm Password must be Same..!!!', type: 'error',});", true);
            return;

        }
    }
    private void clearFields()
    {
        txtCurrentPassword.Text = "";
        txtNewPassword.Text = "";
        TxtCNewPassword.Text = "";
    }
}