using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Shriram_SchemaIntegration : System.Web.UI.Page
{
    private const string SchemaUrl = "https://uatinvsfl.stfc.me/SFLUATAPIExternalService/APIExternalService.svc/SchemeDetail";

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
            string encryptedData = ApiHelper.GCMEncryption(jsonPayload);
            string token = ApiHelper.GetToken();

            string response = await ApiHelper.CallAPIAsync(SchemaUrl, encryptedData, token, "Schema");
            string decryptedResponse = ApiHelper.GCMDecryption(response);

            var responseObject = JsonConvert.DeserializeObject<Dictionary<string, object>>(decryptedResponse);
            if (responseObject.ContainsKey("SchemeDetailResult"))
            {
                var schemeDetails = JsonConvert.DeserializeObject<List<Dictionary<string, List<Dictionary<string, object>>>>>(responseObject["SchemeDetailResult"].ToString());
                var schemes = schemeDetails[0]["SDRScheme"];
                string tableHtml = "<table border='1' style='border-collapse: collapse; width: 100%;'>" +
                                   "<tr><th>Effective Yield</th><th>Maturity Value</th><th>Period (Months)</th><th>Rate</th></tr>";

                foreach (var scheme in schemes)
                {
                    tableHtml += String.Format(
                         "<tr>" +
                         "<td>{0}</td>" +
                         "<td>{1}</td>" +
                         "<td>{2}</td>" +
                         "<td>{3}</td>" +
                         "</tr>",
                         scheme["EffectiveYield"],
                         scheme["MaturityValue"],
                         scheme["Perdmonth"],
                         scheme["Rate"]
                     );

                }

                tableHtml += "</table>";
                litResponse.Text = String.Format(
                    "<div class='response-label response-success'>" +
                    "<h3>Schema API Response:</h3>{0}</div>",
                    tableHtml
                );

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
}