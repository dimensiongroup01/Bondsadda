using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Fdmodule : System.Web.UI.Page
{

    SendMailSmS sms = new SendMailSmS();

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int maxSizeBytes = 4 * 1024 * 1024; // 4 MB

        if (fuPAN.HasFile && fuPAN.PostedFile.ContentLength > maxSizeBytes)
        {
            // Show error message
            Response.Write("<script>alert('❌ PAN file exceeds 4MB. Please upload a smaller file.');</script>");
            return;
        }

        if (fuAadhaar.HasFile && fuAadhaar.PostedFile.ContentLength > maxSizeBytes)
        { 
            // Show error message
            Response.Write("<script>alert('❌ Aadhaar file exceeds 4MB. Please upload a smaller file.');</script>");
            return;
        }

        // Save files
        string panPath = "~/Uploads/" + Guid.NewGuid() + "_" + fuPAN.FileName;
        string aadhaarPath = "~/Uploads/" + Guid.NewGuid() + "_" + fuAadhaar.FileName;

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

        // Send email
        bool emailSent = sms.SendFDRegistrationConfirmation(
            request.email,
            request.name,
            request.pan,
            request.aadhaar,
            request.fdtype,
            request.mobileNo
        );

        if (emailSent)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('FD Details saved successfully! Our RM will connect with you shortly.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('FD saved, but failed to send confirmation email. Please check your email or contact support.');", true);
        }
    }


    private void SaveFDCustomerRequest(dynamic request)
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
