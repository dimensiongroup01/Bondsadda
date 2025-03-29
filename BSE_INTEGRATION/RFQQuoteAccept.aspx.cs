using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class BSE_INTEGRATION_RFQQuoteAccept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthToken"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }


    private async Task<string> RFQQuoteAccept()
    {
        string token = Session["AuthToken"] as string;
        if (string.IsNullOrEmpty(token))
        {
            Response.Redirect("Login.aspx");
            return "Authentication Failed";
        }



        if (string.IsNullOrEmpty(txtISINNumber.Text.Trim()))
        {
            return "ISIN and Value fields are required.";
        }

        decimal originalValue;
        decimal correctedValue = 0;

        if (decimal.TryParse(value.InnerText, out originalValue))
        {
            correctedValue = originalValue * 10000000; // Multiply to restore the exact order value
        }


        var requestBody = new
        {
            RFQQuoteAccept = new[]
            {
                new
                {
                    rfqdealid = rfqdealid.InnerText,
                    rfqordernumber = rfqordernumber.InnerText,
                    product = product.InnerText,
                    usertype = usertype.InnerText,
                    quotetype = quotetype.InnerText,
                    isinnumber = isinnumber.InnerText,
                    value = correctedValue.ToString("0"),
                    proclient = proclient.InnerText,
                    buyerclientcode = "",
                    sellerclientcode = sellerclientcode.InnerText,
                    directbrokered = directbrokered.InnerText,
                    sellerbrokercode = sellerbrokercode.InnerText,
                    buyerbrokercode = "",
                    responderreferencenumber = "",
                    respondercomment = "",
                    rfqquoteaccept = "ACCEPT",
                    obpplatform = "NO",
                    filler2 = "",
                    filler3 = "",
                    filler4 = "",
                    filler5 = ""
                }
            }

        };



        string jsonPayload = Newtonsoft.Json.JsonConvert.SerializeObject(requestBody);
        // string checksum = SecurityHelper.GenerateChecksum(jsonPayload);

        return await SendRFQQuoteAccept(token, jsonPayload);
    }




    private async Task<string> SendRFQQuoteAccept(string token, string jsonPayload)
    {
        try
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://appdemo.bseindia.com/ICDMAPI/ICDMService.svc/");
                client.DefaultRequestHeaders.Add("PARTICIPANTID", "DFSPL");
                client.DefaultRequestHeaders.Add("DEALERID", "DFSPLD");
                client.DefaultRequestHeaders.Add("PASSWORD", "Dfspld@2025");
                client.DefaultRequestHeaders.Add("TOKEN", token);

                HttpContent content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync("RFQQuoteAccept ", content);
                string responseString = await response.Content.ReadAsStringAsync();
                dynamic responseBody = JsonConvert.DeserializeObject<dynamic>(responseString);


                return await response.Content.ReadAsStringAsync();

            }
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }

    private void SaveRFQOrderLog(dynamic requestBody)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@RFQDealId",requestBody.rfqdealid),
            new SqlParameter("@RFQOrderNumber", requestBody.rfqordernumber),
            new SqlParameter("@Product", requestBody.product),
            new SqlParameter("@UserType", requestBody.userType),
            new SqlParameter("@QuoteType", requestBody.quoteType),
            new SqlParameter("@ISINNumber", requestBody.isinNumber),
            new SqlParameter("@Value", requestBody.value),
            new SqlParameter("@ProClient", requestBody.proClient),
            new SqlParameter("@BuyerClientCode", requestBody.buyerClientCode),
            new SqlParameter("@SellerClientCode", requestBody.sellerClientCode),
            new SqlParameter("@DirectBrokered", requestBody.directBrokered),
            new SqlParameter("@SellerBrokerCode", requestBody.sellerBrokerCode),
            new SqlParameter("@BuyerBrokerCode", requestBody.buyerBrokerCode),
            new SqlParameter("@ResponderReferenceNumber", requestBody.responderReferenceNumber),
            new SqlParameter("@ResponderComment", requestBody.responderComment),
            new SqlParameter("@RFQQuoteAccept", requestBody.rfqQuoteAccept),
            new SqlParameter("@OBPPlatform", requestBody.obpPlatform),
            new SqlParameter("@Filler2", requestBody.filler2),
            new SqlParameter("@Filler3", requestBody.filler3),
            new SqlParameter("@Filler4", requestBody.filler4),
            new SqlParameter("@Filler5", requestBody.filler5)
        };
         SqlDBHelper.ExecuteNonQuery("SaveRFQQuoteAccept", parameters);
    }
    protected void txtISINNumber_TextChanged(object sender, EventArgs e)
    {
        GetRFQQuoteData(txtISINNumber.Text.Trim());
    }
    private void GetRFQQuoteData(string isinNumber)
    {
        string query = "EXEC usp_GetRFQSelectedFieldsByISIN @ISINNumber";
        Dictionary<string, object> parameters = new Dictionary<string, object>
    {
        {"@ISINNumber", isinNumber}
    };

        DataTable dt = SqlDBHelper.ExecuteQuery(query, parameters);

        if (dt.Rows.Count > 0)
        {
            DataRow row = dt.Rows[0];

            // Assign values to UI elements
            product.InnerText = row["bondtype"].ToString();
            directbrokered.InnerText = row["dealtype"].ToString();
            quotetype.InnerText = row["bidoffer"].ToString();
            isinnumber.InnerText = row["ISINNumber"].ToString();
            rfqordernumber.InnerText = row["rfqordernumber"].ToString();
            value.InnerText = row["value"].ToString();
            proclient.InnerText = row["ProClient"].ToString();
            usertype.InnerText = row["UserType"].ToString();
            sellerbrokercode.InnerText = row["SellerBrokerCode"].ToString();
            directbrokered.InnerText = row["DirectBrokered"].ToString();
            sellerclientcode.InnerText = row["SellerClientCode"].ToString();

            rfqdealid.InnerText = row["rfqdealid"].ToString();

        }

    }



    protected async void btnAcceptQuote_Click(object sender, EventArgs e)
    {
        string response = await RFQQuoteAccept();

    }

    protected void btnShowPopup_Click(object sender, EventArgs e)
    {

    }
}