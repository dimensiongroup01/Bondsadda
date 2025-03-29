using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Newtonsoft.Json;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto.Modes;





/// <summary>
/// Summary description for ApiHelper
/// </summary>
public class ApiHelper
{
 
        private const int Iterations = 1000;
    private const int KeySize = 256 / 8;
    private const int IvSize = 128 / 8;

    private const string ResponsePassword = "1851440745144129";
    private const string ResponseSalt = "9068587656858839";
    private const string RequestPassword = "7217146911714709";
    private const string RequestSalt = "4534293823429419";
    private const string TokenKey = "D8EMIZSNFDAPI";


    // Encryption and Decryption Methods
    public static string GCMEncryption(string plainText)
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

    public static string GCMDecryption(string encryptedText)
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

    public static void GenerateKeyAndIV(string password, string salt, out byte[] key, out byte[] iv)
    {
        using (var derivedBytes = new Rfc2898DeriveBytes(password, Encoding.UTF8.GetBytes(salt), Iterations))
        {
            key = derivedBytes.GetBytes(KeySize);
            iv = derivedBytes.GetBytes(IvSize);
        }
    }

    // Token Generation
    public static string GetToken()
    {
        System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;

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

    // API Call Method
    //public static async Task<string> CallAPIAsync(string apiUrl, string encryptedData, string token)
    //{
    //    using (HttpClient client = new HttpClient())
    //    {
    //        client.DefaultRequestHeaders.Add("IncomingAuthReq", token);

    //        var content = new StringContent(JsonConvert.SerializeObject(new { strdata = encryptedData }), Encoding.UTF8, "application/json");
    //        HttpResponseMessage response = await client.PostAsync(apiUrl, content);
    //        response.EnsureSuccessStatusCode();

    //        string jsonResponse = await response.Content.ReadAsStringAsync();

    //        return jsonResponse;
    //    }
    //}

    public static async Task<string> CallAPIAsync(string apiUrl, string encryptedData, string token, string apiType)
    {
        using (HttpClient client = new HttpClient())
        {
            client.DefaultRequestHeaders.Add("IncomingAuthReq", token);

            var content = new StringContent(JsonConvert.SerializeObject(new { strdata = encryptedData }), Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(apiUrl, content);
            response.EnsureSuccessStatusCode();

            string jsonResponse = await response.Content.ReadAsStringAsync();
            dynamic result = JsonConvert.DeserializeObject<dynamic>(jsonResponse);

            // Handle different API responses based on the apiType
            switch (apiType)
            {
                case "Schema":
                    return result.SchemeDetailResult;
                case "Calculator":
                    return result.DigiCalculatorResult;
                case "CKYC":
                    return result.GetCKYCResult;
                case "InsertInward":
                    return result.InsertInwardEntryDatasResult;
                default:
                    throw new ArgumentException("Invalid API type", "apiType");

            }
        }
    }

}
