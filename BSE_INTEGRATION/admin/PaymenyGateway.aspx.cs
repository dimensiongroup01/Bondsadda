using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class BSE_INTEGRATION_PaymenyGateway : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Net.ServicePointManager.SecurityProtocol =
       System.Net.SecurityProtocolType.Tls12 | System.Net.SecurityProtocolType.Tls11;
    }

    protected async void btnGeneratePaymentLink_Click(object sender, EventArgs e)
    {
   //  string token = await GetAccessToken();
          string token = "PciSacfir_efzSEmpZE-10S-uRxg2RXwTlWbvTZBotFaOyKR_-xRWKdz8WYYO7EP61TzzS-tP_BGGjJdLewsTomLqwnvzvYcg28-F4MzjzsfykZZixNOzcYYSlD8Xzcb6bRWs6J9VJZ6230MA5vRASvON9wWFgo94dsi5tohA0yIzj0FUdzGikqlzFVyZ-N3AtTJ0m2mJxGHAXFOc6BNHZQRBeErlhDkQQL_6uO4iTW5kp7-B2d-XMPs6MszJIUzy0JgYI6PKaju4LTJooAkQK32XIfXiqKkpzjU6RiZV3SMVTQD6_yiZXKryu5V2iCO";
        if (!string.IsNullOrEmpty(token))
        {

            string paymentLink = await GeneratePaymentLink(token);
            lblResponse.Text = "Payment Link: <a href='" + paymentLink + "' target='_blank'>Click Here to Pay</a>";
        }
        else
        {
            lblResponse.Text = "Failed to retrieve token.";
        }
    }

    private async Task<string> GetAccessToken()
    {
        // Check if the token is available in the session and hasn't expired
        if (Session["AccessToken"] != null && Session["TokenTime"] != null)
        {
            DateTime tokenTime = (DateTime)Session["TokenTime"];
            if (DateTime.Now.Subtract(tokenTime).TotalHours < 23.5)
            {
                return Session["AccessToken"].ToString();
            }
        }

        // Create HttpClient instance
        using (HttpClient client = new HttpClient())
        {
            // Set the base address of the API
            client.BaseAddress = new Uri("https://uat-rfqepay.bseindia.com/");
            string a = encrypt("DIMENSIONFSL");
            string b = encrypt("Ravi#2025");
            // Prepare form content with required parameters
            var content = new FormUrlEncodedContent(new[]
            {
            new KeyValuePair<string, string>("username", a),


            new KeyValuePair<string, string>("password", b),
            new KeyValuePair<string, string>("grant_type", "password")
        });

            try
            {
                // Make the HTTP POST request to the token endpoint
                HttpResponseMessage response = await client.PostAsync("token", content);


                if (response.IsSuccessStatusCode)
                {
                    string jsonResponse = await response.Content.ReadAsStringAsync();

                    // Deserialize the JSON response
                    dynamic result = JsonConvert.DeserializeObject(jsonResponse);

                    string token = null;

                    // Check if result is not null and if access_token is present
                    if (result != null && result.access_token != null)
                    {
                        token = result.access_token;
                    }

                    if (!string.IsNullOrEmpty(token))
                    {
                        // Save the token in the session with the current time
                        Session["AccessToken"] = token;
                        Session["TokenTime"] = DateTime.Now;
                        return token;
                    }
                    else
                    {
                        // Handle case where token is not present in the response
                        // Log or return a default value, depending on your needs
                        return null;
                    }
                }
                else
                {
                    // Handle failed response from the API
                    // You can log the response status or error message here
                    return null;
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that might occur during the HTTP request
                // Log or show the exception message for debugging
                return null;
            }
        }
    }


    private async Task<string> GeneratePaymentLink(string token)
    {
        using (HttpClient client = new HttpClient())
        {
            client.DefaultRequestHeaders.Add("Authorization", "Bearer " + token);
            client.BaseAddress = new Uri("https://uat-rfqepay.bseindia.com/");
            string tradeDate = "";
            if (!string.IsNullOrWhiteSpace(txtTradeDate.Text))
            {
                DateTime dt;
                if (DateTime.TryParseExact(txtTradeDate.Text, "yyyy-MM-dd",
                    System.Globalization.CultureInfo.InvariantCulture,
                    System.Globalization.DateTimeStyles.None, out dt))
                {
                    // This will return "29/04/2025"
                    tradeDate = dt.ToString("dd'/'MM'/'yyyy");
                }

            }




            var plainPayload = new
            {
                TradeDate = tradeDate,
                OrderNo = txtOrderNo.Text
            };

            string jsonPayload = JsonConvert.SerializeObject(plainPayload);
             
            string encryptedPayload = encrypt(jsonPayload);

            var  content = new StringContent(encryptedPayload, Encoding.UTF8, "application/json");

            HttpResponseMessage response = await client.PostAsync("api/SendPaymentLink", content);

            if (response.IsSuccessStatusCode)
            {
                string jsonResponse = await response.Content.ReadAsStringAsync();
                dynamic result = JsonConvert.DeserializeObject(jsonResponse);

                // Make sure to match your actual field names in the response
                return result != null ? result.paymentLink : null;
            }
            else
            {
                // Better: throw exception or log error
                throw new Exception("Error generating payment link: " + response.StatusCode);
            }
        }
    }


    public string ComputeSHA256hash(string text)
    {
        byte[] hashValue;
        byte[] encryptText = Encoding.Unicode.GetBytes(text);

        using (SHA256 sha256 = new SHA256Managed())
        {
            hashValue = sha256.ComputeHash(encryptText);
        }

        return Convert.ToBase64String(hashValue);
    }

    public string encrypt(string encryptString)
    {
        string EnKey = "017345ZA28ABAAEFGHIJKLMNOZZRSTUVWX67";
        byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EnKey, new byte[] {
        0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
  }, 100000, System.Security.Cryptography.HashAlgorithmName.SHA256);
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(),
         CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                encryptString = Convert.ToBase64String(ms.ToArray());
                encryptString = encryptString.Replace("//", "-");
            }
        }
        return encryptString;
    }
}
