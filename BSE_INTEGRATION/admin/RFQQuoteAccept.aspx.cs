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

        if (decimal.TryParse(txtValue.Text, out originalValue))
        {
            correctedValue = originalValue * 10000000; // Multiply to restore the exact order value
        }


        var requestBody = new
        {
            RFQQuoteAccept = new[]
                         {
                            new
                            {
                                rfqdealid = txtRFQDealID.Text.Trim(),
                                rfqordernumber = txtRFQOrderNumber.Text.Trim(),
                                product = ddlProduct.SelectedValue,
                                usertype = lblUserType.Text.Trim(),
                                quotetype = ddlQuoteType.SelectedValue,
                                isinnumber = txtISINNumber.Text.Trim(),
                                value = correctedValue.ToString("0"),
                                proclient = txtProClientCode.Text.Trim(),
                                buyerclientcode = txtBuyerClientCode.Text.Trim(),
                                sellerclientcode = txtSellerClientCode.Text.Trim(),
                                directbrokered = rblDirectBrokered.SelectedValue,
                                sellerbrokercode = lblSellerBrokerCode.Text.Trim(),
                                buyerbrokercode = "DFSPL",
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
        string checksum = SecurityHelper.GenerateChecksum(jsonPayload);

        return await SendRFQQuoteAccept(token, jsonPayload);
    }




    private async Task<string> SendRFQQuoteAccept(string token, string jsonPayload)
    {
        try
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://nds.bseindia.com/ICDM_API/ICDMService.svc/");
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
    private void SaveRFQQuoteAcceptResponse(dynamic responseItem)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
        new SqlParameter("@AccruedInterest", responseItem.accuredinterest),
        new SqlParameter("@BuyerClientCode", responseItem.buyerclientcode ?? string.Empty),
        new SqlParameter("@Consideration", responseItem.consideration),
        new SqlParameter("@DealTime", DateTime.ParseExact((string)responseItem.dealtime, "dd-MM-yyyy HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture)),
        new SqlParameter("@DirectBrokered", responseItem.directbrokered),
        new SqlParameter("@ErrorCode", responseItem.errorcode),
        new SqlParameter("@Filler2", responseItem.filler2 ?? string.Empty),
        new SqlParameter("@Filler3", responseItem.filler3 ?? string.Empty),
        new SqlParameter("@Filler4", responseItem.filler4 ?? string.Empty),
        new SqlParameter("@Filler5", responseItem.filler5 ?? string.Empty),
        new SqlParameter("@ISINNumber", responseItem.isinnumber),
        new SqlParameter("@Message", responseItem.message),
        new SqlParameter("@OBPPlatform", responseItem.obpplatform),
        new SqlParameter("@OrderStatus", responseItem.orderstatus),
        new SqlParameter("@OtMoTo", responseItem.otmoto),
        new SqlParameter("@Price", responseItem.price),
        new SqlParameter("@QuoteType", responseItem.quotetype),
        new SqlParameter("@ResponderBrokerCode", responseItem.responderbrokercode),
        new SqlParameter("@ResponderReferenceNumber", responseItem.responderreferencenumber ?? string.Empty),
        new SqlParameter("@RFQDealId", responseItem.rfqdealid),
        new SqlParameter("@RFQOrderNumber", responseItem.rfqordernumber),
        new SqlParameter("@SellerClientCode", responseItem.sellerclientcode),
        new SqlParameter("@Value", responseItem.value),
        new SqlParameter("@Yield", responseItem.yield)
        };

        SqlDBHelper.ExecuteNonQuery("SaveRFQQuoteAcceptResponse", parameters);
    }

    protected void txtISINNumber_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtRFQDealID.Text.Trim()))
        {
            GetRFQQuoteData(txtRFQDealID.Text.Trim());
        }
        else
        {
            lblMessage.Text = "Please enter a valid RFQ Deal ID.";
        }
    }

    private void GetRFQQuoteData(string rfqdealid)
    {
        try
        {
            string query = "EXEC usp_GetRFQSelectedFieldsByISIN @rfqdealid";
            Dictionary<string, object> parameters = new Dictionary<string, object>
        {
            { "@rfqdealid", rfqdealid }
        };

            DataTable dt = SqlDBHelper.ExecuteQuery(query, parameters);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                SetDropDownListValue(ddlProduct, row["bondtype"] != null ? row["bondtype"].ToString() : "");
                SetRadioButtonListValue(rblDirectBrokered, row["dealtype"] != null ? row["dealtype"].ToString() : "");
                SetDropDownListValue(ddlQuoteType, row["bidoffer"] != null ? row["bidoffer"].ToString() : "");

                txtISINNumber.Text = row["ISINNumber"] != null ? row["ISINNumber"].ToString() : "";
                txtRFQOrderNumber.Text = row["rfqordernumber"] != null ? row["rfqordernumber"].ToString() : "";
                txtValue.Text = row["value"] != null ? row["value"].ToString() : "";
                txtProClientCode.Text = row["ProClient"] != null ? row["ProClient"].ToString() : "";
                lblUserType.Text = row["UserType"] != null ? row["UserType"].ToString() : "";
                lblSellerBrokerCode.Text = row["SellerBrokerCode"] != null ? row["SellerBrokerCode"].ToString() : "";
                SetRadioButtonListValue(rblDirectBrokered, row["DirectBrokered"] != null ? row["DirectBrokered"].ToString() : "");
                txtSellerClientCode.Text = row["SellerClientCode"] != null ? row["SellerClientCode"].ToString() : "";
                txtRFQDealID.Text = row["rfqdealid"] != null ? row["rfqdealid"].ToString() : "";


                lblMessage.Text = "";
            }
            else
            {
                lblMessage.Text = "No data found for this RFQ Deal ID.";
                ClearFormFields();
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error fetching data: " + ex.Message;
        }
    }

    private void SetDropDownListValue(DropDownList ddl, string value)
    {
        if (!string.IsNullOrEmpty(value))
        {
            ListItem item = ddl.Items.FindByValue(value);
            if (item != null)
            {
                ddl.SelectedValue = value;
            }
            else
            {
                ddl.ClearSelection();
            }
        }
    }

    private void SetRadioButtonListValue(RadioButtonList rbl, string value)
    {
        if (!string.IsNullOrEmpty(value))
        {
            ListItem item = rbl.Items.FindByValue(value);
            if (item != null)
            {
                rbl.SelectedValue = value;
            }
            else
            {
                rbl.ClearSelection();
            }
        }
    }

    private void ClearFormFields()
    {
        txtISINNumber.Text = "";
        txtRFQOrderNumber.Text = "";
        ddlProduct.ClearSelection();
        ddlQuoteType.ClearSelection();
        txtValue.Text = "";
        txtProClientCode.Text = "";
        lblUserType.Text = "";
        lblSellerBrokerCode.Text = "";
        rblDirectBrokered.ClearSelection();
        txtSellerClientCode.Text = "";
    }

    protected async void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            // Save original request before making API call (optional)
            // SaveRFQOrderLog(requestObject); // Uncomment if you have access to request before call

            string response = await RFQQuoteAccept(); // Make API call
            RFQResponse rfqResponse = JsonConvert.DeserializeObject<RFQResponse>(response);

            if (rfqResponse != null && rfqResponse.RFQQuoteAcceptResponseList != null && rfqResponse.RFQQuoteAcceptResponseList.Count > 0)

            {
                var responseItem = rfqResponse.RFQQuoteAcceptResponseList[0];

                if (responseItem.errorcode == 0)
                {
                    SaveRFQQuoteAcceptResponse(responseItem); // Save response object
                    SaveRFQOrderLog(responseItem); // Save as request log (if fields match)

                    lblMessage.Text = "✅ RFQ Accepted Successfully: " + responseItem.message;
                }
                else
                {
                    lblMessage.Text = "❌ RFQ Failed: " + responseItem.message;
                }
            }
            else
            {
                lblMessage.Text = "❌ Invalid or empty response.";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "❌ Error during submission: " + ex.Message;
        }
    }
   

    protected void btnShowPopup_Click(object sender, EventArgs e)
    {

    }

    protected void btnCloseQuote_Click(object sender, EventArgs e)
    {
        // Optional: Logic for modal close, if any
        // Or simply leave empty if modal is closed via JavaScript
    }
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (!IsPostBack)
    //    {
    //        btnCloseModal.Attributes["data-bs-dismiss"] = "modal";
    //    }
    //}
    public class RFQQuoteAcceptResponseItem
    {
        public decimal accuredinterest { get; set; }
        public string buyerclientcode { get; set; }
        public decimal consideration { get; set; }
        public string dealtime { get; set; }
        public string directbrokered { get; set; }
        public int errorcode { get; set; }
        public string filler2 { get; set; }
        public string filler3 { get; set; }
        public string filler4 { get; set; }
        public string filler5 { get; set; }
        public string isinnumber { get; set; }
        public string message { get; set; }
        public string obpplatform { get; set; }
        public string orderstatus { get; set; }
        public string otmoto { get; set; }
        public decimal price { get; set; }
        public string quotetype { get; set; }
        public string responderbrokercode { get; set; }
        public string responderreferencenumber { get; set; }
        public string rfqdealid { get; set; }
        public string rfqordernumber { get; set; }
        public string sellerclientcode { get; set; }
        public decimal value { get; set; }
        public decimal yield { get; set; }
    }

    public class RFQResponse
    {
        public List<RFQQuoteAcceptResponseItem> RFQQuoteAcceptResponseList { get; set; }
    }

}
