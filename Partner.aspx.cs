using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Partner : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindCountry();
            vDPId.Visible = false;
            vClientId.Visible = false;
            vFull.Visible = false;
        }
    }
    private void BindCountry()
    {
        ddlCountry.DataSource = dl.get_Country(null);
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryId";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, new ListItem("Choose One", ""));
    }
    public bool IsValidMail(string emailaddress)
    {
        try
        {
            MailAddress m = new MailAddress(emailaddress);
            return true;
        }
        catch (FormatException)
        {
            return false;
        }
    }
    private void Clear()
    {
        txtFirstName.Text = string.Empty;
        txtMiddleName.Text = string.Empty;
        txtLastname.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtMobile.Text = string.Empty;
        txtAddress.Text = string.Empty;
        txtAppartment.Text = string.Empty;
        txtCity.Text = string.Empty;
        txtState.Text = string.Empty;
        ddlCountry.SelectedIndex = 0;
        txtPostalCode.Text = string.Empty;
        txtBankHolderName.Text = string.Empty;
        txtBankName.Text = string.Empty;
        txtBankBranch.Text = string.Empty;
        txtBankCity.Text = string.Empty;
        txtAccountNumber.Text = string.Empty;
        txtMICRCode.Text = string.Empty;
        txtBankIFSCCode.Text = string.Empty;
        txtDPName.Text = string.Empty;
        txtDPId.Text = string.Empty;
        txtCDSLId.Text = string.Empty;
        txtClientId.Text = string.Empty;
        txtDescription.Text = string.Empty;
    }
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        if (txtFirstName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'First Name Required', type: 'error',});", true);
            return;
        }
        if (txtLastname.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Last Name Required', type: 'error',});", true);
            return;
        }
        if (txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Email Required', type: 'error',});", true);
            return;
        }
        if (!IsValidMail(txtEmail.Text))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Email Must Be Added', type: 'error',});", true);
            return;
        }
        //if (txtMobile.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Mobile Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtAddress.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Address Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtCity.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'City Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtState.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'State  Required', type: 'error',});", true);
        //    return;
        //}
        //if (ddlCountry.SelectedIndex == 0)
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Select Country Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtPostalCode.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Postal Code Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtBankHolderName.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Bank Holder Name Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtBankName.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Bank Name Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtBankBranch.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Bank Branch Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtBankCity.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Bank City Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtAccountNumber.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Account Number Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtBankIFSCCode.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Bank IFSC Code Required', type: 'error',});", true);
        //    return;
        //}
        //if (txtDPName.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'DP Name Required', type: 'error',});", true);
        //    return;
        //}
        if (ddlDematetype.SelectedValue == "NSTL")
        {
            if (txtDPId.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'DP ID Required', type: 'error',});", true);
                return;
            }
            if (txtClientId.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'ClientId Required', type: 'error',});", true);
                return;
            }
        }
        if (ddlDematetype.SelectedValue == "CDSL")
        {
            if (txtCDSLId.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: '16 digit Id  Required', type: 'error',});", true);
                return;
            }
        }
        if (ViewState["Id"] == null)
        {
            string filePath = null;
            if (FileUpload1.HasFiles)
            {
                string folderPath = Server.MapPath("~/VImage/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                filePath = "~/VImage/" + new Random().Next(1, 100000).ToString() + Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath(filePath));
                hfAdharFilePath.Value = filePath;

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Adhar Image Required', type: 'error',});", true);
                return;
            }
            string FilePath = null;
            if (FileUpload2.HasFiles)
            {
                string folderPath = Server.MapPath("~/VImage/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                FilePath = "~/VImage/" + new Random().Next(1, 100000).ToString() + Path.GetFileName(FileUpload2.FileName);
                FileUpload2.SaveAs(Server.MapPath(FilePath));
                hfPANFilePath.Value = FilePath;

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'PAN Image Required', type: 'error',});", true);
                return;
            }
            int IId = dl.add_PartnerDetails(null, txtFirstName.Text, txtMiddleName.Text, txtLastname.Text, txtEmail.Text, txtMobile.Text, txtAddress.Text, txtAppartment.Text, txtCity.Text, txtState.Text, ddlCountry.SelectedValue, txtPostalCode.Text, null);
            if (IId != 0)
            {
                dl.add_PartnerBankDetails(null, IId.ToString(), txtBankHolderName.Text, txtBankName.Text, txtBankBranch.Text, txtBankCity.Text, txtAccountNumber.Text, txtMICRCode.Text, txtBankIFSCCode.Text, filePath, FilePath, null);
                dl.add_PartnerDemateDetails(null, IId.ToString(), txtDPName.Text, txtDPId.Text, txtClientId.Text, txtCDSLId.Text, ddlDematetype.SelectedValue, txtDescription.Text, null);
                Clear();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                return;
            }
        }
    }

    protected void ddlDematetype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlDematetype.SelectedValue == "NSDL")
        {
            vDPId.Visible = true;
            vClientId.Visible = true;
            vFull.Visible = false;
        }
        if(ddlDematetype.SelectedValue == "CDSL")
        {
            vDPId.Visible= false;
            vClientId.Visible= false;
            vFull.Visible= true;
        }
    }

}