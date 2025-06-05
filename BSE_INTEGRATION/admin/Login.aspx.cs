using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;

public partial class BSE_INTEGRATION_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected async void btnLogin_Click(object sender, EventArgs e)
    {
        string participantId = txtParticipantID.Text.Trim();
        string dealerId = txtDealerID.Text.Trim();
        string password = txtPassword.Text.Trim();
        if (!string.IsNullOrEmpty(dealerId))
        {
            Session["dealerId"] = dealerId;
        }
        else{
            lblMessage.Text = "unknown dealer";

        }
        if (string.IsNullOrEmpty(participantId) || string.IsNullOrEmpty(dealerId) || string.IsNullOrEmpty(password))
        {
            lblMessage.Text = "All fields are required.";
            return;
        }

        string token = await GetToken(participantId, dealerId, password);
        if (!string.IsNullOrEmpty(token))
        {
            Session["AuthToken"] = token;
            Response.Redirect("Dashboard.aspx");
            
        }
        else
        {
            lblMessage.Text = "Invalid login credentials.";
        }
    }

    private async Task<string> GetToken(string participantId, string dealerId, string password)
    {
        // Ensure TLS 1.2 is used
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

        using (HttpClient client = new HttpClient())
        {
            client.BaseAddress = new Uri("https://appdemo.bseindia.com/ICDMAPI/ICDMService.svc/");
            client.DefaultRequestHeaders.Add("PARTICIPANTID", participantId  );
            client.DefaultRequestHeaders.Add("DEALERID", dealerId);
            client.DefaultRequestHeaders.Add("PASSWORD", password);

            HttpResponseMessage response = await client.GetAsync("GenerateToken");

            if (response.IsSuccessStatusCode)
            {
                var result = await response.Content.ReadAsAsync<JObject>(); // Deserialize as JObject

                if (result != null && result["TokenResponseList"] != null)
                {
                    JArray tokenList = result["TokenResponseList"] as JArray;
                    if (tokenList != null && tokenList.Count > 0)
                    {
                        return tokenList[0]["token"].ToString();
                    }
                }
            }
        }
        return null;
    }


}
