using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.UI;

public partial class Test : System.Web.UI.Page
{
    private static readonly HttpClient client = new HttpClient();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected async void SubmitButton_Click(object sender, EventArgs e)
    {
        string memberCode = MemberCodeTextBox.Text;
        string userId = UserIdTextBox.Text;
        string password = PasswordTextBox.Text;

        await CallApiAsync(memberCode, userId, password);
    }

    private async Task CallApiAsync(string memberCode, string userId, string password)
    {
        var url = "https://uat.bseindia.in/icdmdebt/ICDM_API/ICDMService.svc/GenerateToken";

        try
        {
            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Add("MEMBERCODE", memberCode);
            client.DefaultRequestHeaders.Add("USERID", userId);
            client.DefaultRequestHeaders.Add("PASSWORD", password);

            HttpResponseMessage response = await client.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                string responseBody = await response.Content.ReadAsStringAsync();
                ApiResponseLabel.Text = "API call successful! Response: " + responseBody;
            }
            else
            {
                ApiResponseLabel.Text = "API call failed! Status Code: " + response.StatusCode;
            }
        }
        catch (HttpRequestException ex)
        {
            ApiResponseLabel.Text = "An error occurred while sending the request: " + ex.Message;
            if (ex.InnerException != null)
            {
                ApiResponseLabel.Text += " Inner Exception: " + ex.InnerException.Message;
            }
        }
        catch (Exception ex)
        {
            ApiResponseLabel.Text = "An unexpected error occurred: " + ex.Message;
        }
    }
}