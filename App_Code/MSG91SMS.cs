using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.RightsManagement;
using System.Text.Json.Serialization;
using System.Web;
using System.Web.Script.Serialization;
using DocumentFormat.OpenXml.Wordprocessing;
using Newtonsoft.Json;
using RestSharp;

/// <summary>
/// Summary description for MSG91SMS
/// </summary>
public class MSG91SMS
{
    public MSG91SMS()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private void forward_SMS(string mailjson)
    {
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
        var options = new RestClientOptions("https://control.msg91.com/api/v5/flow/")
        {
            MaxTimeout = -1,
        };
        var client = new RestClient(options);
        var request = new RestRequest("https://control.msg91.com/api/v5/flow/", Method.Post);
        request.AddHeader("authkey", "407622Apzn19OTk3653a4099P1");
        request.AddHeader("Content-Type", "application/json");
        request.AddStringBody(mailjson, DataFormat.Json);
        RestResponse response = client.Execute(request);
        Console.WriteLine(response.Content);


    }

    public void sendOTP(string mobile, string otpVal)
    {
        MSG91SMSContent sc = new MSG91SMSContent();
        List<SMSRecipient> srl = new List<SMSRecipient>();
        SMSRecipient sr = new SMSRecipient();
        sr.Mobiles = mobile;
        sr.Otp = otpVal;
        srl.Add(sr);

        sc.ShortUrl = "0";
        sc.TemplateId = "6557364dd6fc0577920b8d83";

        sc.Recipients = srl;
        //string js1 = new JavaScriptSerializer().Serialize(sc);
        //string js2 = JsonConvert.SerializeObject(sc);
           forward_SMS(JsonConvert.SerializeObject(sc));
    }

}

public class SMSRecipient
{
    [JsonProperty("mobiles")]
    public string Mobiles { get; set; }

    [JsonProperty("otp")]
    public string Otp { get; set; }
}

public class MSG91SMSContent
{
    [JsonProperty("template_id")]
    public string TemplateId { get; set; }

    [JsonProperty("short_url")]
    public string ShortUrl { get; set; }

    [JsonProperty("recipients")]
    public List<SMSRecipient> Recipients { get; set; }
}