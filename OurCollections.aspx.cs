using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OurCollections : System.Web.UI.Page
{
    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["oId"] != null)
        {
            //string decryptedText = EncryptionHelper.Decrypt(Request.QueryString["oId"].ToString());
            //hfRequestQueryingstring.Value = decryptedText;
            //getData(Request.QueryString["oId"].ToString());
            hfRequestQueryingstring.Value = Request.QueryString["oId"].ToString();
        }
        if (!IsPostBack)
        {

            BindCategory();
           bindCreditRating();
            CategoryName();
            CategoryTags();
            if (GetUserLoggedIn() !=null)
            {
                hfUserId.Value = GetUserLoggedIn();
                pnlInvestment.Visible = true;
                pnlYield.Visible = true;
            }
            else
            {
                pnlYield.Visible=false;
                pnlInvestment.Visible=false;
            }
        }

    }
    private void getData(string Data)
    {

        DataTable dt = dl.get_Products(null, Data, null, null);
        hfData.Value = Data;
        rptData.DataSource = dt;
        rptData.DataBind();
        
    }
    
    private void load_DataM()
    {

        DataTable dt = new DAL().get_Products(null, null, null, null);
        rptData.DataSource = dt;
        rptData.DataBind();

    }
    
    private void getSearchData(string Dataa)
    {
        rptData.DataSource = dl.Get_ProductsDataSerachs(Dataa, null);
        rptData.DataBind();
       
    }
    
    private void BindData()
    {
        rptData.DataSource = dl.get_Products(null, null, null, null);
        rptData.DataBind();
    }
    private void bindCreditRating()
    {
        rptCreditRating.DataSource = dl.get_CreditRating(null, null);
        rptCreditRating.DataBind();
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
    protected void rptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label hfEOM = (e.Item.FindControl("hfEOM") as Label);
            Label txtLastIP = (e.Item.FindControl("txtLastIP") as Label);
            Label hfPayment = (e.Item.FindControl("hfPayment") as Label);
            Label lblredemption = (e.Item.FindControl("lblredemption") as Label);
            Label lblm = (e.Item.FindControl("lblm") as Label);
            Panel pnlYield = (e.Item.FindControl("pnlYield") as Panel);
            HiddenField lblIP = (e.Item.FindControl("lblIP") as HiddenField);
            Panel pnlYieldView = (e.Item.FindControl("pnlYieldView") as Panel);
            string ProductsId = (e.Item.FindControl("hfProducts") as HiddenField).Value;
            Repeater rptCredit = e.Item.FindControl("rptCredit") as Repeater;
            rptCredit.DataSource = dl.get_CreditRatingTags(null, ProductsId, null, null);
            rptCredit.DataBind();
            HiddenField hfProductName = (e.Item.FindControl("hfProductName") as HiddenField);
            HiddenField hfCategory = (e.Item.FindControl("hfCategory") as HiddenField);
            Repeater rptproductimg = e.Item.FindControl("rptproductimg") as Repeater;
            rptproductimg.DataSource = dl.get_HProductImage(null,hfProductName.Value,hfCategory.Value,null);
            rptproductimg.DataBind();
            DataTable dtk = dl.get_Products(ProductsId, null, null, null);
            if (dtk.Rows.Count > 0)
            {
                hfPayment.Text = dtk.Rows[0]["PaymentTypeHead"].ToString();
                lblredemption.Text = dtk.Rows[0]["MaturityType"].ToString();
            }

            DataTable dtn = dl.CheckLastDayOFMonth(ProductsId);

            hfEOM.Text = dtn.Rows[0]["EOM"].ToString();
            if(lblredemption.Text == "Bullet")
            {
                lblm.Text = "Bullet Redemption";
            }
            if(lblredemption.Text == "Staggered")
            {
                lblm.Text = "Partial Redemption";
            }
            if(lblredemption.Text == "Cumulative")
            {
                lblm.Text = "Cumulative Redemption";
                txtLastIP.Text = lblIP.Value;
            }
            if (GetUserLoggedIn() != null)
            {
                pnlYield.Visible = true;
                pnlYieldView.Visible = false;
            }
            else
            {
                pnlYield.Visible = false;
                pnlYieldView.Visible = true;
            }
            DateTime IPDat = DateTime.ParseExact(lblIP.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime Sattles = DateTime.Now;

            if (hfEOM.Text == "1")
            {
                if (hfPayment.Text == "Monthly")
                {
                    DataTable dtc = dl.get_LastDateMonthly(Sattles);
                    string Date = dtc.Rows[0]["LastMonth"].ToString();
                    hfQuar.Value = Date;
                    //DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    txtLastIP.Text = Date;

                }
                if (hfPayment.Text == "Yearly")
                {
                    DataTable dtc = dl.get_YearlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddYears(-1);
                    txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                }
                if (hfPayment.Text == "Quarterly")
                {
                    DataTable dtc = dl.get_QuarterlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtm = dl.get_LastDateQuarterly(Datee);
                    string Datees = dtm.Rows[0]["LastQuarterly"].ToString();

                    txtLastIP.Text = Datees;
                }
                if (hfPayment.Text == "Half Yearly")
                {
                    DataTable dtc = dl.get_HalfYearlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtm = dl.get_LastDateHalfYearly(Datee);
                    string Datees = dtm.Rows[0]["LastHalfYearly"].ToString();

                    txtLastIP.Text = Datees;
                }
            }
            else
            {
                if (hfPayment.Text == "Monthly")
                {
                    DataTable dtc = dl.get_MonthlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddMonths(-1);
                    txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");

                }
                if (hfPayment.Text == "Yearly")
                {
                    DataTable dtc = dl.get_YearlyDatess(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddYears(-1);
                    txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                }
                if (hfPayment.Text == "Quarterly")
                {
                    DataTable dtc = dl.get_QuarterlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddMonths(-3);
                    txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                }
                if (hfPayment.Text == "Half Yearly")
                {
                    DataTable dtc = dl.get_HalfYearlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddMonths(-6);
                    txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                }
            }

        }
    }
    private void CategoryName()
    {
        chkData.DataSource = dl.get_Category(null, null);
        chkData.DataTextField = "CategoryHead";
        chkData.DataValueField = "CategoryId";
        chkData.DataBind();
        //chkData.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void CategoryTags()
    {
        checkTags.DataSource = dl.get_Tags(null, null);
        checkTags.DataTextField = "TagsHead";
        checkTags.DataValueField = "TagsId";
        checkTags.DataBind();
        //chkData.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void BindCategory()
    {
        //rptCategory.DataSource = dl.get_Category(null, null);
        //rptCategory.DataBind();
    }
    protected void chkData_CheckedChanged(object sender, EventArgs e)
    {
        getcheckdata();
    }
    private void getcheckdata()
    {

        string ddlCategory = null;

        for (int i = 0; i < chkData.Items.Count; i++)
        {
            if (chkData.Items[i].Selected == true)
            {
                ddlCategory += chkData.Items[i].Value + ',';
                //if (chkData.Items[i].Selected)
                //{

                //    DataTable dt = dl.get_Products(null, ddlCategory, null, null);
                //    rptData.DataSource = dt;
                //    rptData.DataBind();


                //}
            }
        }
        hfCheckdata.Value = ddlCategory;
    }
    


    protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }

    protected void ddlInvest_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlInvest.SelectedValue == "")
        {
            hfInvest.Value = "";
            //rptData.DataSource = dl.get_ProductsPriceHigh(null, null, null, null, null);
            //rptData.DataBind();
        }
        if (ddlInvest.SelectedValue == "0")
        {
            hfInvest.Value = "0";
            //DataBindInvL();
        }
        if (ddlInvest.SelectedValue == "1")
        {
            //DataBindInvBt();
            hfInvest.Value = "1";
        }
        if (ddlInvest.SelectedValue == "2")
        {
           // DataBindInvU();
            hfInvest.Value = "2";
        }
    }
    private void DataBindInvL()
    {

        DataTable dt = dl.get_ProductsInvLowers(null);
        rptData.DataSource = dt;
        rptData.DataBind();
      
    }
    
    private void DataBindInvBt()
    {

        DataTable dt = dl.get_ProductsInvBts(null);
        rptData.DataSource = dt;
        rptData.DataBind();
       
    }
    
    private void DataBindInvU()
    {
        DataTable dt = dl.get_ProductsInvUppers(null);
        rptData.DataSource = dt;
        rptData.DataBind();
       
    }

 


    protected void ddlYield_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlYield.SelectedValue == "")
        {
            rptData.DataSource = dl.get_ProductsPriceHigh(null, null, null, null, null);
            rptData.DataBind();
        }
        if (ddlYield.SelectedValue == "8")
        {
            BindYieldless();
        }
        if (ddlYield.SelectedValue == "10")
        {
            BindYieldequal();
        }
        if (ddlYield.SelectedValue == "11")
        {
            BindYieldup();
        }
    }
    private void BindYieldless()
    {
        
        DataTable dt = dl.get_ProductsActives(null);
        rptData.DataSource = dt;
        rptData.DataBind();
       
    }
    
    private void BindYieldequal()
    {

        DataTable dt = dl.get_ProductsYieldBts(null);
        rptData.DataSource = dt;
        rptData.DataBind();
       
    }
    
    private void BindYieldup()
    {
        DataTable dt = dl.get_ProductsYieldUppers(null);
        rptData.DataSource = dt;
        rptData.DataBind();
      
    }
    
    protected void btnCredit_Click(object sender, EventArgs e)
    {
        Button lnkCredit = (Button)sender;
        //ViewState["IIId"]= lnkCredit.CommandArgument.ToString();
        hfCreditRating.Value = lnkCredit.CommandArgument;
        //GetCreditData();
    }
    private void GetCreditData()
    {

        if (hfData.Value != "")
        {
            DataTable dt = dl.get_CreditRatingTags(null, null, ViewState["IIId"].ToString(), null);
            rptData.DataSource = dt;
            rptData.DataBind();
           
        }
        else
        {
            DataTable dt = dl.get_CreditRatingTags(null, null, ViewState["IIId"].ToString(), null);
            rptData.DataSource = dt;
            rptData.DataBind();
           
        }

    }
    
    protected void chkData_SelectedIndexChanged(object sender, EventArgs e)
    {
        getcheckdata();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin?url=" + Server.UrlEncode(Request.Url.AbsoluteUri.Replace(".aspx","")));
    }


    protected void checkTags_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindTagsData();
    }

    private void BindTagsData()
    {

        string ddlCredit = null;

        for (int i = 0; i < checkTags.Items.Count; i++)
        {
            if (checkTags.Items[i].Selected == true)
            {
                ddlCredit += checkTags.Items[i].Value + ',';
               
                //if (ddlCredit != "")
                //{
                //    DataTable dt = dl.get_ProductsTagsFilter(null, null, ddlCredit, null, null);

                //    rptData.DataSource = dt;
                //    rptData.DataBind();

                //}
            }


        }
        hfTagsData.Value = ddlCredit;
    }


    protected void rptData_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}