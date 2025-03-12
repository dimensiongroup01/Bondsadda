using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnqueryForm : System.Web.UI.Page
{

    DAL dl = new DAL();
    Random rnd = new Random();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            generateCaptcha();
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
    private void generateCaptcha()
    {
        int length = 4;
        const string pool = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var chars = Enumerable.Range(0, length).Select(x => pool[rnd.Next(0, pool.Length)]);
        lblCaptcha.Text = new string(chars.ToArray());
    }
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        if (txtFirstName.Text == "")
        {

            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid First Name Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (txtLastName.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Last Name Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (txtMobile.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Mobile Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Email Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (!IsValidMail(txtEmail.Text))
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Email Must be Added ..!!!', type: 'error',});", true);
            return;
        }

        if (txtMessage.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Message Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (txtCapchaCode.Text != lblCaptcha.Text)
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Security code Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"] == null)
        {
            if (dl.AddLeadForm(null, txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtMobile.Text, txtMessage.Text))
            {
                clears();
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                Response.Redirect("Index");
            }
        }
    }

    private void clears()
    {
        txtFirstName.Text = string.Empty;
        txtLastName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtMobile.Text = string.Empty;
        txtMessage.Text = string.Empty;
        txtCapchaCode.Text = string.Empty;
        ViewState["Id"] = null;
    }
    protected void lnkRefresh_Click(object sender, EventArgs e)
    {
        generateCaptcha();
    }
}