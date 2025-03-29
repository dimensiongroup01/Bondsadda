using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Shriram_CKYCIntegration : System.Web.UI.Page
{
    private const string CkycUrl = "https://uatinvsfl.stfc.me/SFLUATAPIExternalService/APIExternalService.svc/GetCKYC";

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
            string encryptedData = ApiHelper.GCMEncryption(jsonPayload);
            string token = ApiHelper.GetToken();

            string response = await ApiHelper.CallAPIAsync(CkycUrl, encryptedData, token, "CKYC");
            string decryptedResponse = ApiHelper.GCMDecryption(response);

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
}