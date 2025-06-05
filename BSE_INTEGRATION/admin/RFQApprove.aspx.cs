using System;
using System.Collections.Generic;
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
                        product= txtProduct.Text.Trim(),
                        usertype= txtUserType.Text.Trim(),
                        isinnumber= txtISIN.Text.Trim(),
                        rfqdealid= txtRFQDealID.Text.Trim(),
                        icdmordernumber= txtICDMOrderNumber.Text.Trim(),
                        proposeapprove= ddlProposeApproval.SelectedValue,
                        maturity_call_putdate= txtMaturityDate.Text.Trim(),
                        clientcode= txtClientCode.Text.Trim(),
                        custodiancode= txtCustodianCode.Text.Trim(),
                        bankifsc= txtBankIFSC.Text.Trim(),
                        bankaccountnumber= txtAccountNumber.Text.Trim(),
                        dptype= txtDPType.Text.Trim(),
                        dpid= ddlDPID.SelectedValue,
                        dpclientid= txtDPClientID.Text.Trim(),
                        freeze= ddlFreeze.Text.Trim(),
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

        return await SendRFQQuotePropose(token, jsonPayload);
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Example logic
        string product = txtProduct.Text.Trim();
        string clientCode = txtClientCode.Text.Trim();

        // Do processing...
        lblMessage.Text = "Form submitted successfully.";
    }

}