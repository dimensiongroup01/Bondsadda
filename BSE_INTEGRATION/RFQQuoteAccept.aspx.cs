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
            string response = await RFQQuoteAccept(); // Assuming this handles saving or processing
            lblMessage.Text = response; // Show a success or failure message
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Submission failed: " + ex.Message;
        }
    }

    protected void btnShowPopup_Click(object sender, EventArgs e)
    {

    }

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (!IsPostBack)
    //    {
    //        btnCloseModal.Attributes["data-bs-dismiss"] = "modal";
    //    }
    //}

}
