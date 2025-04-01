using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Shriram_InsertInward : System.Web.UI.Page
{
    private const string InsertInwardURL = "https://cameotest.stfc.me/VendorCKYCService/CKYCService.svc/InsertInward";

    protected async void Submit(object sender, EventArgs e)
    {
        try
        {
            var payload = new
            {
                Parameter1 = (txtParameter1.Text != null) ? txtParameter1.Text.Trim() : "",
                Parameter2 = (txtParameter2.Text != null) ? txtParameter2.Text.Trim() : "",
                Parameter3 = (txtParameter3.Text != null) ? txtParameter3.Text.Trim() : "",
                Parameter4 = (txtParameter4.Text != null) ? txtParameter4.Text.Trim() : "",
                Parameter5 = (txtParameter5.Text != null) ? txtParameter5.Text.Trim() : "",
                Parameter6 = (txtParameter6.Text != null) ? txtParameter6.Text.Trim() : "",
                Parameter7 = (txtParameter7.Text != null) ? txtParameter7.Text.Trim() : "",
                Parameter8 = (txtParameter8.Text != null) ? txtParameter8.Text.Trim() : "",
                Parameter9 = (txtParameter9.Text != null) ? txtParameter9.Text.Trim() : "",
                Parameter10 = (txtParameter10.Text != null) ? txtParameter10.Text.Trim() : "",
                Parameter11 = (txtParameter11.Text != null) ? txtParameter11.Text.Trim() : "",
                Parameter12 = (txtParameter12.Text != null) ? txtParameter12.Text.Trim() : "",
                Parameter13 = (txtParameter13.Text != null) ? txtParameter13.Text.Trim() : "",
                Parameter14 = (txtParameter14.Text != null) ? txtParameter14.Text.Trim() : "",
                Parameter15 = (txtParameter15.Text != null) ? txtParameter15.Text.Trim() : "",
                Parameter16 = (txtParameter16.Text != null) ? txtParameter16.Text.Trim() : "",
                Parameter17 = (txtParameter17.Text != null) ? txtParameter17.Text.Trim() : "",
                Parameter18 = (txtParameter18.Text != null) ? txtParameter18.Text.Trim() : "",
                Parameter19 = (txtParameter19.Text != null) ? txtParameter19.Text.Trim() : "",
                Parameter20 = (txtParameter20.Text != null) ? txtParameter20.Text.Trim() : "",
                Parameter21 = (txtParameter21.Text != null) ? txtParameter21.Text.Trim() : "",
                Parameter22 = (txtParameter22.Text != null) ? txtParameter22.Text.Trim() : "",
                Parameter23 = (txtParameter23.Text != null) ? txtParameter23.Text.Trim() : "",
                Parameter24 = (txtParameter24.Text != null) ? txtParameter24.Text.Trim() : "",
                Parameter25 = (txtParameter25.Text != null) ? txtParameter25.Text.Trim() : "",
                Parameter26 = (txtParameter26.Text != null) ? txtParameter26.Text.Trim() : "",
                Parameter27 = (txtParameter27.Text != null) ? txtParameter27.Text.Trim() : "",
                Parameter28 = (txtParameter28.Text != null) ? txtParameter28.Text.Trim() : "",
                Parameter29 = (txtParameter29.Text != null) ? txtParameter29.Text.Trim() : "",
                Parameter30 = (txtParameter30.Text != null) ? txtParameter30.Text.Trim() : "",
                Parameter31 = (txtParameter31.Text != null) ? txtParameter31.Text.Trim() : "",
                Parameter32 = (txtParameter32.Text != null) ? txtParameter32.Text.Trim() : "",
                Parameter33 = (txtParameter33.Text != null) ? txtParameter33.Text.Trim() : "",
                Parameter34 = (txtParameter34.Text != null) ? txtParameter34.Text.Trim() : "",
                Parameter35 = (txtParameter35.Text != null) ? txtParameter35.Text.Trim() : "",
                Parameter36 = (txtParameter36.Text != null) ? txtParameter36.Text.Trim() : "",
                Parameter37 = (txtParameter37.Text != null) ? txtParameter37.Text.Trim() : "",
                Parameter38 = (txtParameter38.Text != null) ? txtParameter38.Text.Trim() : "",
                Parameter39 = (txtParameter39.Text != null) ? txtParameter39.Text.Trim() : "",
                Parameter40 = (txtParameter40.Text != null) ? txtParameter40.Text.Trim() : "",
                Parameter41 = (txtParameter41.Text != null) ? txtParameter41.Text.Trim() : "",
                Parameter42 = (txtParameter42.Text != null) ? txtParameter42.Text.Trim() : "",
                Parameter43 = (txtParameter43.Text != null) ? txtParameter43.Text.Trim() : "",
                Parameter44 = (txtParameter44.Text != null) ? txtParameter44.Text.Trim() : "",
                Parameter45 = (txtParameter45.Text != null) ? txtParameter45.Text.Trim() : "",
                Parameter46 = (txtParameter46.Text != null) ? txtParameter46.Text.Trim() : "",
                Parameter47 = (txtParameter47.Text != null) ? txtParameter47.Text.Trim() : "",
                Parameter48 = (txtParameter48.Text != null) ? txtParameter48.Text.Trim() : "",
                Parameter49 = (txtParameter49.Text != null) ? txtParameter49.Text.Trim() : "",
                Parameter50 = (txtParameter50.Text != null) ? txtParameter50.Text.Trim() : "",
                Parameter51 = (txtParameter51.Text != null) ? txtParameter51.Text.Trim() : "",
                Parameter52 = (txtParameter52.Text != null) ? txtParameter52.Text.Trim() : "",
                Parameter53 = (txtParameter53.Text != null) ? txtParameter53.Text.Trim() : "",
                Parameter54 = (txtParameter54.Text != null) ? txtParameter54.Text.Trim() : "",
                Parameter55 = (txtParameter55.Text != null) ? txtParameter55.Text.Trim() : "",
                Parameter56 = (txtParameter56.Text != null) ? txtParameter56.Text.Trim() : "",
                Parameter57 = "",
                Parameter58 = ""

            };
            string JsonPayload = JsonConvert.SerializeObject(payload);
            string encrypteddata = ApiHelper.GCMEncryption(JsonPayload);
            //   string encrypteddata = "ill3jISuQwzXSXYk73fq8ZL33+13uPcnH/WvPZ/tz7Mxl6Oqw/JNxE9dEyvvK7VElo5QXyJvQpQ+M2Iazz67VmfKoNMZfhvfkaRGhTxixou1dU4QfzEUaa6JWqZdqE0HEjHvbbdU"; 

            string token = ApiHelper.GetToken();
            string response = await ApiHelper.CallAPIAsync(InsertInwardURL, token, encrypteddata, "InsertInward");
            // string  response= "oi53hJi+Q1TlDzBn/3//gumerY/DS5ad060bU3F7b7Ft5zk="; 

            string decrypt = ApiHelper.GCMDecryption(response);

            litResponse.Text = decrypt;
        }
        catch (Exception ex)
        {

            litResponse.Text = "<div class='response-label response-error'><h3>Error: " + ex.Message + "</h3></div>";


        }

    }
}
