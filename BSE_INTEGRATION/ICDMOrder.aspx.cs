using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BSE_INTEGRATION_ICDMOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadTimeDropdowns();
        }

        if (Session["AuthToken"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    private void LoadTimeDropdowns()
    {
        ddlHours.Items.Add(new ListItem("-- HH --", ""));
        for (int i = 9; i <= 18; i++)
        {
            ddlHours.Items.Add(new ListItem(i.ToString("D2"), i.ToString("D2")));
        }

        ddlMinutes.Items.Add(new ListItem("-- MM --", ""));
        for (int i = 0; i < 60; i += 1)
        {
            ddlMinutes.Items.Add(new ListItem(i.ToString("D2"), i.ToString("D2")));
        }
    }

    protected void ddlIsBroker_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtBrokeredName.Enabled = ddlIsBroker.SelectedValue == "BROKERED";
        if (!txtBrokeredName.Enabled)
        {
            txtBrokeredName.Text = "";
        }
    }

    private async Task<string> CreateICDMOrder()
    {
        string token = Session["AuthToken"] as string;
        if (string.IsNullOrEmpty(token))
        {
            Response.Redirect("Login.aspx");
            return "Authentication Failed";
        }

        if (string.IsNullOrEmpty(ddlHours.SelectedValue) || string.IsNullOrEmpty(ddlMinutes.SelectedValue))
        {
            return "Please select a valid Execution Time (HH:MM)";
        }

        if (string.IsNullOrEmpty(txtISIN.Text.Trim()) || string.IsNullOrEmpty(txtValue.Text.Trim()))
        {
            return "ISIN and Value fields are required.";
        }

        string executionTime = ddlHours.SelectedValue + ":" + ddlMinutes.SelectedValue;

        var requestBody = new
        {
            ORDERDETAILS = new[]
            {
                new
                {
                    orderflag = "A",
                    ordernumber = (string)null,
                    isinnumber = txtISIN.Text.Trim(),
                    issuetype = ddlIssueType.SelectedValue,
                    bondtype = 1,
                    symbol = "",
                    ordertype = int.Parse(ddlOrderType.SelectedValue),
                    previousdaydeal = chkpreviousdaydeal.Checked ? "Y" : "N",
                    value = txtValue.Text.Trim(),
                    price  = txtPrice.Text.Trim(),
                    settledays = ddlSettleDays.SelectedValue,
                    modaccr = txtModAcrr.Text.Trim(),
                    sellerparticipantloginid = txtSellerParticipantLoginId.Text.Trim(),
                    sellerdealerloginid = txtSellerDealerLoginId.Text.Trim(),
                    sellerclientloginid = txtSellerClientLoginId.Text.Trim(),
                    buyerparticipantloginid = (string)null,
                    buyerdealerloginid = txtBuyerDealerId.Text.Trim(),
                    buyerclientloginid = txtBuyerClientId.Text.Trim(),
                    executiontime = executionTime,
                    settletype = 1,
                    yieldtype = ddlYieldType.SelectedValue,
                    yield = txtYield.Text.Trim(),
                    isbroker = ddlIsBroker.SelectedValue,
                    brokeredname = txtBrokeredName.Text.Trim(),
                    sellercustodians = "BSECUST1",
                    sellerreferenceno = txtSellerReferenceno.Text.Trim(),
                    depositoryparticipant1 = (string)null,
                    buyercustodians = "BSECUST1",
                    buyerreferenceno = "",
                    depositoryparticipant2 = (string)null,
                    dealinitiatorloginid = "BSEFI",
                    filler1 = (string)null,
                    filler2 = (string)null,
                    filler3 = (string)null,
                    filler4 = (string)null,
                    filler5 = (string)null,
                    sellerbankac = "",
                    sellerifsccode = "",
                    sellerdpid = "",
                    sellerdpclientid = "",
                    buyerbankac = "",
                    buyerifsccode = "",
                    buyerdpid = "",
                    buyerdpclientid = "",
                    buyerautoapprove = "Y",
                    sellerautoapprove = "Y",
                    buyerautosettle = "Y",
                    sellerautosettle = "Y"
                }
            }
        };

        string jsonPayload = Newtonsoft.Json.JsonConvert.SerializeObject(requestBody);
       // string checksum = SecurityHelper.GenerateChecksum(jsonPayload);

        return await SendICDMOrderRequest(token, jsonPayload);
    }

    private async Task<string> SendICDMOrderRequest(string token, string jsonPayload)
    {
        try
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://appdemo.bseindia.com/ICDMAPI/ICDMService.svc/");
                client.DefaultRequestHeaders.Add("TOKEN", token);
             
                HttpContent content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync("AddICDMOrder", content);
                string responseString = await response.Content.ReadAsStringAsync();

                SaveICDMOrderResponse(responseString); // Save response in DB
                return await response.Content.ReadAsStringAsync();
            }
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }
    private void SaveICDMOrderLog()
    {
        string query = @"
    INSERT INTO ICDMOrderLogs (
        OrderFlag, OrderNumber, ISINNumber, IssueType, BondType, Symbol, OrderType, PreviousDayDeal, 
        Value, Price, SettleDays, ModAccr, SellerParticipantLoginId, SellerDealerLoginId, 
        SellerClientLoginId, BuyerParticipantLoginId, BuyerDealerLoginId, BuyerClientLoginId, 
        ExecutionTime, SettleType, YieldType, Yield, IsBroker, BrokeredName, SellerCustodians, 
        SellerReferenceNo, DepositoryParticipant1, BuyerCustodians, BuyerReferenceNo, DepositoryParticipant2, 
        DealInitiatorLoginId, Filler1, Filler2, Filler3, Filler4, Filler5, SellerBankAC, 
        SellerIFSCCode, SellerDPID, SellerDPClientID, BuyerBankAC, BuyerIFSCCode, BuyerDPID, 
        BuyerDPClientID, BuyerAutoApprove, SellerAutoApprove, BuyerAutoSettle, SellerAutoSettle
    ) 
    VALUES (
        @OrderFlag, @OrderNumber, @ISINNumber, @IssueType, @BondType, @Symbol, @OrderType, @PreviousDayDeal, 
        @Value, @Price, @SettleDays, @ModAccr, @SellerParticipantLoginId, @SellerDealerLoginId, 
        @SellerClientLoginId, @BuyerParticipantLoginId, @BuyerDealerLoginId, @BuyerClientLoginId, 
        @ExecutionTime, @SettleType, @YieldType, @Yield, @IsBroker, @BrokeredName, @SellerCustodians, 
        @SellerReferenceNo, @DepositoryParticipant1, @BuyerCustodians, @BuyerReferenceNo, @DepositoryParticipant2, 
        @DealInitiatorLoginId, @Filler1, @Filler2, @Filler3, @Filler4, @Filler5, @SellerBankAC, 
        @SellerIFSCCode, @SellerDPID, @SellerDPClientID, @BuyerBankAC, @BuyerIFSCCode, @BuyerDPID, 
        @BuyerDPClientID, @BuyerAutoApprove, @SellerAutoApprove, @BuyerAutoSettle, @SellerAutoSettle
    )";
        string executionTime = ddlHours.SelectedValue + ":" + ddlMinutes.SelectedValue;

        Dictionary<string, object> parameters = new Dictionary<string, object>
    {
        { "@OrderFlag", "A" },
        { "@OrderNumber", DBNull.Value },
        { "@ISINNumber", txtISIN.Text.Trim() },
        { "@IssueType", ddlIssueType.SelectedValue },
        { "@BondType", 1 },
        { "@Symbol", "" },
        { "@OrderType", int.Parse(ddlOrderType.SelectedValue) },
        { "@PreviousDayDeal", chkpreviousdaydeal.Checked ? "Y" : "N" },
        { "@Value", txtValue.Text.Trim() },
        { "@Price", txtPrice.Text.Trim() },
        { "@SettleDays", ddlSettleDays.SelectedValue },
        { "@ModAccr", txtModAcrr.Text.Trim() },
        { "@SellerParticipantLoginId", txtSellerParticipantLoginId.Text.Trim() },
        { "@SellerDealerLoginId", txtSellerDealerLoginId.Text.Trim() },
        { "@SellerClientLoginId", txtSellerClientLoginId.Text.Trim() },
        { "@BuyerParticipantLoginId", DBNull.Value },
        { "@BuyerDealerLoginId", txtBuyerDealerId.Text.Trim() },
        { "@BuyerClientLoginId", txtBuyerClientId.Text.Trim() },
        { "@ExecutionTime", executionTime },
        { "@SettleType", 1 },
        { "@YieldType", ddlYieldType.SelectedValue },
        { "@Yield", txtYield.Text.Trim() },
        { "@IsBroker", ddlIsBroker.SelectedValue },
        { "@BrokeredName", txtBrokeredName.Text.Trim() },
        { "@SellerCustodians", "BSECUST1" },
        { "@SellerReferenceNo", txtSellerReferenceno.Text.Trim() },
        { "@DepositoryParticipant1", DBNull.Value },
        { "@BuyerCustodians", "BSECUST1" },
        { "@BuyerReferenceNo", "" },
        { "@DepositoryParticipant2", DBNull.Value },
        { "@DealInitiatorLoginId", "BSEFI" },
        { "@Filler1", DBNull.Value },
        { "@Filler2", DBNull.Value },
        { "@Filler3", DBNull.Value },
        { "@Filler4", DBNull.Value },
        { "@Filler5", DBNull.Value },
        { "@SellerBankAC", "" },
        { "@SellerIFSCCode", "" },
        { "@SellerDPID", "" },
        { "@SellerDPClientID", "" },
        { "@BuyerBankAC", "" },
        { "@BuyerIFSCCode", "" },
        { "@BuyerDPID", "" },
        { "@BuyerDPClientID", "" },
        { "@BuyerAutoApprove", "Y" },
        { "@SellerAutoApprove", "Y" },
        { "@BuyerAutoSettle", "Y" },
        { "@SellerAutoSettle", "Y" }
    };

        SqlDBHelper.ExecuteNonQuery(query, parameters);
    }

   private void SaveICDMOrderResponse(string jsonResponse)
{
    try
    {
        var response = JsonSerializer.Deserialize<Dictionary<string, List<Dictionary<string, JsonElement>>>>(jsonResponse);

        if (response != null && response.ContainsKey("OrderResponseList"))
        {
            foreach (var order in response["OrderResponseList"])
            {
                // 🔍 Debugging: Print/log values before saving


                    string query = @"
                INSERT INTO ICDMOrderResponses 
                (BuyerReferenceNo, Consideration, DealTime, ErrorCode, ISINNumber, Message, ModAccr, OrderNumber, Quantity, SellerReferenceNo, Status, Symbol, Value)
                VALUES 
                (@BuyerReferenceNo, @Consideration, @DealTime, @ErrorCode, @ISINNumber, @Message, @ModAccr, @OrderNumber, @Quantity, @SellerReferenceNo, @Status, @Symbol, @Value)";

                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "@BuyerReferenceNo", GetJsonValue(order, "buyerreferenceno") },
                    { "@Consideration", GetJsonValue(order, "consideration", true) },
                    { "@DealTime", GetJsonValue(order, "dealtime") },
                    { "@ErrorCode", GetJsonValue(order, "errorcode", true) },
                    { "@ISINNumber", GetJsonValue(order, "isinnumber") },
                    { "@Message", GetJsonValue(order, "message") },
                    { "@ModAccr", GetJsonValue(order, "modaccr", true) },
                    { "@OrderNumber", GetJsonValue(order, "ordernumber") },
                    { "@Quantity", GetJsonValue(order, "quantity", true) },
                    { "@SellerReferenceNo", GetJsonValue(order, "sellerreferenceno") },
                    { "@Status", GetJsonValue(order, "status", true) },
                    { "@Symbol", GetJsonValue(order, "symbol") },
                    { "@Value", GetJsonValue(order, "value", true) }
                };

               
               
             

                // Execute the query
                int rowsAffected = SqlDBHelper.ExecuteNonQuery(query, parameters);
               
            }
        }
    }
    catch (Exception ex)
    {
        Response.Write("Error saving response: " + ex.Message);
    }
}


    private object GetJsonValue(Dictionary<string, JsonElement> json, string key, bool isNumeric = false)
    {
        if (!json.ContainsKey(key) || json[key].ValueKind == JsonValueKind.Null)
            return DBNull.Value;

        try
        {
            if (isNumeric)
            {
                string value = json[key].ToString();
                if (string.IsNullOrEmpty(value)) return DBNull.Value;

                decimal numValue;
                if (decimal.TryParse(value, out numValue))
                    return numValue;
            }

            string strValue = json[key].ToString();
            return string.IsNullOrEmpty(strValue) ? (object)DBNull.Value : (object)strValue;
        }
        catch
        {
            return DBNull.Value;
        }
    }



    protected async void btnCreateICDM_Click(object sender, EventArgs e)
    {
        SaveICDMOrderLog();
        lblMessage.Text = "Processing order, please wait...";
        string response = await CreateICDMOrder();
        lblMessage.Text = response;
    }
}
