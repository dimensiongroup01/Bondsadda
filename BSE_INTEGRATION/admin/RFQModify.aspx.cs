using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentFormat.OpenXml.Office2013.PowerPoint.Roaming;
using DocumentFormat.OpenXml.Spreadsheet;
using Newtonsoft.Json;

public partial class BSE_INTEGRATION_RFQModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthToken"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }


    private async Task<string> ModifyRFQOrder()
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

       


        var requestBody = new
        {
            RFQModifyCancel = new[]
            {
                new
                {
                    bondtype = ddlBondType.SelectedValue,
                    dealtype = ddlDealType.SelectedValue,
                    bidoffer = ddlBidOffer.SelectedValue,
                    isinnumber = txtISINNumber.Text.Trim(),
                    actionflag = "1",
                    rfqordernumber = txtRFQOrderNumber.Text.Trim(),
                    value = Convert.ToInt64(txtValue.Text),
                    minimumordervalue = Convert.ToInt64(txtMinimumValue.Text),
                    yield =  Math.Round(Convert.ToDecimal(txtYield.Text), 4),
                    price = Math.Round(Convert.ToDecimal(txtPrice.Text), 4),
                    gfd = chkGFD.Checked ? "1" : "0",
                    dealtimehours = ddlDealTimeHours.SelectedValue,
                    dealtimeminutes = ddlDealTimeMinutes.SelectedValue,
                    initiatorparticipantloginid = "DFSPL",
                    initiatordealerloginid = "DFSPLD",
                    initiatorcomment = "",
                    internalordernumber = DateTime.UtcNow.Ticks.ToString(),
                    rfqdealid = txtRfqDealId.Text.Trim(),
                    filler2="",
                    filler3="",
                    filler4="",
                    filler5 ="",
                }
            }
        };

       

        string jsonPayload = Newtonsoft.Json.JsonConvert.SerializeObject(requestBody);
         string checksum = SecurityHelper.GenerateChecksum(jsonPayload);

        return await SendRFQOrderRequest(token, jsonPayload);
    }


    private async Task<string> SendRFQOrderRequest(string token, string jsonPayload)
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
                HttpResponseMessage response = await client.PostAsync("RFQModifyCancel", content);
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
    protected void txtISINNumber_TextChanged(object sender, EventArgs e)
    {
        GetRFQSelectedData(txtISINNumber.Text);
    }

    private void GetRFQSelectedData(string isinNumber)
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
            ddlBondType.SelectedValue = row["bondtype"].ToString();
            ddlDealType.SelectedValue = row["dealtype"].ToString();
            ddlBidOffer.SelectedValue = row["bidoffer"].ToString();
            txtISINNumber.Text = row["ISINNumber"].ToString();
            txtRFQOrderNumber.Text = row["rfqordernumber"].ToString();
            txtValue.Text = row["value"].ToString();
            txtMinimumValue.Text = row["minimumordervalue"].ToString();
            txtYield.Text = row["yield"].ToString();
            txtPrice.Text = row["price"].ToString();
            chkGFD.Checked = row["gfd"].ToString() == "1";
            ddlDealTimeHours.SelectedValue = row["dealtimehours"].ToString();
            ddlDealTimeMinutes.SelectedValue = row["dealtimeminutes"].ToString();
            txtRfqDealId.Text = row["rfqdealid"].ToString();
            
        }
        else
        {
            ClearRFQForm();
        }
    }


    private void ClearRFQForm()
    {
        txtRFQOrderNumber.Text = "";
        ddlBondType.SelectedIndex = 0;
        ddlDealType.SelectedIndex = 0;
        ddlBidOffer.SelectedIndex = 0;
        txtValue.Text = "";
        txtMinimumValue.Text = "";
        txtYield.Text = "";
        txtPrice.Text = "";
        txtRfqDealId.Text = "";

        // Clear Validity Checkbox
        chkGFD.Checked = false;

        // Clear Deal Time
        ddlDealTimeHours.SelectedIndex = 0;
        ddlDealTimeMinutes.SelectedIndex = 0;
    }

    protected async void btnModifyRFQ_Click(object sender, EventArgs e)
    {
        string response = await ModifyRFQOrder();
        lblMessage.Text = response;

    }
}