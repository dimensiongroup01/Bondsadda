using System;
using System.Collections.Generic;
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
        string panPath = "~/Uploads/" + Guid.NewGuid() + "_" + fuPAN.FileName;
        string aadhaarPath = "~/Uploads/" + Guid.NewGuid() + "_" + fuAadhaar.FileName;

        if (fuPAN.HasFile)
            fuPAN.SaveAs(Server.MapPath(panPath));

        if (fuAadhaar.HasFile)
            fuAadhaar.SaveAs(Server.MapPath(aadhaarPath));

        dynamic request = new
        {
            name = txtName.Text.Trim(),
            email = txtEmail.Text.Trim(),
            pan = txtPAN.Text.Trim(),
            aadhaar = txtAadhaar.Text.Trim(),
            fdtype = ddlFDType.SelectedValue,
            panfilepath = panPath,
            aadhaarfilepath = aadhaarPath
        };

        SaveFDCustomerRequest(request);

       
    
        bool emailSent = sms.SendFDRegistrationConfirmation(
            request.email,
            request.name,
            request.pan,
            request.aadhaar,
            request.fdtype
        
        );

        if (emailSent)
        {
            Response.Write("<script>alert('FD Details saved successfully! Our RM will connect with you shortly.');</script>");
        }
        else
        {
            Response.Write("<script>alert('FD saved, but failed to send confirmation email. Please check your email or contact support.');</script>");
        }
    }

    private void SaveFDCustomerRequest(dynamic request)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@Name", request.name),
            new SqlParameter("@Email", request.email),
            new SqlParameter("@PAN", request.pan),
            new SqlParameter("@Aadhaar", request.aadhaar),
            new SqlParameter("@FDType", request.fdtype),
            new SqlParameter("@PANFilePath", request.panfilepath),
            new SqlParameter("@AadhaarFilePath", request.aadhaarfilepath)
        };

        SqlDBHelper.ExecuteNonQuery("sp_InsertFDCustomerDetails", parameters);
    }
}
