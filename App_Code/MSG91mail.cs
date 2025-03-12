using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.RightsManagement;
using System.Web;
using System.Web.Script.Serialization;
using RestSharp;


/// <summary>
/// Summary description for MSG91mail
/// </summary>
public class MSG91mail
{
    public MSG91mail()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private void forward_Mail(string mailjson)
    {
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
        var options = new RestClientOptions("https://control.msg91.com/api/v5/email/send")
        {
            MaxTimeout = -1,
        };
        var client = new RestClient(options);
        var request = new RestRequest("https://control.msg91.com/api/v5/email/send", Method.Post);
        request.AddHeader("authkey", "407622Apzn19OTk3653a4099P1");
        request.AddHeader("Content-Type", "application/json");
        request.AddHeader("Cookie", "PHPSESSID=t45ah3vbfq243g1ek2sf6lm563");
        //var body = @"{""recipients"":[{""to"":[{""email"":""vikas@dizitaldreams.in"",""name"":""Vikas""}]}],""from"":{""email"":""no-reply@bondsadda.com""},""domain"":""mail.bondsadda.com"",""template_id"":""welcome_mail_3""}";
        request.AddStringBody(mailjson, DataFormat.Json);
        RestResponse response = client.Execute(request);
        Console.WriteLine(response.Content);

    }

    public bool send_Mail_Registration(List<Recipient> _recipients)
    {
        MSG91RegistrationMail mailRegistration = new MSG91RegistrationMail();
        
        string _template_id = "welcome_mail_3";

        From from = new From();
        from.email = "no-reply@bondsadda.com";
        mailRegistration.from = from;
        mailRegistration.recipients = _recipients;
        mailRegistration.domain = "mail.bondsadda.com";
        mailRegistration.template_id = _template_id;

        string mailjson = new JavaScriptSerializer().Serialize(mailRegistration);
        forward_Mail(mailjson);
        return true;
    }

    public bool send_Mail_Otp(List<Recipient> _recipients)
    {
        MSG91RegistrationMail mailRegistration = new MSG91RegistrationMail();

        string _template_id = "global_otp";

        From from = new From();
        from.email = "no-reply@bondsadda.com";
        mailRegistration.from = from;
        mailRegistration.recipients = _recipients;
        mailRegistration.domain = "mail.bondsadda.com";
        mailRegistration.template_id = _template_id;

        string mailjson = new JavaScriptSerializer().Serialize(mailRegistration);
        forward_Mail(mailjson);
        return true;
    }

}