using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerMaster : System.Web.UI.MasterPage
{
    DAL dl = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCategory();
            BindFAQ();

            if (GetUserLoggedIn() != null)
            {
                getUserDetails();
                RMDetails();
                pnlList.Visible = true;
                pnlList2.Visible = true;
                pnlSign.Visible = false;
                pnlSign2.Visible = false;
                pnlRM.Visible = true;

            }
            else
            {
                pnlList.Visible = false;
                pnlList2.Visible = false;
                pnlSign.Visible = true;
                pnlSign2.Visible = true;
                pnlRM.Visible = false;
            }

        }
    
    }

    private void BindFAQ()
    {
        rptFAQ.DataSource = dl.get_AskQuestionTop(null, null, null, true);
        rptFAQ.DataBind();
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
    private void getUserDetails()
    {
        DataTable dtme = dl.getCustomer(GetUserLoggedIn(), null);
        if (dtme.Rows.Count != 0)
        {
            divMemberCode.InnerHtml = "ID - " + dtme.Rows[0]["CustomerCode"].ToString();         
            dropdownMenuLinks.InnerHtml = "Hello! " + dtme.Rows[0]["CFullName"].ToString();
            divMemberCode2.InnerHtml = "ID - " + dtme.Rows[0]["CustomerCode"].ToString();
            dropdownMenuLinks2.InnerHtml = "Hello! " + dtme.Rows[0]["CFullName"].ToString();

            // divRole.InnerHtml = "Hi, " + dtme.Rows[0]["Role"].ToString();
            // hfUserRole.Value = dtme.Rows[0]["Role"].ToString();
            //getUserMenu();
        }


    }
    private void RMDetails()
    {
        DataTable dt = dl.get_RMAssign(null, null, GetUserLoggedIn(), null);
        rptdata.DataSource = dt;
        rptdata.DataBind();
        rptData2.DataSource = dt;
        rptData2.DataBind();

        if(dt.Rows.Count != 0)
        {
            //dropdownMenuLinked.InnerHtml = "RM";

        }
    }
    private void bindCategory()
    {
        DataTable dt = dl.get_Category(null, true);
        if(dt.Rows.Count > 0)
        {
            rptcategory.DataSource = dt;
            rptcategory.DataBind();

            rptCategory2.DataSource = dt;
            rptCategory2.DataBind();
        }

    }

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        //Create a new cookie, passing the name into the constructor
        HttpCookie cookie = new HttpCookie("DGBAM");
        //Set the cookies value
        cookie.Value = null;
        //Set the cookie to expire in 1 minute
        DateTime dtNow = DateTime.Now;
        TimeSpan tsMinute = new TimeSpan(-2, 0, 0, 0);
        cookie.Expires = dtNow + tsMinute;
        //Add the cookie
        Response.Cookies.Add(cookie);
      //  Response.Redirect("Index?url=" + Server.UrlEncode(Request.Url.AbsoluteUri.Replace(".aspx","")));
        Response.Redirect("Index");
    }

    protected void lnkSignin_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin?url=" + Server.UrlEncode(Request.Url.AbsoluteUri.Replace(".aspx", "")));
    }

    protected void lnkSignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signup?url=" + Server.UrlEncode(Request.Url.AbsoluteUri.Replace(".aspx", "")));
    }
    protected void lnkSerch_Click(object sender, EventArgs e)
    {
        string sfilters = "";
        if (txtResult.Text != "")
        {
            sfilters = txtResult.Text;
        }
        if (sfilters == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid search required..!!!', type: 'error',});", true);
            return;
        }
        else
        {
            DataTable dt = dl.GetProductDetails(sfilters);
            if (dt.Rows.Count > 0)
            {
                string productId = dt.Rows[0]["ProductsId"].ToString();
                Response.Redirect("CashFlow?oId=" + productId);
            }

        }
        //DataTable dt = dl.CheckInputData(txtResult.Text);
        //if (dt.Rows.Count > 0)
        //{
        //    string ProductsId = dt.Rows[0]["ProductsId"].ToString();
        //    hfInputData.Value = ProductsId;
        //}


    }

    protected void lnkcategory_Click(object sender, EventArgs e)
    {
        LinkButton lnkdetail = (LinkButton)sender;
        //string encryptedText = EncryptionHelper.Encrypt(lnkdetail.CommandArgument);

        Response.Redirect("OurCollections?oId=" + lnkdetail.CommandArgument);
    }
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        if (ValidateInputs())
        {
            double faceValue = double.Parse(txtFaceValue.Text);
            double couponRate = double.Parse(txtCouponRate.Text) / 100;
            int yearsToMaturity = int.Parse(txtYearsToMaturity.Text);

            double bondPrice = CalculateBondPrice(faceValue, couponRate, yearsToMaturity);

            lblResult.Text = "The price of the bond is ₹" + bondPrice.ToString("N2");
        }
    }

    private bool ValidateInputs()
    {
        if (string.IsNullOrWhiteSpace(txtFaceValue.Text) ||
            string.IsNullOrWhiteSpace(txtCouponRate.Text) ||
            string.IsNullOrWhiteSpace(txtYearsToMaturity.Text))
        {
            lblResult.Text = "All fields are mandatory.";
            return false;
        }

        double faceValue, couponRate;
        int yearsToMaturity;

        if (!double.TryParse(txtFaceValue.Text, out faceValue) ||
            !double.TryParse(txtCouponRate.Text, out couponRate) ||
            !int.TryParse(txtYearsToMaturity.Text, out yearsToMaturity))
        {
            lblResult.Text = "Please enter numeric values.";
            return false;
        }

        return true;
    }

    private double CalculateBondPrice(double faceValue, double couponRate, int yearsToMaturity)
    {
        double discountRate = 0.05; // Example discount rate
        double couponPayment = faceValue * couponRate;
        double discountedValue = 0;

        for (int i = 1; i <= yearsToMaturity; i++)
        {
            discountedValue += couponPayment / Math.Pow(1 + discountRate, i);
        }

        discountedValue += faceValue / Math.Pow(1 + discountRate, yearsToMaturity);

        return discountedValue;
    }
}
