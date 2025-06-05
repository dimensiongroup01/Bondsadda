using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LanguageExt.ClassInstances;
using Newtonsoft.Json;

public partial class BSE_INTEGRATION_RFQDealPropose : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthToken"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    private async Task<string> RFQQuotePropose()
    {
        string token = Session["AuthToken"] as string;
        if (string.IsNullOrEmpty(token))
        {
            Response.Redirect("Login.aspx");
            return "Authentication Failed";
        }



        //if (string.IsNullOrEmpty(txtISINNumber.Text.Trim()))
        //{
        //    return "ISIN and Value fields are required.";
        //}

        //decimal originalValue;
        //decimal correctedValue = 0;

        //if (decimal.TryParse(value.InnerText, out originalValue))
        //{
        //    correctedValue = originalValue * 10000000; // Multiply to restore the exact order value
        //}


        var requestBody = new
        {
            RFQDEALPROPOSE = new[]
            {
               new {
                        product= ddlProduct.SelectedValue,
                        usertype= userType.SelectedValue,
                        isinnumber= isinNumber.Text.Trim(),
                        rfqordernumber= txtRFQOrder.Text.Trim(),
                        rfqdealid= txtRFQDealID.Text.Trim(),
                        yieldtype= ddlYieldType.SelectedValue,
                        yield= yield.Text.Trim(),
                        price= price.Text.Trim(),
                        modacrint= txtModacrint.Text.Trim(),
                        consideration= txtConsideration.Text.Trim(),
                        maturity_call_putdate= txtMaturityDate.Text.Trim(),
                        settlementdate= txtSettlementDate.Text.Trim(),
                        clientcode= txtClientCode.Text.Trim(),
                        custodiancode= custodiancode.Text.Trim(),
                        bankifsc= bankifsc.Text.Trim(),
                        bankaccountnumber= bankaccountnumber.Text.Trim(),
                        dptype= ddlDPType.SelectedValue,
                        dpid= dpid.Text.Trim(),
                        dpclientid= dpclientid.Text.Trim(),
                        referencenumber= txtReferenceNumber.Text.Trim(),
                        proposeapprove= ddlProposeApprove.SelectedValue,
                        freeze= ddlFreeze.SelectedValue,
                        filler1= "",
                        filler2= "",
                        filler3= "",
                        filler4= "",
                        filler5= "",
               }

            }
        };





        string jsonPayload = Newtonsoft.Json.JsonConvert.SerializeObject(requestBody);
       string checksum = SecurityHelper.GenerateChecksum(jsonPayload);

        string apiResponse= await SendRFQQuotePropose(token, jsonPayload);

        dynamic responseObject = JsonConvert.DeserializeObject<dynamic>(apiResponse);
        var dealResponseList = (responseObject != null) ? responseObject.RFQPROPOSEDEALRESPONSE : null;

        if (dealResponseList != null && dealResponseList > 0)
        {
            dynamic responseItem = dealResponseList[0];
            int errorCode = responseItem.errorcode;

            if (errorCode == 0)
            {

                SaveRFQDealProposeLog(requestBody);
                SaveRFQDealProposeResponse(responseItem);

                return "✅ Deal proposed and saved successfully.";
            }
            else
            {
                return string.Format("❌ Deal proposal failed. Error: {0}", responseItem.message);

            }
        }
        else
        {
            return "❌ Invalid response from server.";

        }
    }




    private async Task<string> SendRFQQuotePropose(string token, string jsonPayload)
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
                HttpResponseMessage response = await client.PostAsync("RFQDealPropose", content);
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

    protected async void btnSubmit_Click(object sender, EventArgs e)
    {
        string response =  await RFQQuotePropose();
        lblMessage.Text = response;
    }
    private void SaveRFQDealProposeResponse(dynamic item)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
        new SqlParameter("@RFQDealId", (string)item.rfqdealid),
        new SqlParameter("@RFQOrderNumber", (string)item.rfqordernumber),
        new SqlParameter("@ICDMOrderNumber", (string)item.icdmordernumber),
        new SqlParameter("@ISINNumber", (string)item.isinnumber),
        new SqlParameter("@DealTime", DateTime.ParseExact((string)item.dealtime, "dd-MM-yyyy HH:mm:ss", null)),
        new SqlParameter("@Price", Convert.ToDecimal(item.price)),
        new SqlParameter("@Quantity", Convert.ToInt32(item.quantity)),
        new SqlParameter("@Consideration", Convert.ToDecimal(item.consideration)),
        new SqlParameter("@Value", Convert.ToDecimal(item.value)),
        new SqlParameter("@Yield", Convert.ToDecimal(item.yield)),
        new SqlParameter("@OrderStatus", (string)item.orderstatus),
        new SqlParameter("@DirectBrokered", (string)item.directbrokered),
        new SqlParameter("@SellerClientCode", (string)item.sellerclientcode),
        new SqlParameter("@BuyerClientCode", (string)item.buyerclientcode),
        new SqlParameter("@BrokerCode", (string)item.brokercode),
        new SqlParameter("@Freeze", (string)item.freeze),
        new SqlParameter("@SettlementDate", DateTime.ParseExact((string)item.settlementdate, "dd-MM-yyyy", null)),
        new SqlParameter("@ModifiedAccruedInterest", Convert.ToDecimal(item.modifiedaccruedinterest)),
        new SqlParameter("@Filler1", (string)item.filler1),
        new SqlParameter("@Filler2", (string)item.filler2),
        new SqlParameter("@Filler3", (string)item.filler3),
        new SqlParameter("@Filler4", (string)item.filler4),
        new SqlParameter("@Filler5", (string)item.filler5),
        new SqlParameter("@Message", (string)item.message),
        new SqlParameter("@ErrorCode", Convert.ToInt32(item.errorcode))
        };

        SqlDBHelper.ExecuteNonQuery("SaveRFQDealProposeResponse", parameters);
    }
    private void SaveRFQDealProposeLog(dynamic item)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
        new SqlParameter("@Product", item.product),
        new SqlParameter("@UserType", item.usertype),
        new SqlParameter("@ISINNumber", item.isinnumber),
        new SqlParameter("@RFQOrderNumber", item.rfqordernumber),
        new SqlParameter("@RFQDealId", item.rfqdealid),
        new SqlParameter("@YieldType", item.yieldtype),
        new SqlParameter("@Yield", item.yield),
        new SqlParameter("@Price", item.price),
        new SqlParameter("@ModAccruedInterest", item.modacrint),
        new SqlParameter("@Consideration", item.consideration),
        new SqlParameter("@MaturityCallPutDate", DateTime.ParseExact(item.maturity_call_putdate, "dd-MM-yyyy", null)),
        new SqlParameter("@SettlementDate", DateTime.ParseExact(item.settlementdate, "dd-MM-yyyy", null)),
        new SqlParameter("@ClientCode", item.clientcode),
        new SqlParameter("@CustodianCode", item.custodiancode),
        new SqlParameter("@BankIFSC", item.bankifsc),
        new SqlParameter("@BankAccountNumber", item.bankaccountnumber),
        new SqlParameter("@DPType", item.dptype),
        new SqlParameter("@DPID", item.dpid),
        new SqlParameter("@DPClientID", item.dpclientid),
        new SqlParameter("@ReferenceNumber", item.referencenumber),
        new SqlParameter("@ProposeApprove", item.proposeapprove),
        new SqlParameter("@Freeze", item.freeze),
        new SqlParameter("@Filler1", item.filler1),
        new SqlParameter("@Filler2", item.filler2),
        new SqlParameter("@Filler3", item.filler3),
        new SqlParameter("@Filler4", item.filler4),
        new SqlParameter("@Filler5", item.filler5),
        };

        SqlDBHelper.ExecuteNonQuery("SaveRFQDealPropose", parameters);
    }



}