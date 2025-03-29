using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class BSE_INTEGRATION_PaymenyGateway : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
    }
 protected async void btnGeneratePaymentLink_Click(object sender, EventArgs e)
    {
        string token = await GetAccessToken();
        if (!string.IsNullOrEmpty(token))
        {
            string paymentLink = await GeneratePaymentLink(token);
            lblResponse.Text = string.Format("Payment Link: <a href='{0}' target='_blank'>Click Here to Pay</a>", paymentLink);

        }
        else
        {
            lblResponse.Text = "Failed to retrieve token.";
        }
    }

    private async Task<string> GetAccessToken()
    {
        System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12 | System.Net.SecurityProtocolType.Tls11;
        using (HttpClient client = new HttpClient())
        {
            client.BaseAddress = new Uri("https://uat-rfqepay.bseindia.com/");
            var content = new FormUrlEncodedContent(new[]
            {
                new KeyValuePair<string, string>("username", ComputeSHA256hash("DFSPL")),
                new KeyValuePair<string, string>("password", ComputeSHA256hash("Dfspl#2025")),
                new KeyValuePair<string, string>("grant_type", "password")
            });
            string a = ComputeSHA256hash("DFSPL");
            string b = ComputeSHA256hash("Dfspl#2025");
            Console.WriteLine("Hashed Username: " + a);
            Console.WriteLine("Hashed Password: " + b);
            HttpResponseMessage response = await client.PostAsync("token", content);
            if (response.IsSuccessStatusCode)
            {
                var jsonResponse = await response.Content.ReadAsStringAsync();
                dynamic result = JsonConvert.DeserializeObject(jsonResponse);
                string token = result != null ? result.access_token : null;

            }
            return null;
        }
    }

    private async Task<string> GeneratePaymentLink(string token)
    {
        using (HttpClient client = new HttpClient())
        {
            client.DefaultRequestHeaders.Add("Authorization", string.Format("Bearer {0}", token));

            client.BaseAddress = new Uri("https://uat-rfqepay.bseindia.com/");

            var payload = new
            {
                TradeDate = txtTradeDate.Text,
                OrderNo = txtOrderNo.Text
            };
            string jsonPayload = JsonConvert.SerializeObject(payload);
            var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");

            HttpResponseMessage response = await client.PostAsync("api/SendPaymentLink", content);
            if (response.IsSuccessStatusCode)
            {
                var jsonResponse = await response.Content.ReadAsStringAsync();
                dynamic result = JsonConvert.DeserializeObject(jsonResponse);
                return (result != null) ? result.payment_link : null;

            }
            return "Error generating payment link.";
        }
    }

    public string ComputeSHA256hash(string text)
    {
        byte[] hashValue;
        byte[] EncrtyptText = Encoding.Unicode.GetBytes(text);

        SHA256Managed SHA256 = new SHA256Managed();
        hashValue = SHA256.ComputeHash(EncrtyptText);

        SHA256.Clear();
        SHA256.Dispose();
      return Convert.ToBase64String(hashValue);
    }
}
