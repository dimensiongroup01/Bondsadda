using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Fdmodule : System.Web.UI.Page
{
    SendMailSmS sms = new SendMailSmS();

    protected void Page_Load(object sender, EventArgs e)
    {
        string customerId = GetUserLoggedIn();

        if (string.IsNullOrEmpty(customerId))
        {
            Response.Redirect("signin?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
            return;
        }

        if (!IsPostBack)
        {
            LoadCustomerData(customerId);
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
            return cookieuser.Value.ToString(); // assuming this is CustomerId
        }
    }
    private void LoadCustomerData(string customerId)
    {
        string connStr = ConfigurationManager.ConnectionStrings["BondsAddaDB"].ConnectionString;

        string query = "SELECT CFullName,CMobile, CEmail FROM Customer WHERE CustomerId = @CustomerId AND IsDeleted = 0 AND IsActive = 1";

        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@CustomerId", customerId);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                txtName.Text = reader["CFullName"].ToString();
                txtMobile.Text = reader["CMobile"].ToString();
                txtEmail.Text = reader["CEmail"].ToString();
            }

            reader.Close();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int maxSizeBytes = 4 * 1024 * 1024; // 4 MB

        // File size validations
        if (fuPAN.HasFile && fuPAN.PostedFile.ContentLength > maxSizeBytes)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "sizeError", "Swal.fire('❌ PAN file too large', 'Please upload a file smaller than 4MB.', 'error');", true);
            return;
        }

        if (fuAadhaar.HasFile && fuAadhaar.PostedFile.ContentLength > maxSizeBytes)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "sizeError2", "Swal.fire('❌ Aadhaar file too large', 'Please upload a file smaller than 4MB.', 'error');", true);
            return;
        }

        // Save uploaded files
        string panPath = "~/Uploads/" + Guid.NewGuid() + "_" + Path.GetFileName(fuPAN.FileName);
        string aadhaarPath = "~/Uploads/" + Guid.NewGuid() + "_" + Path.GetFileName(fuAadhaar.FileName);

        if (fuPAN.HasFile)
            fuPAN.SaveAs(Server.MapPath(panPath));

        if (fuAadhaar.HasFile)
            fuAadhaar.SaveAs(Server.MapPath(aadhaarPath));

        // Create request object
        dynamic request = new
        {
            name = txtName.Text.Trim(),
            email = txtEmail.Text.Trim(),
            mobileNo = txtMobile.Text.Trim(),
            pan = txtPAN.Text.Trim(),
            aadhaar = txtAadhaar.Text.Trim(),
            fdtype = ddlFDType.SelectedValue,
            panfilepath = panPath,
            aadhaarfilepath = aadhaarPath
        };

        // Save and get inserted data
        var savedCustomer = SaveFDCustomerRequest(request);

        if (savedCustomer != null)
        {
            // Send confirmation email
            bool emailSent = sms.SendFDRegistrationConfirmation(
                savedCustomer.Email.ToUpper(),
                savedCustomer.Name.ToUpper(),
                savedCustomer.PAN.ToUpper(),
                savedCustomer.Aadhaar.ToUpper(),
                savedCustomer.FDType.ToUpper(),
                savedCustomer.MobileNo
            );

            string jsMessage = string.Format(

   
    "Swal.fire({{ " +
    "title: '✅ FD Details Saved!', " +
    "html: '<strong>Name:</strong> {0}<br/>' + " +
          "'<strong>Email:</strong> {1}<br/>' + " +
          "'<strong>Mobile:</strong> {2}<br/>' + " +
          "'<strong>PAN:</strong> {3}<br/>' + " +
          "'<strong>Aadhaar:</strong> {4}<br/>' + " +
          "'<strong>FD Type:</strong> {5}<br/>' + " +
          "'<strong>Created On:</strong> {6}', " +
    "icon: 'success', " +
    "footer: '<button class=\"btn btn-primary\" onclick=\"downloadFDDetails()\">⬇ Download Receipt</button>'" +
    "}});",
    savedCustomer.Name.ToUpper(),
    savedCustomer.Email.ToUpper(),
    savedCustomer.MobileNo,
    savedCustomer.PAN.ToUpper(),
    savedCustomer.Aadhaar.ToUpper(),
    savedCustomer.FDType.ToUpper(),
    savedCustomer.CreatedDate.ToString("dd-MMM-yyyy hh:mm tt")
);




            ScriptManager.RegisterStartupScript(this, GetType(), "popup", jsMessage, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "fail", "Swal.fire('❌ Failed to Save!', 'Something went wrong while saving the FD details.', 'error');", true);
        }
    }

    private dynamic SaveFDCustomerRequest(dynamic request)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@Name", request.name),
            new SqlParameter("@Email", request.email),
            new SqlParameter("@MobileNo", request.mobileNo),
            new SqlParameter("@PAN", request.pan),
            new SqlParameter("@Aadhaar", request.aadhaar),
            new SqlParameter("@FDType", request.fdtype),
            new SqlParameter("@PANFilePath", request.panfilepath),
            new SqlParameter("@AadhaarFilePath", request.aadhaarfilepath)
        };

        DataTable result = SqlDBHelper.ExecuteReader("user_BondsAdda.sp_InsertFDCustomerDetails", parameters);

        if (result.Rows.Count > 0)
        {
            DataRow row = result.Rows[0];
            return new
            {
                Id = Convert.ToInt32(row["Id"]),
                Name = row["Name"].ToString(),
                Email = row["Email"].ToString(),
                MobileNo = row["MobileNo"].ToString(),
                PAN = row["PAN"].ToString(),
                Aadhaar = row["Aadhaar"].ToString(),
                FDType = row["FDType"].ToString(),
                PANFilePath = row["PANFilePath"].ToString(),
                AadhaarFilePath = row["AadhaarFilePath"].ToString(),
                CreatedDate = Convert.ToDateTime(row["CreatedDate"])
            };
        }

        return null;
    }
}
