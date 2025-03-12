using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Net.Mail;
using System.Reflection;
using System.ServiceModel.Security;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Signup : System.Web.UI.Page
{

    DAL dl = new DAL();
    SendMailSmS sms = new SendMailSmS();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private String generateReferalCode()
    {
        string CustomerCode = "BA" + new Random().Next(1, 999999).ToString("D5");
        DataTable dtMem = dl.CheckReferalCodeExists(CustomerCode);
        if (dtMem.Rows.Count != 0)
        {
            return generateReferalCode();
        }
        else
        {
            return CustomerCode;
        }
    }
    private void Clear()
    {
        txtFullName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtMobile.Text = string.Empty;
        txtPassword.Text = string.Empty;
        txtCPassword.Text = string.Empty;
        txtDateOfBirth.Text = string.Empty;
        
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

        string referal = generateReferalCode();
        if (txtFullName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Full Name Required ...!!!'); type : 'success'", true);
            return;
        }
        if (txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Email Required ...!!!'); type : 'success'", true);
            return;
        }
        if (!IsValidMail(txtEmail.Text))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Valid Email Required..!!!'); type : 'success'", true);
            return;
        }
        if (dl.CheckCustomerLogin(txtEmail.Text).Rows.Count != 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Email already registered..!!!'); type : 'success'", true);
            return;
        }
        if (txtMobile.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Mobile Required..!!!'); type : 'success'", true);
            return;
        }
        if (dl.CheckCustomerLogin(txtMobile.Text).Rows.Count != 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Mobile already registered..!!!'); type : 'success'", true);
            return;
        }
        if(txtDateOfBirth.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Date of Birth Required..!!!'); type : 'success'", true);
            return;
        }
        if (txtPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Password Required..!!!'); type : 'success'", true);
            return;
        }
        if (txtCPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Confirm Password Required..!!!'); type : 'success'", true);
            return;
        }
        if (txtPassword.Text == txtCPassword.Text)
        {
            pnlbtn.Visible = false;
            lnkSubmit.Visible = false;
            int IId = dl.AddCustomer(null,referal, txtFullName.Text, txtEmail.Text, txtMobile.Text, txtPassword.Text,hfAdminUser.Value,txtDateOfBirth.Text);
            if (IId != 0)
            {
                int IIdd = dl.add_RMAssign(null, IId.ToString());
                if (IIdd != 0)
                {
                    DataTable dt = dl.get_RMAssign(IIdd.ToString(), null, null, null);
                    if (dt.Rows.Count > 0)
                    {
                        string UserId = dt.Rows[0]["UserId"].ToString();
                        string fullName = dt.Rows[0]["FullName"].ToString();
                        string email = dt.Rows[0]["Email"].ToString();
                        sms.sendRMClientInformation(fullName, txtFullName.Text, email, txtEmail.Text, txtMobile.Text, "Pending");
                        dl.UpdateRMAssignId(IId.ToString(), UserId);
                    }

                }
                dl.add_ReAssignLog(null, IId.ToString(), null);
                sendMailMSG91(txtEmail.Text, txtFullName.Text);

                //DataTable dtm = dl.getCustomer(IId.ToString(), null);
                //if (dtm.Rows.Count > 0)
                //{
                //    pnlbtn.Visible = false;
                //    new SendMailSmS().forwardMailConfiramation(dtm.Rows[0]["CEmail"].ToString(), "Bonds Adda Website", create_Mail_Template(dtm.Rows[0]["CFullName"].ToString()));
                //}

                Clear();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.success('Your Registration Successfully Completed'); type : 'success'", true);
                //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Your Registration Successfully Completed', type: 'Success',});", true);
                //Response.Redirect("signin");

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "toastr.info('Something went wrong..!!!'); type : 'success'", true);
                return;
                //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Something went wrong..!!!', type: 'error',});", true);
                //return;
            }
        }

    }

    private string create_Mail_Template(string name)
    {
        StringBuilder sb = new StringBuilder();
     

        sb.Append(@"<!DOCTYPE html><html lang='en'><head><link href='https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap' rel='stylesheet' /> <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css' rel='stylesheet' /> <title> Registration Confirmation Mail</title></head>");

        sb.Append(@"<body><div style='max-width:720px;margin:auto;text-align:left;border: 1px solid #eee;'><table><tr><td colspan='2' style='width:100%;max-width:720px; margin:auto;'><table width='100' class='table tableSection' style='width:100%;font-size:13px;'><thead><tr><td style='width:100%;'><a href='https://bonds.whitelift.in/' target='_blank'><img src='https://bonds.whitelift.in/Image/logo1.jpg' alt='' style='width:100%' /></a></td></tr></thead>");

     //   sb.Append(@"<tbody><tr><td style='width: 100%; padding: 25px;><h2>Dear, " + name + @"</h2></td></tr>");
        sb.Append(@"<tr><td style='width:100%;padding: 5px 25px;'>Dear, " + name + @"</td></tr><tr><td style='width:100%;padding:5px 25px;'>Thank you for being a member of bondsAdda family. It@Q5s our pleasure to have you on board. <br />We really appreciate your interest.</td></tr><tr><td style='width:100%;padding:5px 25px;'>To start investing in fixed income securities kindly go through our website.<br/>Our representative will connect you shortly to provide you further information about investments.<br/>Kindly contact to our official website for your queries related to investment.</td></tr></tr></tbody>");

        //sb.Append(@"<tbody><tr><td style='width: 100%; padding: 25px;'>Dear,"+name+"</td></tr> <tr><td style='width:100%;padding: 5px 25px;'>Thank you for being a member of bondsAdda family. It’s our pleasure to have you on board. <br />We really appreciate your interest.
        //<tr><td style='width:100%;padding:5px 25px;'>To start investing in fixed income securities kindly go through our website.<br/>Our representative will connect you shortly to provide you further information about investments.<br/>Kindly contact to our official website for your queries related to investment.</td></tr><tr>");
        sb.Append(@"<td style='width:100%;padding:5px 25px;text-align:left;'>Regards,<br/>Team Bonds Adda</td></tr><tr><td style='width:100%;padding:25px 25px; text-align:center;'></td></tr></tbody></table>");


        sb.Append(@"<table style='font-size:12px;color:#fff;width:100%;padding:0px 25px 0px 25px;background: linear-gradient(290deg,#ffffff 50%,#2a3855 50%);'><tr><td style='background: #2a3855;'><p>Follow Us on :</p><table><tr><td><a href='https://www.facebook.com/profile.php?id=100094572825123' target='_blank'><img src='https://bonds.whitelift.in/Image/facebook.png' alt='Follow Bonds Adda on Facebook' style='width:36px;margin:0px 5px;'></a></td>");

        sb.Append(@"<td><a href='https://twitter.com/bondsadda' target='_blank'><img src='https://bonds.whitelift.in/Image/twitter.png' alt='Follow Bonds Adda on Twitter' style='width:36px;margin:0px 5px;'></a></td><td><a href='mailto:info@bondsadda.com' target='_blank' style='padding:5px;'><img src='https://bonds.whitelift.in/Image/mail.png' alt='Follow Bonds Adda on Mail' style='width:36px;margin:0px 5px;'/></a></td>");


        sb.Append(@"<td><a href='https://www.instagram.com/bondsadda/' target='_blank' style='padding:5px;'><img src='https://bonds.whitelift.in/Image/instag.png' alt='Follow Bonds Adda on Instagram' style='width:36px;margin:0px 5px;'></a></td></tr></table>");

        sb.Append(@"<p>For more queries & latest updates<br />  visit us <a href='https://bonds.whitelift.in/' target='_blank' style='text-decoration: none; color: #fff;'>bonds.whitelift.in</a></p><br /></td> <td style='text-align: right; color: #333;'><a href='https://bonds.whitelift.in/' target='_blank'><img src='https://bonds.whitelift.in/Image/logo11.png' alt=''style='max-width: 60%;'></a><p> Talk To Our Support 1800 8333 841 </p>Plot no, 60, Ballabgarh Flyover, Sector 25 <p></p> Faridabad, Haryana 121001</p></td></tr></table></td></tr><tr>");

        sb.Append(@"</tr></table></div></body></html>");

        return sb.ToString().Replace("@Q5", "'");
    }

    private void sendMailMSG91(string eMail, string Name)
    {
        List<Recipient> _recipients = new List<Recipient>();
        Recipient recipient = new Recipient();
        List<To> to = new List<To>();
        To _to = new To();
        _to.email = eMail;
        _to.name = Name;
        to.Add(_to);
        recipient.to = to;
        _recipients.Add(recipient);
        new MSG91mail().send_Mail_Registration(_recipients);
    }

}