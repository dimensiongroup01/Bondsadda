using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Xml.Linq;
using System.IO;

/// <summary>
/// Summary description for SendMailSmS
/// </summary>
public class SendMailSmS
{
    public SendMailSmS()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private void forwardSMS(string mobile, string msg)
    {
        try
        {
            string smsqry = "http://88.99.65.2/http-api.php?username=rana&password=argmob&senderid=SIXF&route=1&number=" + mobile + "&message=" + msg + "";

            HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(smsqry);

            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();
        }
        catch (Exception ex)
        {

        }
    }
    
    public bool forwardMail(string email, string Subject, string sbodyHtml)
    {
        try
        {

            MailMessage mailMessage = new MailMessage(new MailAddress("customercare@bondsadda.com", ""), new MailAddress(email));
            mailMessage.Bcc.Add("dizitaldreams@gmail.com");
            mailMessage.Subject = Subject;
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = sbodyHtml.ToString();
            var securityProtocol = (int)System.Net.ServicePointManager.SecurityProtocol;

            // 0 = SystemDefault in .NET 4.7+
            if (securityProtocol != 0)
            {
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            }
            System.Net.NetworkCredential networkCredentials = new System.Net.NetworkCredential("customercare@bondsadda.com", "Care#Bonds98&");
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = networkCredentials;
            smtpClient.Host = "smtp.office365.in";
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.Port = 587;
            smtpClient.Send(mailMessage);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public bool forwardMailConfiramation(string email, string Subject, string sbodyHtml)
    {
        try
        {
            MailMessage mailMessage = new MailMessage(new MailAddress("enq@dizitaldreams.in"), new MailAddress(email));
            //    mailMessage.CC.Add("aoqr2019@gmail.com");
            mailMessage.Bcc.Add("enq@dizitaldreams.in");
            mailMessage.Subject = Subject;
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = sbodyHtml.ToString();
            System.Net.NetworkCredential networkCredentials = new System.Net.NetworkCredential("enq@dizitaldreams.in", "664$Bumm");
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "webmail.dizitaldreams.in";
            smtpClient.EnableSsl = false;
            smtpClient.Timeout = 999999;
            //       smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = networkCredentials;
            //smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 25;
            smtpClient.Send(mailMessage);

            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    private bool forwardMails( string Subject, string sbodyHtml,string Adminemail)
    {
        try
        {
            MailMessage mailMessage = new MailMessage(new MailAddress("dizitaldreams1098@gmail.com"), new MailAddress(Adminemail));
            
            //mailMessage.CC.Add(Adminemail);
            mailMessage.Bcc.Add("dizitaldreams1098@gmail.com");
            mailMessage.Subject = Subject;
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = sbodyHtml.ToString();
            System.Net.NetworkCredential networkCredentials = new System.Net.NetworkCredential("dizitaldreams1098@gmail.com", "zwutizgyslfhpoch");
            SmtpClient smtpClient = new SmtpClient();
            //smtpClient.Host = "webmail.dizitaldreams.in";
            smtpClient.EnableSsl = true;
            smtpClient.Timeout = 999999;
            //       smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = networkCredentials;
            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.Send(mailMessage);

            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    private bool forwardMailsss(string Subject, string sbodyHtml, string Adminemail, string email)
    {
        try
        {
            string fromMail = "customercare@bondsadda.com";
            MailMessage mailMessage = new MailMessage(new MailAddress(fromMail), new MailAddress(email));
            mailMessage.CC.Add(Adminemail);
            mailMessage.Bcc.Add("dreamsdizital@gmail.com");
            mailMessage.Subject = Subject;
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = sbodyHtml.ToString();
            var securityProtocol = (int)System.Net.ServicePointManager.SecurityProtocol;

            // 0 = SystemDefault in .NET 4.7+
            if (securityProtocol != 0)
            {
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            }
            System.Net.NetworkCredential networkCredentials = new System.Net.NetworkCredential(fromMail, "gxpqlrzdkcrkvchj");
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = networkCredentials;
            smtpClient.Host = "smtp.office365.com";
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.Port = 587;
            smtpClient.Send(mailMessage);

            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    private bool forwardMailfd(string Subject, string sbodyHtml, string Adminemail, string email, string attachmentPath = null)
    {
        try
        {
            string fromMail = "customercare@bondsadda.com";
            MailMessage mailMessage = new MailMessage(new MailAddress(fromMail), new MailAddress(email));

            mailMessage.CC.Add(Adminemail);
            mailMessage.Bcc.Add("dreamsdizital@gmail.com");
            mailMessage.Subject = Subject;
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = sbodyHtml.ToString();

            // 📎 Attach file if provided and exists
            if (!string.IsNullOrEmpty(attachmentPath) && File.Exists(attachmentPath))
            {
                mailMessage.Attachments.Add(new Attachment(attachmentPath));
            }

            // Use TLS 1.2 if not already set (for older .NET versions)
            var securityProtocol = (int)System.Net.ServicePointManager.SecurityProtocol;
            if (securityProtocol != 0)
            {
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            }

            System.Net.NetworkCredential networkCredentials = new System.Net.NetworkCredential(fromMail, "gxpqlrzdkcrkvchj");

            SmtpClient smtpClient = new SmtpClient
            {
                EnableSsl = true,
                UseDefaultCredentials = false,
                Credentials = networkCredentials,
                Host = "smtp.office365.com",
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Port = 587
            };

            smtpClient.Send(mailMessage);
            return true;
        }
        catch (Exception ex)
        {
            // Optional: Log error details
            return false;
        }
    }

    private bool forwardmails(string email, string Subject, string sbodyHtml, string RMemail)
    {
        try
        {
            MailMessage mailMessage = new MailMessage(new MailAddress("enq@dizitaldreams.in"), new MailAddress(email));
            mailMessage.CC.Add(RMemail);
            mailMessage.Bcc.Add("enq@dizitaldreams.in");
            mailMessage.Subject = Subject;
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = sbodyHtml.ToString();
            System.Net.NetworkCredential networkCredentials = new System.Net.NetworkCredential("enq@dizitaldreams.in", "664$Bumm");
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "webmail.dizitaldreams.in";
            smtpClient.EnableSsl = false;
            smtpClient.Timeout = 999999;
            //       smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = networkCredentials;
            //smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 25;
            smtpClient.Send(mailMessage);

            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public bool sendOTPMailVerification(string mobile, string randomcode, string email)
    {
        string msg = "OTP from paniwala.com " + randomcode + "";
        forwardSMS(mobile, /*"1007162485800317282"*/ msg);

        string Subject = "Verification Code";
        StringBuilder sbContent = new StringBuilder();
        sbContent.Append(@"Verification Code = <b>" + randomcode + "</b><br />");
        sbContent.Append(@"<h6>Thank You </h6>");
        return forwardMail(email, Subject, sbContent.ToString());
    }

    public bool sendRegistrationMail(string name, string Email)
    {
        string msg = string.Empty;
        msg = "Dear " + name + ", As requested, your registration successfully.";


        string Subject = "Bonds Adda website";
        StringBuilder sbodyHtml = new StringBuilder();
        sbodyHtml.Append(@"<HTML>" +
           "<HEAD><TITLE>" + Subject + "</TITLE>\n</HEAD><body>" +
               "<table width='70%' border='0' cellspacing='0' cellpadding='0'>" +
                  "<tr><td><form name='frm_query' action='' method='post'><table width='100%' border='0' cellspacing='0' cellpadding='4'><tr>" +
                  "<td colspan='3' valign='top' style='font-family:Arial, Helvetica, sans-serif; color:#e79405; font-size:10pt; text-align:center; text-decoration:none;'>" +
                    "<h2><a href='https://bonds.whitelift.in/' target='_blank' >WELCOME TO BONDSADDA</a></h2></td></tr>" +
                  "<tr><td colspan='3'><div width='700px'>" +
                     /*<p>As a respond to your Password Retrieval request please find below password to access your account on <a href='https://wfp.dizitaldreams.in/Login.aspx' target='_blank'>wfp.dizitaldreams.in</a>.</p>"*/ 
                     "<h5>Dear " + name + " , </h5>" + "<br/>" +
                     //"Password: <strong>" + password + "</strong>" + " " +
                     //"Email: <strong>" + Email + "</strong>" +
                     "<p>Thank you for being a member of bondsAdda family. It’s our pleasure to have you on board.</p>" + "<p> We really appreciate your interest. </p>" + "<br/>" +
                     "<p>To start investing in fixed income securities kindly go through our website.</p>" + "<P>Our representative will connect you shortly to provide you further information about investments.</p>" + "<p>Kindly contact to our official website for your queries related to investment. </p>" +
                     "<h5>Regards </h5><p><strong>Team BondsAdda</strong><br /><br /></p></div>" + "<p>*This is an autogenerated mail Please do not reply. *</p>" +
                  "</tr></table></body></HTML>");
        return forwardMail(Email, Subject, sbodyHtml.ToString());
    }
    public bool sendUserContactDetails(string name, string email, string mobile,string Text, string Massage)
    {

        string msg = string.Empty;
        msg = "Hey , " + name + ", As per your Contact, Your Adirohah  are Username: " + name + " UserEmail: " + email + " Mobile Number : " + mobile + ", Massage: " + Massage + "";
        forwardSMS(mobile, msg);

        string Subject = "Contact from BONDS ADDA Website";
        StringBuilder sbodyHtml = new StringBuilder();
        sbodyHtml.Append(@"<div class='row'><div class='col-sm-4'></div><div class='col-sm-8' ><center><div class='panel' style='background-color: #FFFFFF; width:500px; border: 1px solid #222d44; border-radius: 10px; '><div class='panel panel-heading'><u><h1 style='font-size:18px; color:#253559;' align='center'>Contact From BONDS ADDA Website</h1></u></div><div class='panel-body'><div class='table-responsive'><center><table class='table table-striped  table-bordered'style='text-align:left'><tr><th style'width:50px;'>NAME : </th><td>" + name + "</td></tr><br/>\n<tr><th>PHONE No. :</th><td>" + mobile + "</td></tr><br/>\n<tr><th>EMAIL :</th><td>" + email + "</td></tr><br/>\n<tr><th style='width:100px;'>Subject :</th><td>" + Text + "</td></tr><br/>\n<tr><th style='width:100px;'>Massage :</th><td>" + Massage + "</td></tr><br/></table></center></div></div></div></center> </div><div class='col-sm-2'></div></div>");

        //sbodyHtml.Append(@"<HTML>" +
        //   "<HEAD><TITLE>" + Subject + "</TITLE>\n</HEAD><body style>" +
        //       "<table width='70%' border='0' cellspacing='0' cellpadding='0'>" +
        //            "<tr><td><form name='frm_query' action='' method='post'>" + "<table width='100%' border='0' cellspacing='0' cellpadding='4'>" +
        //            "<tr><td valign='top' style='font-family:Arial, Helvetica, sans-serif; color:#F00; font-size:10pt;' width='100'>" +
        //               "<img src='https://demo.dizitaldreams.in/images1/logo1.png' width='199px' height='45px' />" +
        //            "</td><td valign='top' width='78%' ></td></tr><tr><td colspan='3'><div width='700px'>" +
        //            "<h4>Hey " + name + "</h4><p> , As per your request, we are sending your Contact credentials of <a href='https://demo.dizitaldreams.in'>demo.dizitaldreams.in</a>." +
        //            "<br /> User Name : " + email + "<br/> Mobule number : " + mobile + " Massage : <b>" + Massage + "<b></p>" +
        //            "<p>Please keep your Contact credentials secret for security reasons. Please feel free to Contact us on <a href='mailto:info@bidose.in'>lko@railtech.co.in</a></p>" +
        //            "<h5>Regards,</h5><p>Team RailTech</p></div>" +
        //            "</td></tr></table></body></HTML>");

        return forwardMail("dizitaldreams1098@gmail.com", Subject, sbodyHtml.ToString());

    }

    public bool sendRMClientInformation(string rmname,string name, string email,string cemail, string mobile, string kycstatus)
    {


        string Subject = "A client trying to reach you";
        StringBuilder sbodyHtml = new StringBuilder();
        //sbodyHtml.Append(@"<div class='row'><div class='col-sm-4'></div><div class='col-sm-8' ><center><div class='panel' style='background-color: #FFFFFF; width:500px; border: 1px solid #222d44; border-radius: 10px; '><div class='panel panel-heading'><u><h1 style='font-size:18px; color:#253559;' align='center'>Contact From BONDS ADDA Website</h1></u></div><div class='panel-body'><div class='table-responsive'><center><table class='table table-striped  table-bordered'style='text-align:left'><tr><th style'width:50px;'>NAME : </th><td>" + name + "</td></tr><br/>\n<tr><th>PHONE No. :</th><td>" + mobile + "</td></tr><br/>\n<tr><th>EMAIL :</th><td>" + email + "</td></tr><br/>\n<tr><th style='width:100px;'>Subject :</th><td>" + Text + "</td></tr><br/>\n<tr><th style='width:100px;'>Massage :</th><td>" + Massage + "</td></tr><br/></table></center></div></div></div></center> </div><div class='col-sm-2'></div></div>");

        sbodyHtml.Append(@"<HTML>" +
           "<HEAD><TITLE>" + Subject + "</TITLE></HEAD><body style>" +
               "<table width='70%' border='0' cellspacing='0' cellpadding='0'>" +
                    "<tr><td><form name='frm_query' action='' method='post'>" + "<table width='100%' border='0' cellspacing='0' cellpadding='4'>" +
                    "<tr><td valign='top' style='font-family:Arial, Helvetica, sans-serif; color:#F00; font-size:10pt;' width='100'>" +
                       "<img src='https://bondsadda.com/img/logo.png' width='199px' height='45px' />" +
                    "</td><td valign='top' width='78%' ></td></tr><tr><td colspan='3'><div width='700px'>" +
                    "<h4>Hey " + rmname + "</h4><p>" +
                    "<br /> Full Name : " + name + "<br/> Mobile number : " + mobile + "</br> Email : <b>" + email + "<b> </br> Kyc Status : <b>" + kycstatus +"</p>" +
                    "<h5>Regards,</h5><p>Team BondsAdda</p></div>" +
                    "</td></tr></table></body></HTML>");

        return forwardMail(email, Subject, sbodyHtml.ToString());

    }

    public bool sendForgotPasswordMail(string name, string email, string password)
    {
        //string msg = string.Empty;
        //msg = "Dear " + name + ", As requested, your credentials has been shared.Please check your registered E-Mail for details.";
        //forwardSMS(mobile, msg);

        string Subject = "Bonds Adda Sign-in Password";
        StringBuilder sbodyHtml = new StringBuilder();
        sbodyHtml.Append(@"<HTML>" +
           "<HEAD><TITLE>" + Subject + "</TITLE>\n</HEAD><body>" +
               "<table width='70%' border='0' cellspacing='0' cellpadding='0'>" +
                  "<tr><td><form name='frm_query' action='' method='post'><table width='100%' border='0' cellspacing='0' cellpadding='4'><tr>" +
                  "<td colspan='3' valign='top' style='font-family:Arial, Helvetica, sans-serif; font-size:10pt;'>" +
                  /* "<a href='https://www.safetagmarkets.com' target='_blank' >/*<img src='https://www.thehousingguru.com/images/STM_final%20Logo_60%20x%2071%20px.png'  style='height:99px;width:129px;box-shadow: 1px 3px 10px;' / /></a></td></tr>"*/
                  "<tr><td colspan='3'><div style='max-width:700px;box-shadow:0px 0px 7px 0px;padding: 5px 10px;'>" +
                     "<h4>Hey " + name + ",</h4><p>As a respond to your Password Retrieval request use <strong>" + password + "</strong> as current password to access your <a href='https://www.bonds.whitelift.in' target='_blank'>Bonds Adda</a> account.</p>" +
                     "<br/>" +
                     "<p>If you did not request a password, no further action is required.</p>" +
                     "<h5>Thanks,</h5><p><strong>Team <a href='https://www.bonds.whitelift.in' target='_blank'>Bonds Adda</strong><br /></p></div>" +
                  "</tr></table></body></HTML>");
        return forwardMail(email, Subject, sbodyHtml.ToString());
    }

    public bool sendNotificationDetails(string Title, string Message, string ImageUrl, string UserType)
    {


        string Subject = "Contact from Clann Makeovers";
        StringBuilder sbodyHtml = new StringBuilder();
        sbodyHtml.Append(@"<div class='row'><div class='col-sm-4'></div><div class='col-sm-8' ><center><div class='panel' style='background-color: #FFFFFF; width:500px; border: 1px solid #222d44; border-radius: 10px; '><div class='panel panel-heading'><u><h1 style='font-size:18px; color:#253559;' align='center'>Notification for Clann Makeovers</h1></u></div><div class='panel-body'><div class='table-responsive'><center><table class='table table-striped  table-bordered'style='text-align:left'><tr><th style'width:50px;'>Notification Title : </th><td>" + Title + "</td></tr><br/>\n<tr><th>Notification Message :</th><td>" + Message + "</td></tr><br/>\n<tr><th>Image Url :</th><td>" + ImageUrl + "</td></tr><br/>\n<tr><th style='width:100px;'>User Type :</th><td>" + UserType + "</td></tr><br/></table></center></div></div></div></center> </div><div class='col-sm-2'></div></div>");

        //sbodyHtml.Append(@"<HTML>" +
        //   "<HEAD><TITLE>" + Subject + "</TITLE>\n</HEAD><body style>" +
        //       "<table width='70%' border='0' cellspacing='0' cellpadding='0'>" +
        //            "<tr><td><form name='frm_query' action='' method='post'>" + "<table width='100%' border='0' cellspacing='0' cellpadding='4'>" +
        //            "<tr><td valign='top' style='font-family:Arial, Helvetica, sans-serif; color:#F00; font-size:10pt;' width='100'>" +
        //               "<img src='https://demo.dizitaldreams.in/images1/logo1.png' width='199px' height='45px' />" +
        //            "</td><td valign='top' width='78%' ></td></tr><tr><td colspan='3'><div width='700px'>" +
        //            "<h4>Hey " + name + "</h4><p> , As per your request, we are sending your Contact credentials of <a href='https://demo.dizitaldreams.in'>demo.dizitaldreams.in</a>." +
        //            "<br /> User Name : " + email + "<br/> Mobule number : " + mobile + " Massage : <b>" + Massage + "<b></p>" +
        //            "<p>Please keep your Contact credentials secret for security reasons. Please feel free to Contact us on <a href='mailto:info@bidose.in'>lko@railtech.co.in</a></p>" +
        //            "<h5>Regards,</h5><p>Team RailTech</p></div>" +
        //            "</td></tr></table></body></HTML>");

        return forwardMail("dizitaldreams1098@gmail.com", Subject, sbodyHtml.ToString());

    }

    public bool sendBondConfirmationDetails(string ProductName, string email, string CustomerName, string TotalInterest,string TotalConsiderationAmount,string MaturityDate,string IPDate ,string SattlementDate,string Adminemail)
    {

        //string msg = string.Empty;
        //msg = "Hey , " + Name + ", As per your Contact, Bonds Adda  are Name: " + Name + " UserEmail: " + email + " Mobile Number : " + mobile + ",Subject: " + subject + ", Massage: " + Massage + "";


        string Subject = "Confirmation from Bonds Adda  Website";
        StringBuilder sbodyHtml = new StringBuilder();
        sbodyHtml.Append(@"<div class='row'><div class='col-sm-4'></div><div class='col-sm-8' ><center><div class='panel' style='background-color: #FFFFFF; width:500px; border: 1px solid #222d44; border-radius: 10px; '><div class='panel panel-heading'><u><h1 style='font-size:18px; color:#253559;' align='center'>Bonds Confirmation from Bonds Adda</h1></u></div><div class='panel-body'><div class='table-responsive'><center><table class='table table-striped  table-bordered'style='text-align:left'><tr><th style'width:50px;'>Product Name : </th><td>" + ProductName + "</td></tr><br/>\n<tr><th>Customer Name :</th><td>" + CustomerName + "</td></tr><br/>\n<tr><th>Email :</th><td>" + email + "</td></tr><br/>\n<tr><th>Total Interest :</th><td>" + TotalInterest + "</td></tr><br/><tr><th>Total Consideration Amount :</th><td>" + TotalConsiderationAmount + "</td></tr><br/><tr><th>Maturity Date :</th><td>" + MaturityDate + "</td></tr><br/><tr><th>IPDate :</th><td>" + IPDate + "</td></tr><br/><tr><th>Sattlement Date :</th><td>" + SattlementDate + "</td></tr><br/></table></center></div></div></div></center></div><div class='col-sm-2'></div></div>");

        //sbodyHtml.Append(@"<HTML>" +
        //   "<HEAD><TITLE>" + Subject + "</TITLE>\n</HEAD><body style>" +
        //       "<table width='70%' border='0' cellspacing='0' cellpadding='0'>" +
        //            "<tr><td><form name='frm_query' action='' method='post'>" + "<table width='100%' border='0' cellspacing='0' cellpadding='4'>" +
        //            "<tr><td valign='top' style='font-family:Arial, Helvetica, sans-serif; color:#F00; font-size:10pt;' width='100'>" +
        //               "<img src='https://demo.dizitaldreams.in/images1/logo1.png' width='199px' height='45px' />" +
        //            "</td><td valign='top' width='78%' ></td></tr><tr><td colspan='3'><div width='700px'>" +
        //            "<h4>Hey " + name + "</h4><p> , As per your request, we are sending your Contact credentials of <a href='https://demo.dizitaldreams.in'>demo.dizitaldreams.in</a>." +
        //            "<br /> User Name : " + email + "<br/> Mobule number : " + mobile + " Massage : <b>" + Massage + "<b></p>" +
        //            "<p>Please keep your Contact credentials secret for security reasons. Please feel free to Contact us on <a href='mailto:info@bidose.in'>lko@railtech.co.in</a></p>" +
        //            "<h5>Regards,</h5><p>Team RailTech</p></div>" +
        //            "</td></tr></table></body></HTML>");

        return forwardMails( Subject, sbodyHtml.ToString(),Adminemail);
      

    }

    public bool sendBondConfirmationDetailss(string ProductName, string email, string CustomerName, string TotalInterest, string TotalConsiderationAmount, string MaturityDate, string IPDate, string SattlementDate, string RMemail)
    {

        //string msg = string.Empty;
        //msg = "Hey , " + Name + ", As per your Contact, Bonds Adda  are Name: " + Name + " UserEmail: " + email + " Mobile Number : " + mobile + ",Subject: " + subject + ", Massage: " + Massage + "";


        string Subject = "Confirmation from Bonds Adda  Website";
        StringBuilder sbodyHtml = new StringBuilder();
        sbodyHtml.Append(@"<div class='row'><div class='col-sm-4'></div><div class='col-sm-8' ><center><div class='panel' style='background-color: #FFFFFF; width:500px; border: 1px solid #222d44; border-radius: 10px; '><div class='panel panel-heading'><u><h1 style='font-size:18px; color:#253559;' align='center'>Bond Confirmation from Bonds Adda</h1></u></div><div class='panel-body'><div class='table-responsive'><center><table class='table table-striped  table-bordered'style='text-align:left'><tr><th>Product Name : </th><td>" + ProductName + "</td></tr><br/>\n<tr><th>Customer Name :</th><td>" + CustomerName + "</td></tr><br/>\n<tr><th>Email :</th><td>" + email + "</td></tr><br/>\n<tr><th>Total Interest :</th><td>" + TotalInterest + "</td></tr><br/><tr><th>Total Consideration Amount :</th><td>" + TotalConsiderationAmount + "</td></tr><br/><tr><th>Maturity Date :</th><td>" + MaturityDate + "</td></tr><br/><tr><th>IPDate :</th><td>" + IPDate + "</td></tr><br/><tr><th>Sattlement Date :</th><td>" + SattlementDate + "</td></tr><br/></table></center></div></div></div></center></div><div class='col-sm-2'></div></div>");

        //sbodyHtml.Append(@"<HTML>" +
        //   "<HEAD><TITLE>" + Subject + "</TITLE>\n</HEAD><body style>" +
        //       "<table width='70%' border='0' cellspacing='0' cellpadding='0'>" +
        //            "<tr><td><form name='frm_query' action='' method='post'>" + "<table width='100%' border='0' cellspacing='0' cellpadding='4'>" +
        //            "<tr><td valign='top' style='font-family:Arial, Helvetica, sans-serif; color:#F00; font-size:10pt;' width='100'>" +
        //               "<img src='https://demo.dizitaldreams.in/images1/logo1.png' width='199px' height='45px' />" +
        //            "</td><td valign='top' width='78%' ></td></tr><tr><td colspan='3'><div width='700px'>" +
        //            "<h4>Hey " + name + "</h4><p> , As per your request, we are sending your Contact credentials of <a href='https://demo.dizitaldreams.in'>demo.dizitaldreams.in</a>." +
        //            "<br /> User Name : " + email + "<br/> Mobule number : " + mobile + " Massage : <b>" + Massage + "<b></p>" +
        //            "<p>Please keep your Contact credentials secret for security reasons. Please feel free to Contact us on <a href='mailto:info@bidose.in'>lko@railtech.co.in</a></p>" +
        //            "<h5>Regards,</h5><p>Team RailTech</p></div>" +
        //            "</td></tr></table></body></HTML>");

        return forwardmails(email, Subject, sbodyHtml.ToString(), RMemail);


    }
    public bool sendSignInOtp(string email, string OTP)
    {
        //string msg = "OTP from onebharatlive.com " + OTP + "";
        //forwardSMS(mobile, "1007162485800317282", msg);

        string Subject = "BondsAdd SignIn OTP";
        StringBuilder sbodyHtml = new StringBuilder();
        sbodyHtml.Append(@"<HTML><HEAD><TITLE>" + Subject + "</TITLE></HEAD><body>" +
               "<table width='70%' border='0' cellspacing='0' cellpadding='0'>" +
                  "<tr><td><form name='frm_query' action='' method='post'><table width='100%' border='0' cellspacing='0' cellpadding='4'><tr>" +
                  "<td  valign='top' style='font-family:Arial, Helvetica, sans-serif; color:#fff; font-size:10pt;' width='100'>" +
                    "<img src='https://bondsadda.com/img/logo.png' width='180px' />" +
                  "</td><td valign='top' width='78%' ></td></tr>" +
                  "<tr><td colspan='3'><div width='700px'>" +
                      "<h4>Dear User</h4>" +
                      "<p>   Your OTP for SignIn with <a href='https://bondsadda.com'>bondsadda.com</a> is <strong>" + OTP + "</strong> ." +
                      "Please feel free to contact us on <a href='mailto:customercare@bondsadda.com'>customercare@bondsadda.com</a></p>" +
                      "<h5>Regards,</h5><p><strong>Team BondsAdda</strong></p></div>" +
                  "</tr></table></body></HTML>");
        return forwardMail(email,Subject, sbodyHtml.ToString());
        //return true;
    }
    public bool sendBondinterestforRM(string ProductName, string email, string CustomerName, string FaceValueforDeal, string MaturityDate, string IPDate, string SattlementDate, string Adminemail,string EntryDate)
    {

        //string msg = string.Empty;
        //msg = "Hey , " + Name + ", As per your Contact, Bonds Adda  are Name: " + Name + " UserEmail: " + email + " Mobile Number : " + mobile + ",Subject: " + subject + ", Massage: " + Massage + "";


        string Subject = "Customer Interest Bonds on Bonds Adda  Website";
        StringBuilder sbodyHtml = new StringBuilder();
        sbodyHtml.Append(@"<div class='row'><div class='col-sm-4'></div><div class='col-sm-8' ><center><div class='panel' style='background-color: #FFFFFF; width:500px; border: 1px solid #222d44; border-radius: 10px; '><div class='panel panel-heading'><u><h1 style='font-size:18px; color:#253559;' align='center'>Customer Interest Bonds from Bonds Adda</h1></u></div><div class='panel-body'><div class='table-responsive'><center><table class='table table-striped  table-bordered'style='text-align:left'><tr><th style'width:50px;'>Product Name : </th><td>" + ProductName + "</td></tr><br/>\n<tr><th>Customer Name :</th><td>" + CustomerName + "</td></tr><br/>\n<tr><th>Email :</th><td>" + email + "</td></tr><br/>\n<tr><th>Face Value For Deal :</th><td>" + FaceValueforDeal + "</td></tr><br/><tr><th>Date :</th><td>" + EntryDate + "</td></tr><br/><tr><th>Maturity Date :</th><td>" + MaturityDate + "</td></tr><br/><tr><th>IPDate :</th><td>" + IPDate + "</td></tr><br/><tr><th>Sattlement Date :</th><td>" + SattlementDate + "</td></tr><br/></table></center></div></div></div></center></div><div class='col-sm-2'></div></div>");

        return forwardMail(Adminemail, Subject, sbodyHtml.ToString());


    }

    public bool senddealconfirmation(string Adminemail,string cemail,string customermobile,string CustomerName,string dealdate,string sattledate,string security,string isin,string couponrate,string ipdate,string maturitytype, string maturitydate,string putdate,string calldate,string lastipdate,string noofdays,string facevaluebond,string qty,string rate,string YTM,string deal,string principalamo,string accuredinterest,string totalconsideration,string stampduty,string totalconsiderationstamp)
    {
        string Subject = "Deal Confirmation Data";

        StringBuilder sbodyHtml = new StringBuilder();
        sbodyHtml.Append(@"<div class='table box p-md-5 p-4 font_2' id='printarea'><table><tbody><tr><td><h3><strong>Dimension Financial Solutions Pvt Ltd</strong></h3><p>Plot No-10, Third Floor, Dimension Group Building,<br>Commercial Area, Kaushambi, Ghaziabad U.P - 201010<br><strong>CIN</strong> - U74140DL2009PTC186563<br><strong> Email Id </strong> - debt@dimensiongroup.co.in<br><strong>Mobile No</strong> - +91 9650700244 / 9650799558<br><strong>Ref No:</strong> - DFS/227/2023-24,<br>to<br><strong>"+ CustomerName +"("+ customermobile + ")</strong></p></td><td><img src='https://bondsadda.com/Signup/Picture1.png' style='width:70%'></td></tr></tbody></table><table style='width: 100%;' border='1'><tbody><tr><td><strong>Transaction Type</strong></td><td colspan='3'><strong>Security Sale</strong></td></tr><tr><td>Deal Date</td><td>"+dealdate+"</td><td>Settlement Date</td><td>"+sattledate+"</td></tr><tr><td colspan='4'>Security Details :-</td></tr><tr><td>Name of Security</td><td colspan='3'>"+security+"</td></tr><tr><td>ISIN Number</td><td colspan='3'>"+isin+"</td></tr><tr><td>Coupon Rate</td><td colspan='3'>"+couponrate+"%</td></tr><tr><td>Interest Payment Date</td><td colspan='3'>"+maturitytype+"-"+ipdate+"</td></tr><tr><td>Maturity Date</td><td colspan='3'>"+maturitydate+"</td></tr><tr><td>Put/Call Option</td><td colspan='3'>"+calldate+"/"+putdate+"</td></tr><tr><td>Last Interest Payment Date</td><td colspan='3'>"+lastipdate+"</td></tr><tr><td>Number of Days</td><td colspan='3'>"+noofdays+"</td></tr><tr><td>Face Value of Per Bond</td><td colspan='3'>"+facevaluebond+"</td></tr><tr><td>Quantity</td><td colspan='3'>"+qty+"</td></tr><tr><td>Rate (Rs.)</td><td>"+rate+"</td><td>YTM</td><td>"+YTM+" %</td></tr><tr><td>Face Value of Deal (Rs.)</td><td colspan='3'>"+deal+"</td></tr><tr><td>Principal Amount (Rs.)</td><td colspan='3'>"+principalamo+"</td></tr><tr><td>Accured Interest (Rs.)</td><td colspan='3'>"+accuredinterest+"</td></tr><tr><td>Total Consideration (Rs.)</td><td colspan='3'>"+totalconsideration+"</td></tr><tr><td>Stamp Duty (Rs.)</td><td colspan='3'>"+stampduty+"</td></tr><tr><td style='padding: 5px 0;'><strong> Total Consideration (Rs.) With Stamp Duty</strong></td><td colspan='3'>"+totalconsiderationstamp+"</td></tr></tbody></table><p>**This document is system genrated, doesn't require any signature..**</p><table style='width: 100%;'><tbody><tr><td>Yours Faithfully</td></tr><tr><td>We hereby confirm the deal</td><td>We are agreeable to buy the security as per terms mentioned above</td></tr><tr><td>For Dimension Financial Solutions Pvt. Ltd.</td><td>For <strong>"+CustomerName+"</strong></td></tr><tr><td>&nbsp;</td></tr><tr><td>(Authorised Signatory)<br>Our Pan : AADCD0669G</td><td style='text-align: center;'>Authorised Signatory</td></tr><tr><td>&nbsp;</td></tr><tr><td colspan='2' style='text-align: center;'>Dimension Financial Solutions Pvt. Ltd.<br>Regd. Office: 302, Dakha Chamber, 38/2068, Naiwala Karol Bagh, New Delhi-110005 <br>Tel.: 0120-4376552, 4336551-52 Fax: +91-0120-4151349<br>Website: www.dimensiongroup.co.in</td></tr></tbody></table></div>");
          return forwardMailsss(Subject, sbodyHtml.ToString(),Adminemail,cemail);
    }
    public bool SendFDRegistrationConfirmation(string emailTo, string name, string pan, string aadhaar, string fdtype, string mobileno )
    {
        string subject = "FD Registration Confirmation";

        StringBuilder bodyHtml = new StringBuilder();
        bodyHtml.Append(@"
    <div style='font-family: Arial; font-size: 14px; padding: 20px; border: 1px solid #ccc;'>
        <h2>Dimension Financial Solutions Pvt. Ltd.</h2>
        <p>Dear <strong>" + name + @"</strong>,</p>
        <p>Thank you for registering your Fixed Deposit (FD) details with us. Below is the summary of your registration:</p>
        
        <table style='width: 100%; border-collapse: collapse;' border='1'>
            <tr><td><strong>Name</strong></td><td>" + name + @"</td></tr>
            <tr><td><strong>Email</strong></td><td>" + emailTo + @"</td></tr>
            <tr><td><strong>PAN</strong></td><td>" + pan + @"</td></tr>
            <tr><td><strong>Aadhaar</strong></td><td>" + aadhaar + @"</td></tr>
            <tr><td><strong>FD Type</strong></td><td>" + fdtype + @"</td></tr>
            <tr><td><strong>FD Type</strong></td><td>" + mobileno + @"</td></tr>            
        </table>

        <p>This is a system-generated confirmation. No signature is required.</p>

        <br />
        <p>Regards,<br /><strong>Dimension Financial Solutions Pvt. Ltd.</strong></p>
        <p style='font-size: 12px;'>Email: debt@dimensiongroup.co.in<br />Phone: +91 9650799566<br />Website: <a href='https://dimensiongroup.co.in'>dimensiongroup.co.in</a></p>
    </div>
    ");

        // 🛡️ Clean the fdtype to remove special characters or spaces
        string cleanedFdType = fdtype.Replace(" ", "").Replace("&", "").Replace("/", "");
        string fileName = cleanedFdType + ".pdf"; // Example: FD_Form_PNB.pdf

        string pdfPath = HttpContext.Current.Server.MapPath("~/FDTmeplates/" + fileName);

        // 🔁 Pass the attachment path
        return forwardMailfd(subject, bodyHtml.ToString(), "developer@dimensiongroup.co.in", emailTo, pdfPath);
    }


}


