using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SellBonds : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            CategoryName();
            PaymentType();
            CreditRating();
            RatingAgencies();
            if (GetUserLoggedIn() ==null)
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

    private void CategoryName()
    {
        ddlCategory.DataSource = dl.get_Category(null, null);
        ddlCategory.DataTextField = "CategoryHead";
        ddlCategory.DataValueField = "CategoryId";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("Choose one", "-1"));
    }

    private void PaymentType()
    {
        ddlPaymentType.DataSource = dl.get_PaymentType(null, null);
        ddlPaymentType.DataTextField = "PaymentTypeHead";
        ddlPaymentType.DataValueField = "PaymentTypeId";
        ddlPaymentType.DataBind();
        ddlPaymentType.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void CreditRating()
    {
        //ddlCreditRating.DataSource = dl.get_CreditRating(null, null);
        //ddlCreditRating.DataTextField = "CreditRating";
        //ddlCreditRating.DataValueField = "CreditRatingId";
        //ddlCreditRating.DataBind();
        //ddlCreditRating.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void RatingAgencies()
    {
        //ddlRatingAgencies.DataSource = dl.get_RatingAgenciesDetail(null, null);
        //ddlRatingAgencies.DataTextField = "RatingAgencies";
        //ddlRatingAgencies.DataValueField = "RatingAgenciesId";
        //ddlRatingAgencies.DataBind();
        //ddlRatingAgencies.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void Clear()
    {
        ddlCategory.SelectedIndex = 0;
        txtProductName.Text = string.Empty;
        txtISINNumber.Text = string.Empty;
        txtCouponRate.Text = string.Empty;
        //ddlCreditRating.SelectedIndex = 0;
        //ddlRatingAgencies.SelectedIndex = 0;
        txtPutCallDate.Text = string.Empty; 
        txtMaturityDate.Text = string.Empty;
        txtIPFrequency.Text = string.Empty;
        txtRate.Text = string.Empty;
        txtYieldSemi.Text = string.Empty;
        txtYield.Text = string.Empty;
        txtFacevalueBond.Text = string.Empty;
        //ddlPaymentType.SelectedIndex = 0;
        //ddlDataStatus.SelectedIndex = 0;
    }
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        if(ddlCategory.SelectedIndex ==0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Category Name Required', type: 'error',});", true);
            return;
        }
        if(txtProductName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Product Name Required', type: 'error',});", true);
            return;
        }
        if(txtISINNumber.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'ISIn Number Required', type: 'error',});", true);
            return;
        }
        if(txtCouponRate.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Coupon Rate Required', type: 'error',});", true);
            return;
        }
        if(txtYield.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Yield Required', type: 'error',});", true);
            return;
        }
        if (ddlPaymentType.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Payment Type Required', type: 'error',});", true);
            return;
        }
        if (txtIPFrequency.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'IPFrequency Required', type: 'error',});", true);
            return;
        }
        if(txtMaturityDate.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Maturity Date Required', type: 'error',});", true);
            return;
        }
        //if(ddlCreditRating.SelectedIndex==0)
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Credit Rating Required', type: 'error',});", true);
        //    return;
        //}
        //if(ddlRatingAgencies.SelectedIndex == 0)
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Rating Agencies Required', type: 'error',});", true);
        //    return;
        //}
        if(txtYieldSemi.Text =="")
        {
            txtYieldSemi.Text = "NA";
        }
        if(txtPutCallDate.Text =="")
        {
            txtPutCallDate.Text = "NA";
        }
        if (txtCallDate.Text == "")
        {
            txtCallDate.Text = "NA";
        }
        if(ddlGuaranteed.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Guaranteed By Required', type: 'error',});", true);
            return;
        }
        if (txtRate.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Rate Required', type: 'error',});", true);
            return;
        }
        if(txtFacevalueBond.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Face Value For Bond Required', type: 'error',});", true);
            return;
        }
        //if(ddlDataStatus.SelectedIndex ==0)
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'DataStatus Required', type: 'error',});", true);
        //    return;
        //}

        //string filePath = null;
        //if (FileUpload1.HasFiles)
        //{
        //    string folderPath = Server.MapPath("~/VImage/");
        //    if (!Directory.Exists(folderPath))
        //    {
        //        Directory.CreateDirectory(folderPath);
        //    }
        //    filePath = "~/VImage/" + new Random().Next(1, 100000).ToString() + Path.GetFileName(FileUpload1.FileName);
        //    FileUpload1.SaveAs(Server.MapPath(filePath));
        //    hfAdharFilePath.Value = filePath;

        //}
        //string FilePath = null;
        //if (FileUpload2.HasFiles)
        //{
        //    string folderPath = Server.MapPath("~/VImage/");
        //    if (!Directory.Exists(folderPath))
        //    {
        //        Directory.CreateDirectory(folderPath);
        //    }
        //    FilePath = "~/VImage/" + new Random().Next(1, 100000).ToString() + Path.GetFileName(FileUpload2.FileName);
        //    FileUpload2.SaveAs(Server.MapPath(FilePath));
        //    hfPANFilePath.Value = FilePath;

        //}
        if (ViewState["Id"]==null)
        {
            if(dl.add_SellBond(null,GetUserLoggedIn(),ddlCategory.SelectedValue ,txtISINNumber.Text,txtProductName.Text,txtCouponRate.Text,txtPutCallDate.Text,txtMaturityDate.Text,ddlPaymentType.SelectedValue,txtIPFrequency.Text,txtRate.Text,txtYieldSemi.Text,txtYield.Text,txtFacevalueBond.Text,null,null,null, null,null,txtCallDate.Text,ddlGuaranteed.SelectedValue ,null))
            {
                Clear();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                return;
            }
        }
    }

}