using LanguageExt.Pipes;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pan_Kra_Verification : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(GetUserLoggedIn() == null)
        {
            if (GetUserLoggedIn() == null)
            {
                Response.Redirect("signin?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
            }
        }

    }
    private string GetUserLoggedIn()
    {

        HttpCookie cookieuser = Request.Cookies["DGBAM"];
        if (cookieuser == null)
        {
            return null;
        }
        else
        {
            return cookieuser.Value.ToString();
        }

    }
    protected async void SubmitButton_Click(object sender, EventArgs e)
    {
        if(txtPanNumber.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'PanNumber Required', type: 'error',});", true);
            return;
        }

        await CallApiAsync(txtPanNumber.Text);
    }

    private async Task CallApiAsync(string panNumber)
    {
        try
        {
            using (var client = new HttpClient())
            {
                var request = new HttpRequestMessage(HttpMethod.Post, "https://production.deepvue.tech/v1/authorize");
                var content = new MultipartFormDataContent
            {
                { new StringContent("live_dimension_financial_solutions"), "client_id" },
                { new StringContent("2033088554a7290c5a5288e7a096edf6c2aa421671881692d7a5f0d7db07868c"), "client_secret" }
            };
                request.Content = content;

                var response = await client.SendAsync(request);
                response.EnsureSuccessStatusCode();
                var responseContent = await response.Content.ReadAsStringAsync();

                var jsonResponse = JObject.Parse(responseContent);
                var accessToken = jsonResponse["access_token"].ToString();
                var tokenType = jsonResponse["token_type"].ToString();
                var expiry = jsonResponse["expiry"].ToString();

                await CallVerificationApiAsync(accessToken, panNumber, tokenType, expiry);

 // Display access token for testing
            }
        }
        catch (Exception ex)
        {
            ShowMessage("Error: {ex.Message}", "error");
        }
    }

    private async Task CallVerificationApiAsync(string accessToken, string panNumber, string tokenType, string expiry)
    {
        try
        {
            using (var client = new HttpClient())
            {
                var request = new HttpRequestMessage(HttpMethod.Get, "https://production.deepvue.tech/v1/verification/pan-kra-status?pan_number="+panNumber+"");
                request.Headers.Authorization = new AuthenticationHeaderValue(tokenType, accessToken);
                request.Headers.Add("x-api-key", "2033088554a7290c5a5288e7a096edf6c2aa421671881692d7a5f0d7db07868c");

                var responses = await client.SendAsync(request);

                if (!responses.IsSuccessStatusCode)
                {
                    var errorContent = await responses.Content.ReadAsStringAsync();
                    //throw new HttpRequestException("Response status code does not indicate success: {response.StatusCode}. Content: {errorContent}");
                }

                var responseContent = await responses.Content.ReadAsStringAsync();
                var jsonResponse = JObject.Parse(responseContent);
                var code = jsonResponse["code"].ToString();
                var details = ""; var message = "";
                if (code == "400" || code == "401" || code == "403")
                {
                     details = jsonResponse["details"].ToString();
                }
                else
                {
                     message = jsonResponse["message"].ToString();
                }

                SaveVerificationData(jsonResponse, accessToken, tokenType, expiry);

            }
        }
        catch (HttpRequestException ex)
        {
            ShowMessage("Request Error: {ex.Message}", "error");
        }
        catch (Exception ex)
        {
            ShowMessage("Error: {ex.Message}", "error");
        }
    }


    private void SaveVerificationData(JObject jsonResponse, string accessToken, string tokenType, string expiry)
    {
        var details = "";var transactionId = "";var timestamp = "";var subCode = "";var panKraStatus = "";var panKraStatusDescription = "";var kraStatus = ""; var panKraAgency = "";var message = "";var data = "";var pannumber = "";
        // Parse the rest of the JSON response and save to database
        var code = jsonResponse["code"].ToString();
        if(code == "400" || code == "401" || code == "403")
        {
             details = jsonResponse["details"].ToString();
        }else if(code == "422")
        {
             transactionId = jsonResponse["transaction_id"].ToString();
            timestamp = jsonResponse["timestamp"].ToString();
            subCode = jsonResponse["sub_code"].ToString();
            message = jsonResponse["message"].ToString();
        }
        else if(code == "500")
        {
            transactionId = jsonResponse["transaction_id"].ToString();
            timestamp = jsonResponse["timestamp"].ToString();
            subCode = jsonResponse["sub_code"].ToString();
            message = jsonResponse["message"].ToString();
        }else if(code == "503")
        {
            transactionId = jsonResponse["transaction_id"].ToString();
            timestamp = jsonResponse["timestamp"].ToString();
            message = jsonResponse["message"].ToString();
        }
        else if(code == "200")
        {
            timestamp = jsonResponse["timestamp"].ToString();
            transactionId = jsonResponse["transaction_id"].ToString();
            subCode = jsonResponse["sub_code"].ToString();
            message = jsonResponse["message"].ToString();
            data = jsonResponse["data"].ToString();
            if (data != "")
            {
                var datas = JObject.Parse(data);
                pannumber = datas["pan_number"].ToString();
                panKraStatus = datas["pan_kra_status"].ToString();
                panKraStatusDescription = datas["pan_kra_status_description"].ToString();
                kraStatus = datas["kra_status"].ToString();
                panKraAgency = datas["pan_kra_agency"].ToString();
            }
        }
        DataTable dt = dl.get_PANKRA(null, null, txtPanNumber.Text, null);
        if(dt.Rows.Count > 0)
        {
            string PANKRAId = dt.Rows[0]["PANKRAId"].ToString();
            dl.add_PANKRA(PANKRAId, accessToken, tokenType, expiry, code, transactionId, subCode, txtPanNumber.Text, panKraStatus, panKraStatusDescription, kraStatus, panKraAgency, details, timestamp, GetUserLoggedIn());
        }
        else
        {
            dl.add_PANKRA(null, accessToken, tokenType, expiry, code, transactionId, subCode, txtPanNumber.Text, panKraStatus, panKraStatusDescription, kraStatus, panKraAgency, details, timestamp, GetUserLoggedIn());
        }

        clear();
        if (code == "400" || code == "401" || code == "403")
        {
            lbl.Text = details;          
            lbl.ForeColor = System.Drawing.Color.Red;
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: '" + details + "', type: 'error',});", true);
            return;
        }
        else if (code == "200")
        {
            lbl.Text = message;
            if (data != "" || data != null)
            {
                lblPanNumber.Text = "PAN Number : <b>" + pannumber+"</b>";
                lblpankrastatus.Text = "PAN KRA Status : <b>" + panKraStatus + "</b>";
                lblkradescription.Text = "PAN KRA Description : <b>" + panKraStatusDescription + "</b>";
                lblkrastatus.Text = "KRA Status : <b>" + kraStatus + "</b>";
                lblkraagency.Text = "KRA Agency : <b>" + panKraAgency + "</b>";
            }
            lbl.ForeColor = System.Drawing.Color.Green;
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: '" + message + "', type: 'success',});", true);
            return;
        }
        else
        {
            lbl.Text = message;
            lbl.ForeColor = System.Drawing.Color.Red;
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: '" + message + "', type: 'error',});", true);
            return;
        }

    }

    private void ShowMessage(string message, string type)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({{icon: 'info', text: '"+message+"', type: '"+type+"'}});", true);
    }
    protected void txtPanNumber_TextChanged(object sender, EventArgs e)
    {

    }

    private void clear()
    {
        txtPanNumber.Text = string.Empty;
    }
}