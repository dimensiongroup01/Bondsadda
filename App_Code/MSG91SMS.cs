using System;
using System.Collections.Generic;
using System.Net;
using Newtonsoft.Json;
using RestSharp;

/// <summary>
/// Summary description for MSG91SMS
/// </summary>
public class MSG91SMS
{
    public MSG91SMS()
    {
        // Constructor logic (if needed)
    }

    private void forward_SMS(string smsJson)
    {
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;

        var options = new RestClientOptions("https://control.msg91.com/api/v5/flow/")
        {
            MaxTimeout = -1
        };

        var client = new RestClient(options);
        var request = new RestRequest("", Method.Post);

        request.AddHeader("authkey", "407622Apzn19OTk3653a4099P1"); // Replace with actual key
        request.AddHeader("Content-Type", "application/json");
        request.AddStringBody(smsJson, DataFormat.Json);

        RestResponse response = client.Execute(request);

        Console.WriteLine("Status Code: " + response.StatusCode);
        Console.WriteLine("Response Content: " + response.Content);
    }

    public void sendOTP(string mobile, string otpVal)
    {
        // Ensure mobile is prefixed with country code (e.g., "91" for India)
        if (!mobile.StartsWith("91"))
        {
            mobile = "91" + mobile;
        }

        var smsContent = new MSG91SMSContent
        {
            TemplateId = "6557364dd6fc0577920b8d83", // Make sure this template has {{otp}} variable
            ShortUrl = "0",
            Recipients = new List<SMSRecipient>
            {
                new SMSRecipient
                {
                    Mobiles = mobile,
                    Otp = otpVal
                }
            }
        };

        string smsJson = JsonConvert.SerializeObject(smsContent);
        Console.WriteLine("JSON Payload: " + smsJson); // Debug output

        forward_SMS(smsJson);
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
