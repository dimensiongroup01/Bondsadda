using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

public partial class Shriram_CalculatorIntegration : System.Web.UI.Page
{
    private const string CalculatorUrl = "https://uatinvsfl.stfc.me/SFLUATAPIExternalService/APIExternalService.svc/DigiCalculator";

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
            string encryptedData = ApiHelper.GCMEncryption(jsonPayload);
            string token = ApiHelper.GetToken();

            string response = await ApiHelper.CallAPIAsync(CalculatorUrl, encryptedData, token, "Calculator");
            string decryptedResponse = ApiHelper.GCMDecryption(response);

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
                        tableHtml += String.Format("<th>{0}</th>", prop.Value);

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
}

