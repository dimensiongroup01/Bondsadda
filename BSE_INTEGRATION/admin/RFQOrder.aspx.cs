using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentFormat.OpenXml.Office2010.Excel;
using DocumentFormat.OpenXml.Spreadsheet;
using LanguageExt.Pipes;
using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.Ocsp;

public partial class BSE_INTEGRATION_RFQOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["AuthToken"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        // Handle Bid and Offer visibility based on selected Quote Type
        //if (!IsPostBack)
        //{
        //    string quoteType = ddlQuoteType.SelectedValue;

        //    // Set initial visibility based on the selected Quote Type
        //    ddlQuoteType.Style["display"] = (quoteType == "BID") ? "block" : "none";
        //    ddlQuoteType.Style["display"] = (quoteType == "OFFER") ? "block" : "none";
        //}




    }
    





    private async Task<string> CreateRFQOrder()
    {
        var participantId = Session["participantId"] as string;
        var dealerId = Session["dealerId"] as string;
        var password = Session["password"] as string;
        var token = Session["AuthToken"] as string;

        if (string.IsNullOrEmpty(token))
        {
            Response.Redirect("Login.aspx");
            return "Authentication Failed";
        }



        if (string.IsNullOrEmpty(txtISINNumber.Text.Trim()))
        {
            return "ISIN and Value fields are required.";
        }

        var isBidSelected = ddlQuoteType.SelectedValue.Equals("BID", StringComparison.OrdinalIgnoreCase);
        var isOfferSelected = ddlQuoteType.SelectedValue.Equals("OFFER", StringComparison.OrdinalIgnoreCase);


        var requestBody = new
        {
            RFQORDERDETAILS = new[]
        {
                new
                {
                  product = ddlProduct.SelectedValue,
                    usertype = "BROKER",
                    quotetype = ddlQuoteType.SelectedValue,
                    isinnumber = txtISINNumber.Text.Trim(),
                    rating = txtRating.SelectedValue.Trim(),
                    ratingagency = ddlRatingAgency.SelectedValue.Trim(),
                    bidvalue = isBidSelected ? (string.IsNullOrWhiteSpace(txtBidValue.Text) ? 0 : Convert.ToInt64(txtBidValue.Text)) : 0,
                    offervalue = isOfferSelected ? (string.IsNullOrWhiteSpace(txtOfferValue.Text) ? 0 : Convert.ToInt64(txtOfferValue.Text)) : 0,
                    bidminvalue = isBidSelected ? (string.IsNullOrWhiteSpace(txtBidMinValue.Text) ? 0 : Convert.ToInt64(txtBidMinValue.Text)) : 0,
                    offerminvalue = isOfferSelected ? (string.IsNullOrWhiteSpace(txtOfferMinValue.Text) ? 0 : Convert.ToInt64(txtOfferMinValue.Text)) : 0,
                    bidyieldtype = isBidSelected ? ddlBidYieldType.SelectedValue : "",
                    offeryieldtype = isOfferSelected ? ddlOfferYieldType.SelectedValue : "",
                    bidyield = isBidSelected ? (string.IsNullOrWhiteSpace(txtBidYieldValue.Text) ? 0.0000m : Math.Round(Convert.ToDecimal(txtBidYieldValue.Text), 4)) : 0.0000m,
                    offeryield = isOfferSelected ? (string.IsNullOrWhiteSpace(txtOfferYieldValue.Text) ? 0.0000m : Math.Round(Convert.ToDecimal(txtOfferYieldValue.Text), 4)) : 0.0000m,
                    bidprice = isBidSelected ? (string.IsNullOrWhiteSpace(txtBidPrice.Text) ? 0.0000m : Math.Round(Convert.ToDecimal(txtBidPrice.Text), 4)) : 0.0000m,
                    offerprice = isOfferSelected ? (string.IsNullOrWhiteSpace(txtOfferPrice.Text) ? 0.0000m : Math.Round(Convert.ToDecimal(txtOfferPrice.Text), 4)) : 0.0000m,
                    settlementtype= ddlSettleType.SelectedValue,
                    gfd = chkGFD.Checked ? "1" : "0",
                    dealtimehours = ddlDealTimeHours.SelectedValue,
                    dealtimeminutes = ddlDealTimeMinutes.SelectedValue,
                    otmoto = ddlOtoOtm.SelectedValue,
                    proclient = ddlProClient.SelectedValue,
                    buyerclientcode = "DFSPL",
                    sellerclientcode = "DFSPLD",
                    directbrokered = ddlUserType.SelectedValue,
                    sellerbrokercode = "",
                    buyerbrokercode = txtBrokerName.Text.Trim(),
                    negotiableflag = ddlNegotiableTag.SelectedValue,
                    disclosedidentity = ddlDisclosedIdentity.SelectedValue,
                    initiatorreferencenumber = "",
                    initiatorcomment = "Done thrugh online ",
                    obpplatform = ddlObpPlatform.SelectedValue,
                    filler2="",
                    filler3="",
                    filler4="",
                    filler5 ="",

                }
         }
        };





      //  SaveRFQOrderLog(requestBody);
        string jsonPayload = Newtonsoft.Json.JsonConvert.SerializeObject(requestBody);
        string checksum = SecurityHelper.GenerateChecksum(jsonPayload);

        return await SendRFQOrderRequest(token, jsonPayload, password, participantId, dealerId );

    }

    private async Task<string> SendRFQOrderRequest(string token, string jsonPayload, string password, string participantid, string dealerid)
    {
        try
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://appdemo.bseindia.com/ICDMAPI/ICDMService.svc/");
                client.DefaultRequestHeaders.Add("PARTICIPANTID", participantid);
                client.DefaultRequestHeaders.Add("DEALERID", dealerid);
                client.DefaultRequestHeaders.Add("PASSWORD", password);
                client.DefaultRequestHeaders.Add("TOKEN", token);
               

                HttpContent content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync("AddRFQOrder", content);
                string responseString = await response.Content.ReadAsStringAsync();
                dynamic responseBody = JsonConvert.DeserializeObject<dynamic>(responseString);
            
              
                if (response != null && responseBody.RFQOrderResponseList != null)
                {
                    var responses = responseBody.RFQOrderResponseList[0]; // Get first response

                    // Convert response to JSON string for JavaScript
                    string responseScript = "showReceipt(" + JsonConvert.SerializeObject(responses) + ");";

                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowReceipt", responseScript, true);
                }

                return await response.Content.ReadAsStringAsync();

            }
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }

    protected async void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "Processing RFQ, please wait...";

        string response = await CreateRFQOrder(); // JSON string

        RFQResponse rfqResponse = JsonConvert.DeserializeObject<RFQResponse>(response);

        if (rfqResponse != null && rfqResponse.errorcode == 0)
        {
            string json = JsonConvert.SerializeObject(rfqResponse);
            SaveRFQOrderResponse(json); // Save as string
            lblMessage.Text = "✅ RFQ Created Successfully: " + rfqResponse.message;
        }
        else
        {
            string errorMessage = "Unknown error";
            if (rfqResponse != null && rfqResponse.message != null)
            {
                errorMessage = rfqResponse.message;
            }
            lblMessage.Text = "❌ Failed to create RFQ: " + errorMessage;

        }
    }


    private void SaveRFQOrderLog(dynamic requestBody)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
        new SqlParameter("@Product", requestBody.RFQORDERDETAILS[0].product),
       
        new SqlParameter("@UserType", requestBody.RFQORDERDETAILS[0].usertype),
        new SqlParameter("@QuoteType", requestBody.RFQORDERDETAILS[0].quotetype),
        new SqlParameter("@ISINNumber", requestBody.RFQORDERDETAILS[0].isinnumber),
        new SqlParameter("@Rating", requestBody.RFQORDERDETAILS[0].rating),
        new SqlParameter("@RatingAgency", requestBody.RFQORDERDETAILS[0].ratingagency),
        new SqlParameter("@BidValue", requestBody.RFQORDERDETAILS[0].bidvalue),
        new SqlParameter("@OfferValue", requestBody.RFQORDERDETAILS[0].offervalue),
        new SqlParameter("@BidMinValue", requestBody.RFQORDERDETAILS[0].bidminvalue),
        new SqlParameter("@OfferMinValue", requestBody.RFQORDERDETAILS[0].offerminvalue),
        new SqlParameter("@BidYieldType", requestBody.RFQORDERDETAILS[0].bidyieldtype),
        new SqlParameter("@OfferYieldType", requestBody.RFQORDERDETAILS[0].offeryieldtype),
        new SqlParameter("@BidYield", requestBody.RFQORDERDETAILS[0].bidyield),
        new SqlParameter("@OfferYield", requestBody.RFQORDERDETAILS[0].offeryield),
        new SqlParameter("@BidPrice", requestBody.RFQORDERDETAILS[0].bidprice),
        new SqlParameter("@OfferPrice", requestBody.RFQORDERDETAILS[0].offerprice),
        new SqlParameter("@SettlementType", requestBody.RFQORDERDETAILS[0].settlementtype),
        new SqlParameter("@GFD", requestBody.RFQORDERDETAILS[0].gfd),
        new SqlParameter("@DealTimeHours", requestBody.RFQORDERDETAILS[0].dealtimehours),
        new SqlParameter("@DealTimeMinutes", requestBody.RFQORDERDETAILS[0].dealtimeminutes),
        new SqlParameter("@OtmOto", requestBody.RFQORDERDETAILS[0].otmoto),
        new SqlParameter("@ProClient", requestBody.RFQORDERDETAILS[0].proclient),
        new SqlParameter("@BuyerClientCode", requestBody.RFQORDERDETAILS[0].buyerclientcode),
        new SqlParameter("@SellerClientCode", requestBody.RFQORDERDETAILS[0].sellerclientcode),
        new SqlParameter("@DirectBrokered", requestBody.RFQORDERDETAILS[0].directbrokered),
        new SqlParameter("@SellerBrokerCode", requestBody.RFQORDERDETAILS[0].sellerbrokercode),
        new SqlParameter("@BuyerBrokerCode", requestBody.RFQORDERDETAILS[0].buyerbrokercode),
        new SqlParameter("@NegotiableFlag", requestBody.RFQORDERDETAILS[0].negotiableflag),
        new SqlParameter("@DisclosedIdentity", requestBody.RFQORDERDETAILS[0].disclosedidentity),
        new SqlParameter("@InitiatorReferenceNumber", requestBody.RFQORDERDETAILS[0].initiatorreferencenumber),
        new SqlParameter("@InitiatorComment", requestBody.RFQORDERDETAILS[0].initiatorcomment),
        new SqlParameter("@ObpPlatform", requestBody.RFQORDERDETAILS[0].obpplatform),
        new SqlParameter("@Filler2", requestBody.RFQORDERDETAILS[0].filler2),
        new SqlParameter("@Filler3", requestBody.RFQORDERDETAILS[0].filler3),
        new SqlParameter("@Filler4", requestBody.RFQORDERDETAILS[0].filler4),
        new SqlParameter("@Filler5", requestBody.RFQORDERDETAILS[0].filler5),
         new SqlParameter("@custmobno", int.Parse(txtcustmob.Text))

        };

        SqlDBHelper.ExecuteNonQuery("SaveRFQOrderLog", parameters);
    }
    private void SaveRFQOrderResponse(string jsonResponse)
    {
        try
        {
            // Deserialize the JSON string into a dynamic object
            dynamic responseBody = JsonConvert.DeserializeObject<dynamic>(jsonResponse);

            // Ensure the response contains the expected structure
            if (responseBody != null && responseBody.RFQOrderResponseList != null)
            {
                foreach (var response in responseBody.RFQOrderResponseList)
                {
                    SqlParameter[] parameters = new SqlParameter[]
                    {
                    new SqlParameter("@BidMinValue", (decimal)response.bidminvalue),
                   
                    new SqlParameter("@BidPrice", (decimal)response.bidprice),
                    new SqlParameter("@BidQuantity", (int)response.bidquantity),
                    new SqlParameter("@BidRFQOrderNumber", (string)response.bidrfqordernumber),
                    new SqlParameter("@BidValue", (decimal)response.bidvalue),
                    new SqlParameter("@BidYield", (decimal)response.bidyield),
                    new SqlParameter("@DealTime", DateTime.ParseExact((string)response.dealtime, "dd-MM-yyyy HH:mm:ss", CultureInfo.InvariantCulture)),
                    new SqlParameter("@DirectBrokered", (string)response.directbrokered),
                    new SqlParameter("@ErrorCode", (int)response.errorcode),
                    new SqlParameter("@Filler2", (string)response.filler2 ?? ""),
                    new SqlParameter("@Filler3", (string)response.filler3 ?? ""),
                    new SqlParameter("@Filler4", (string)response.filler4 ?? ""),
                    new SqlParameter("@Filler5", (string)response.filler5 ?? ""),
                    new SqlParameter("@InitiatorBrokerCode", (string)response.initiatorbrokercode),
                    new SqlParameter("@InitiatorComment", (string)response.initiatorcomment ?? ""),
                    new SqlParameter("@InitiatorReferenceNumber", (string)response.initiatorreferencenumber ?? ""),
                    new SqlParameter("@ISINNumber", (string)response.isinnumber),
                    new SqlParameter("@Message", (string)response.message),
                    new SqlParameter("@OBPPlatform", (string)response.obpplatform),
                    new SqlParameter("@OfferMinValue", (decimal)response.offerminvalue),
                    new SqlParameter("@OfferPrice", (decimal)response.offerprice),
                    new SqlParameter("@OfferQuantity", (int)response.offerquantity),
                    new SqlParameter("@OfferRFQOrderNumber", (string)response.offerrfqordernumber ?? ""),
                    new SqlParameter("@OfferValue", (decimal)response.offervalue),
                    new SqlParameter("@OfferYield", (decimal)response.offeryield),
                    new SqlParameter("@OrderStatus", (string)response.orderstatus),
                    new SqlParameter("@OtmOto", (string)response.otmoto),
                    new SqlParameter("@OtoParticipant", (string)response.otoparticipant),
                    new SqlParameter("@ProClient", (string)response.proclient),
                    new SqlParameter("@QuoteType", (string)response.quotetype),
                    new SqlParameter("@RFQDealId", (string)response.rfqdealid),
                    new SqlParameter("@SettlementDate", DateTime.ParseExact((string)response.settlementdate, "dd-MM-yyyy", CultureInfo.InvariantCulture)),
                    new SqlParameter("@custmobno", txtcustmob.Text.Trim())


                    };  

                    // Call stored procedure
                    SqlDBHelper.ExecuteNonQuery("SaveRFQOrderResponse", parameters);
                }
            }
            else
             {
                Console.WriteLine("Invalid JSON format or missing RFQOrderResponseList.");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }

    }

}
public class RFQResponse
{
    public string message { get; set; }
    public int errorcode { get; set; }
}

public class RFQResponseRoot
{
    public List<RFQResponse> RFQResponseList { get; set; }
}



