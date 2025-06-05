using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class BSE_INTEGRATION_RFQApprove : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthToken"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    private async Task<string> RFQQuoteApprove()
    {
        string token = Session["AuthToken"] as string;
        if (string.IsNullOrEmpty(token))
        {
            Response.Redirect("Login.aspx");
            return "Authentication Failed";
        }



        ////if (string.IsNullOrEmpty(txtISINNumber.Text.Trim()))
        ////{
        ////    return "ISIN and Value fields are required.";
        ////}

        //decimal originalValue;
        //decimal correctedValue = 0;

        //if (decimal.TryParse(value.InnerText, out originalValue))
        //{
        //    correctedValue = originalValue * 10000000; // Multiply to restore the exact order value
        //}


        var requestBody = new
        {
            BROKER_RFQDEALAPPROVE = new[]
            {
               new {
                        product= "ICDM",
                        usertype= "BROKER",
                        isinnumber= "INE271V08010",
                        rfqdealid= "61324116",
                        icdmordernumber= "202411050225640",
                        proposeapprove= "APPROVE",
                        maturity_call_putdate= "26-09-2029",
                        clientcode= "USERPARTICIPANT",
                        custodiancode= "",
                        bankifsc= "BKID0000032",
                        bankaccountnumber= "1234567891234567",
                        dptype= "CDSL",
                        dpid= "12044700",
                        dpclientid= "1204470012345678",
                        freeze= "YES",
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

        string apiresponse= await SendRFQQuotePropose(token, jsonPayload);

        dynamic responseObject = JsonConvert.DeserializeObject<dynamic>(apiresponse);
        var dealResponseList = (responseObject != null) ? responseObject.BROKER_RFQDEALAPPROVERESPONSE : null;

        if (dealResponseList != null && dealResponseList > 0)
        {
            dynamic responseItem = dealResponseList[0];
            int errorCode = responseItem.errorcode;

            if (errorCode == 0)
            {
                SaveRFQQuoteApproveRequest(requestBody);
                SaveRFQQuoteApproveResponse(responseItem);

                return "✅ Deal Accepted and saved successfully.";
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
                HttpResponseMessage response = await client.PostAsync("RFQDealApprove", content);
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
        string response = await RFQQuoteApprove();
        lblMessage.Text = response;
    }

    private void SaveRFQQuoteApproveRequest(dynamic request)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
        new SqlParameter("@Product", request.product),
        new SqlParameter("@UserType", request.usertype),
        new SqlParameter("@ISINNumber", request.isinnumber),
        new SqlParameter("@RFQDealId", request.rfqdealid),
        new SqlParameter("@ICDMOrderNumber", request.icdmordernumber),
        new SqlParameter("@ProposeApprove", request.proposeapprove),
        new SqlParameter("@MaturityCallPutDate", request.maturity_call_putdate),
        new SqlParameter("@ClientCode", request.clientcode),
        new SqlParameter("@CustodianCode", request.custodiancode),
        new SqlParameter("@BankIFSC", request.bankifsc),
        new SqlParameter("@BankAccountNumber", request.bankaccountnumber),
        new SqlParameter("@DPType", request.dptype),
        new SqlParameter("@DPID", request.dpid),
        new SqlParameter("@DPClientId", request.dpclientid),
        new SqlParameter("@Freeze", request.freeze),
        new SqlParameter("@Filler1", request.filler1),
        new SqlParameter("@Filler2", request.filler2),
        new SqlParameter("@Filler3", request.filler3),
        new SqlParameter("@Filler4", request.filler4),
        new SqlParameter("@Filler5", request.filler5)
        };

        SqlDBHelper.ExecuteNonQuery("SaveRFQQuoteApproveRequest", parameters);
    }
    private void SaveRFQQuoteApproveResponse(dynamic response)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
        new SqlParameter("@BrokerCode", response.brokercode),
        new SqlParameter("@BuyerClientCode", response.buyerclientcode),
        new SqlParameter("@Coupon", Convert.ToDecimal(response.coupon)),
        new SqlParameter("@DealTime", Convert.ToDateTime(response.dealtime)),
        new SqlParameter("@DirectBrokered", response.directbrokered),
        new SqlParameter("@Filler1", response.filler1),
        new SqlParameter("@Filler2", response.filler2),
        new SqlParameter("@Filler3", response.filler3),
        new SqlParameter("@Filler4", response.filler4),
        new SqlParameter("@Filler5", response.filler5),
        new SqlParameter("@Freeze", response.freeze),
        new SqlParameter("@ICDMOrderNumber", response.icdmordernumber),
        new SqlParameter("@ISINNumber", response.isinnumber),
        new SqlParameter("@MaturityCallPutDate", response.maturity_call_putdate),
        new SqlParameter("@Message", response.message),
        new SqlParameter("@ModAccruedInt", Convert.ToDecimal(response.modaccruedint)),
        new SqlParameter("@Price", Convert.ToDecimal(response.price)),
        new SqlParameter("@Product", response.product),
        new SqlParameter("@Quantity", Convert.ToInt32(response.quantity)),
        new SqlParameter("@RFQDealId", response.rfqdealid),
        new SqlParameter("@SellerClientCode", response.sellerclientcode),
        new SqlParameter("@SettlementDate", response.settlementdate),
        new SqlParameter("@TotalConsideration", Convert.ToDecimal(response.totalconsideration)),
        new SqlParameter("@Value", Convert.ToDecimal(response.value)),
        new SqlParameter("@Yield", Convert.ToDecimal(response.yield)),
        new SqlParameter("@YieldType", response.yieldtype)
        };

        SqlDBHelper.ExecuteNonQuery("SaveRFQQuoteApproveResponse", parameters);
    }

}