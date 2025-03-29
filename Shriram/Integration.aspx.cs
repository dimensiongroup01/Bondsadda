using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto.Modes;
using Org.BouncyCastle.Crypto.Parameters;

public partial class Shriram_Integration : System.Web.UI.Page
{
    private const string ResponsePassword = "1851440745144129";
    private const string ResponseSalt = "9068587656858839";
    private const string RequestPassword = "7217146911714709";
    private const string RequestSalt = "4534293823429419";
    private const string TokenKey = "D8EMIZSNFDAPI";
    private const string SchemaUrl = "https://uatinvsfl.stfc.me/SFLUATAPIExternalService/APIExternalService.svc/SchemeDetail";

    private const string CkycUrl = "https://uatinvsfl.stfc.me/SFLUATAPIExternalService/APIExternalService.svc/GetCKYC";
    private const string CalculatorUrl = "https://uatinvsfl.stfc.me/SFLUATAPIExternalService/APIExternalService.svc/DigiCalculator";



    private const int Iterations = 1000;
    private const int KeySize = 256 / 8;
    private const int IvSize = 128 / 8;


    // For SchemaDetail Handle Logic
    protected async void SubmitSchema(object sender, EventArgs e)
    {
        try
        {

            var payload = new
            {
                objsch = new
                {
                    strAction = txtStrAction.Text,
                    strCompany = txtStrCompany.Text,
                    strType = txtStrType.Text,
                    strGender = txtStrGender.Text
                }
            };

            string jsonPayload = JsonConvert.SerializeObject(payload);


            string encryptedData = GCMEncryption(jsonPayload);


            string token = GetToken();


            string response = await CallAPIAsync(SchemaUrl, encryptedData, token);


            string decryptedResponse = GCMDecryption(response);


            var responseObject = JsonConvert.DeserializeObject<Dictionary<string, object>>(decryptedResponse);

            if (responseObject.ContainsKey("SchemeDetailResult"))
            {
                var schemeDetails = JsonConvert.DeserializeObject<List<Dictionary<string, List<Dictionary<string, object>>>>>(responseObject["SchemeDetailResult"].ToString());
                var schemes = schemeDetails[0]["SDRScheme"];


                string tableHtml = "<table border='1' style='border-collapse: collapse; width: 100%;'>";
                tableHtml += "<tr><th>Effective Yield</th><th>Maturity Value</th><th>Period (Months)</th><th>Rate</th></tr>";

                foreach (var scheme in schemes)
                {
                    tableHtml += String.Format("<tr>" +
                               "<td>{0}</td>" +
                               "<td>{1}</td>" +
                               "<td>{2}</td>" +
                               "<td>{3}</td>" +
                               "</tr>",
                               scheme["EffectiveYield"],
                               scheme["MaturityValue"],
                               scheme["Perdmonth"],
                               scheme["Rate"]);

                }

                tableHtml += "</table>";


                litResponse.Text = String.Format("<div class='response-label response-success'>" +
                         "<h3>Schema API Response:</h3>{0}</div>", tableHtml);

            }
            else
            {

                litResponse.Text = "<div class='response-label response-error'><h3>No Scheme Details Found</h3></div>";
            }
        }
        catch (Exception ex)
        {
            litResponse.Text = String.Format(
                "<div class='response-label response-error'><h3>Error: {0}</h3></div>",
                ex.Message
            );

        }
    }



    // For DigiCalculator Handle Logic
    protected async void SubmitCalculator(object sender, EventArgs e)
    {
        try
        {

            var payload = new
            {
                objcalc = new
                {
                    CertDate = txtCertDate.Text,
                    dblInvamt = txtDblInvamt.Text,
                    strComp = txtStrComp.Text,
                    strInvType = txtStrInvType.Text,
                    strSCFlag = txtStrSCFlag.Text,
                    strTenure = txtStrTenure.Text,
                    strscheme = txtScheme.Text,
                    strSubtype = txtStrSubtype.Text,
                    strGender = txtStrGenderCalc.Text
                }
            };

            string jsonPayload = JsonConvert.SerializeObject(payload);


            string encryptedData = GCMEncryption(jsonPayload);


            string token = GetToken();


            string response = await CallcAPIAsync(CalculatorUrl, encryptedData, token);


            string decryptedResponse = GCMDecryption(response);

            JObject resultData = JObject.Parse(decryptedResponse);


            JArray sdrCalcArray = (JArray)resultData["DigiCalculatorResult"][0]["SDRCalc"];

            if (sdrCalcArray.Count > 0)
            {

                string tableHtml = "<table border='1' cellpadding='5' cellspacing='0' style='width:100%;'>";
                tableHtml += "<thead><tr>";


                JObject firstItem = (JObject)sdrCalcArray[0];
                foreach (var prop in firstItem)
                {
                    tableHtml += String.Format("<th>{0}</th>", prop.Key);

                }
                tableHtml += "</tr></thead><tbody>";


                foreach (var item in sdrCalcArray)
                {
                    tableHtml += "<tr>";
                    JObject itemObj = (JObject)item;
                    foreach (var prop in itemObj)
                    {
                        tableHtml += String.Format("<td>{0}</td>", prop.Value);

                    }
                    tableHtml += "</tr>";
                }

                tableHtml += "</tbody></table>";


                litResponse.Text = String.Format(
                     "<div class='response-label response-success'>" +
                     "<h3>Calculator API Response:</h3>{0}</div>",
                     tableHtml
                 );

            }
            else
            {

                litResponse.Text = "<div class='response-label response-error'><h3>No Calculation Results Found</h3></div>";
            }
        }
        catch (Exception ex)
        {

            litResponse.Text = String.Format(
                "<div class='response-label response-error'><h3>Error: {0}</h3></div>",
                ex.Message
            );
        }
    }




    // For CKYC Handle Logic
    protected async void SubmitCKYC(object sender, EventArgs e)
    {
        try
        {
            var payload = new
            {
                strAction = TextBox1.Text,
                VendorName = txtVendorName.Text,
                BACode = txtBACode.Text,
                Company = txtCompany.Text,
                Module = txtModule.Text,
                RequestType = txtRequestType.Text,
                RequestId = txtRequestId.Text,
                DOB = txtDOB.Text,
                MobileNumber = txtMobileNumber.Text,
                Pincode = txtPincode.Text
            };

            string jsonPayload = JsonConvert.SerializeObject(payload);


            string encryptedData = GCMEncryption(jsonPayload);


            string token = GetToken();


            string response = await CallckycAPIAsync(CkycUrl, encryptedData, token);


            string decryptedResponse = GCMDecryption(response);


            litResponse.Text = String.Format(
                "<div class='response-label response-success'>" +
                "<h3>CKYC API Response:</h3><pre>{0}</pre></div>",
                decryptedResponse
            );

        }
        catch (Exception ex)
        {

            litResponse.Text = String.Format(
                  "<div class='response-label response-error'><h3>Error: {0}</h3></div>",
                  ex.Message
              );

        }
    }


    private string CallAPI(string apiUrl, string jsonPayload)
    {
        using (HttpClient client = new HttpClient())
        {
            var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
            var response = client.PostAsync(apiUrl, content).Result;
            return response.Content.ReadAsStringAsync().Result;
        }
    }

    private void GenerateKeyAndIV(string password, string salt, out byte[] key, out byte[] iv)
    {
        using (var derivedBytes = new Rfc2898DeriveBytes(password, Encoding.UTF8.GetBytes(salt), Iterations))
        {
            key = derivedBytes.GetBytes(KeySize);
            iv = derivedBytes.GetBytes(IvSize);
        }
    }

    private string GCMEncryption(string plainText)
    {
        string sR = string.Empty;
        try
        {
            byte[] key;
            byte[] iv;
            GenerateKeyAndIV(RequestPassword, RequestSalt, out key, out iv);

            byte[] plainBytes = Encoding.UTF8.GetBytes(plainText);

            GcmBlockCipher cipher = new GcmBlockCipher(new AesFastEngine());
            AeadParameters parameters =
            new AeadParameters(new KeyParameter(key), 128, iv, null);
            cipher.Init(true, parameters);
            byte[] encryptedBytes = new byte[cipher.GetOutputSize(plainBytes.Length)];
            Int32 retLen = cipher.ProcessBytes
            (plainBytes, 0, plainBytes.Length, encryptedBytes, 0);
            cipher.DoFinal(encryptedBytes, retLen);
            sR = Convert.ToBase64String(encryptedBytes, Base64FormattingOptions.None);
            key = null;
            iv = null;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return sR;

    }

    private string GCMDecryption(string encryptedText)
    {
        byte[] key;
        byte[] iv;
        GenerateKeyAndIV(ResponsePassword, ResponseSalt, out key, out iv);

        string sR = string.Empty;
        try
        {
            byte[] encryptedBytes = Convert.FromBase64String(encryptedText);

            GcmBlockCipher cipher = new GcmBlockCipher(new AesFastEngine());
            AeadParameters parameters =
            new AeadParameters(new KeyParameter(key), 128, iv, null);
            ParametersWithIV parameter = new ParametersWithIV(new KeyParameter(key), iv);
            cipher.Init(false, parameters);
            byte[] plainBytes = new byte[cipher.GetOutputSize(encryptedBytes.Length)];
            Int32 retLen = cipher.ProcessBytes
            (encryptedBytes, 0, encryptedBytes.Length, plainBytes, 0);
            cipher.DoFinal(plainBytes, retLen);
            sR = Encoding.UTF8.GetString(plainBytes).TrimEnd("\r\n\0".ToCharArray());
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        return sR;

    }

    private string GetToken()
    {
        string tokenUrl = String.Format(
            "https://uatinvsfl.stfc.me/SFLUATAPIExternalService/APIExternalService.svc/GetEncryptedToken/{0}",
            TokenKey
        );

        using (var client = new WebClient())
        {

            string jsonResponse = client.DownloadString(tokenUrl);


            dynamic responseObj = JsonConvert.DeserializeObject(jsonResponse);


            return responseObj.GetEncryptedTokenResult;
        }
    }

    private async Task<string> CallAPIAsync(string apiUrl, string encryptedData, string token)
    {
        using (HttpClient client = new HttpClient())
        {
            client.DefaultRequestHeaders.Add("IncomingAuthReq", token);

            var content = new StringContent(JsonConvert.SerializeObject(new { strdata = encryptedData }), Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(apiUrl, content);
            response.EnsureSuccessStatusCode();

            string jsonResponse = await response.Content.ReadAsStringAsync();

            // Parse the JSON response to extract the "SchemeDetailResult"
            var result = JsonConvert.DeserializeObject<dynamic>(jsonResponse);
            return result.SchemeDetailResult;

        }
    }
    private async Task<string> CallcAPIAsync(string apiUrl, string encryptedData, string token)
    {
        using (HttpClient client = new HttpClient())
        {
            client.DefaultRequestHeaders.Add("IncomingAuthReq", token);

            var content = new StringContent(JsonConvert.SerializeObject(new { strdata = encryptedData }), Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(apiUrl, content);
            response.EnsureSuccessStatusCode();

            string jsonResponse = await response.Content.ReadAsStringAsync();

            // Parse the JSON response to extract the "DigiCalculatorResult"
            var result = JsonConvert.DeserializeObject<dynamic>(jsonResponse);
            return result.DigiCalculatorResult;

        }
    }

    private async Task<string> CallckycAPIAsync(string apiUrl, string encryptedData, string token)
    {
        using (HttpClient client = new HttpClient())
        {
            client.DefaultRequestHeaders.Add("IncomingAuthReq", token);

            var content = new StringContent(JsonConvert.SerializeObject(new { strdata = encryptedData }), Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(apiUrl, content);
            response.EnsureSuccessStatusCode();

            string jsonResponse = await response.Content.ReadAsStringAsync();

            // Parse the JSON response to extract the "GetCKYCResult"
            var result = JsonConvert.DeserializeObject<dynamic>(jsonResponse);
            return result.GetCKYCResult;

        }
    }

}



