using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Net.Mail;
using System.Web.Http.Cors;
using System.Web.Script.Services;
using System.Data.SqlClient;
using System.Configuration;
using DocumentFormat.OpenXml.Wordprocessing;
using DocumentFormat.OpenXml.Drawing;
using System.Globalization;
using System.Text.Json.Nodes;
using Newtonsoft.Json;

/// <summary>
/// Summary description for TMWebService
/// </summary>
[WebService(Namespace = "https://www.bondsadda.com/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class TMWebService : System.Web.Services.WebService
{
    DAL dl = new DAL();
    public TMWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [EnableCors(origins: "https://www.bondsadda.com", headers: "*", methods: "*")]
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<string> GetProducts(string prefix)
    {

        DAL dl = new DAL();
        DataTable dt = dl.getSearchedProducts(prefix);
        List<string> pl = new List<string>();

        foreach (DataRow dr in dt.Rows)
        {
            pl.Add(string.Format("{0}${1}", dr["searchproduct"].ToString(), "CashFlow.aspx?oId=" + dr["ProductsId"].ToString()));

        }
        return pl;
    }
    [WebMethod]
    public string GetBondsData(string pageIndex,string UserId,string querystring,string creditrating, string tagsdata,string categorytype,string investvalue)
    {
        PaginationData pd= new PaginationData();
        string Querystring = null, CreditRating = null, pagecount = null, Price = null;
        if(querystring != "")
        {
            Querystring = querystring;
        }
        if(creditrating !="")
        {
            CreditRating = creditrating;
        }
        StringBuilder sb = new StringBuilder();
        DataTable dt = new DataTable();
        if(Querystring != null)
        {

            dt = dl.get_ProductsDate(null, Querystring, null, "3", pageIndex, null);
            pagecount = dt.Rows[0]["PageCount"].ToString();
            Price = dt.Rows[0]["Price"].ToString();
        }
        if(Querystring == null && CreditRating == null && tagsdata =="" && categorytype=="")
        {
            dt = dl.get_ProductsDate(null, null, null, "3", pageIndex, null);
            pagecount = dt.Rows[0]["PageCount"].ToString();
            Price = dt.Rows[0]["Price"].ToString();
        }

        if(CreditRating !=null)
        {
            dt = dl.Get_CreditRatingTagsDataNew(null, null, CreditRating, null ,pageIndex,"3",null);
            pagecount = dt.Rows[0]["PageCount"].ToString();
            Price = dt.Rows[0]["Price"].ToString();
        }
        if(tagsdata != "")
        {
            dt = dl.get_ProductsTagsFilterNew(null, null, tagsdata,null, null, pageIndex, "3");
            pagecount = dt.Rows[0]["PageCount"].ToString();
            Price = dt.Rows[0]["Price"].ToString();
        }
        if(categorytype != "")
        {
            dt = dl.get_ProductsDate(null, categorytype, null, "3", pageIndex, null);
            pagecount = dt.Rows[0]["PageCount"].ToString();
            Price = dt.Rows[0]["Price"].ToString();
        }
        if(investvalue == "0")
        {
            dt = dl.get_ProductsInvLowerNew(null, pageIndex, "3");
            pagecount = dt.Rows[0]["PageCount"].ToString();
            Price = dt.Rows[0]["Price"].ToString();
        }
        if (investvalue == "0")
        {
            dt = dl.get_ProductsInvBtNew(null, pageIndex, "3");
            pagecount = dt.Rows[0]["PageCount"].ToString();
            Price = dt.Rows[0]["Price"].ToString();
        }
        if (investvalue == "0")
        {
            dt = dl.get_ProductsInvUpperNew(null, pageIndex, "3");
            pagecount = dt.Rows[0]["PageCount"].ToString();
            Price = dt.Rows[0]["Price"].ToString();
        }



        foreach (DataRow dr in dt.Rows)
        {
        sb.Append(@"<div class='col-lg-4 col-md-6 col-12 border-0'><div class='box'><br>");
        sb.Append(@"<div class='box0'><div class='row'><div class='col-7'><h3 class='h6 font-weight-normal'><span class='kgs' style='text-transform:capitalize;' title='" + dr["Security"].ToString() +"'>" + dr["Security"].ToString() + "<input type='hidden' name='ctl00$ContentPlaceHolder1$rptData$ctl00$lblIP' id='ContentPlaceHolder1_rptData_lblIP_0' value='" + dr["IPDate"].ToString() +"'></span></h3></div>");
            DataTable dtc = dl.get_HProductImage(null, dr["ProductName"].ToString(), dr["CategoryId"].ToString(), null);
            foreach(DataRow drn in dtc.Rows)
            {
                sb.Append(@"<div class='col-5'><img src='" + drn["HProductImagePath"].ToString().Replace("~", "") + "' class='border col-12 p-0' height='60' alt=''></div>");
            }
            sb.Append(@"</div></div><div class='box1'><div class='row'><div class='col-7'><small>Face Value</small><p class='h6  font_2 '>₹" + dr["FacevalueForBond"].ToString() +"</p></div><div class='col-5 text-right '><input type='hidden' name='ctl00$ContentPlaceHolder1$rptData$ctl00$hfProducts' id='ContentPlaceHolder1_rptData_hfProducts_0' value='" + dr["ProductsId"].ToString() +"'>");
            DataTable dta = dl.get_CreditRatingTags(null, dr["ProductsId"].ToString(), null, null);
            sb.Append(@"<div class='rating-icon'>");
            int Rc = 0;
            foreach (DataRow dra in dta.Rows)
            {
                if(Rc > 0)
                {
                    sb.Append(@"&nbsp;");
                }
                Rc++;
                sb.Append(@"" + dra["CreditRating"].ToString());
            }
            sb.Append(@"</div></div></div><div class='row'><div class='col-7'><small>Coupon</small><p class='h6  font_2'>" + dr["CouponRate"].ToString() + "%</p></div>");
            //if(UserId == "")
            //{
            //    sb.Append(@"<div class='col-5 text-right'><div id='ContentPlaceHolder1_rptData_pnlYieldView_0'><small>Yield</small><p class='h6  font_2'><a href='signin'>Login to view</a></p></div></div></div><div class='row'>");
            //}
            //else
            //{
            //    sb.Append(@"<div class='col-5 text-right'><div id='ContentPlaceHolder1_rptData_pnlYieldView_0'><small>Yield</small><p class='h6  font_2'>" + dr["YTM"].ToString() +"%</p></div></div></div><div class='row'>");
            //}

            if (dr["EOM"].ToString() == "1")
            {
                if (dr["PaymentTypeHead"].ToString() == "Monthly")
                {                   
                    DataTable dtn = dl.get_LastDateMonthly(DateTime.Today);
                    string Date = dtn.Rows[0]["LastMonth"].ToString();
                    sb.Append(@"<div class='col-7'><small>Last Interest Payment Date</small><p class='h6  font_2'><span class='abs'><span id='ContentPlaceHolder1_rptData_txtLastIP_0'>"+Date+"</span></span></p></div>");
                }
                if (dr["PaymentTypeHead"].ToString() == "Yearly")
                {
                    DateTime IPDat = DateTime.ParseExact(dr["IPDate"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtn = dl.get_YearlyDate(DateTime.Today, IPDat);
                    string Date = dtn.Rows[0]["mth_start"].ToString();
                    sb.Append(@"<div class='col-7'><small>Last Interest Payment Date</small><p class='h6  font_2'><span class='abs'><span id='ContentPlaceHolder1_rptData_txtLastIP_0'>" + Date + "</span></span></p></div>");
                }
                if (dr["PaymentTypeHead"].ToString() == "Quarterly")
                {
                    DateTime IPDat = DateTime.ParseExact(dr["IPDate"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtn = dl.get_QuarterlyDate(DateTime.Today,IPDat);
                    string Datee = dtn.Rows[0]["mth_start"].ToString();
                    DateTime Date = DateTime.ParseExact(Datee, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtm = dl.get_LastDateQuarterly(Date);
                    string dat = dtm.Rows[0]["LastQuarterly"].ToString();
                    sb.Append(@"<div class='col-7'><small>Last Interest Payment Date</small><p class='h6  font_2'><span class='abs'><span id='ContentPlaceHolder1_rptData_txtLastIP_0'>" + dat + "</span></span></p></div>");
                }
                if (dr["PaymentTypeHead"].ToString() == "Half Yearly")
                {
                    DateTime IPDat = DateTime.ParseExact(dr["IPDate"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtn = dl.get_HalfYearlyDate(DateTime.Today,IPDat);
                    string Datee = dtn.Rows[0]["mth_start"].ToString();
                    DateTime Date = DateTime.ParseExact(Datee, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtm = dl.get_LastDateHalfYearly(Date);
                    string datee = dtm.Rows[0]["LastHalfYearly"].ToString();
                    sb.Append(@"<div class='col-7'><small>Last Interest Payment Date</small><p class='h6  font_2'><span class='abs'><span id='ContentPlaceHolder1_rptData_txtLastIP_0'>" + datee + "</span></span></p></div>");
                }
            }
            else
            {
                if (dr["PaymentTypeHead"].ToString() == "Monthly")
                {
                    DateTime IPDat = DateTime.ParseExact(dr["IPDate"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtn = dl.get_MonthlyDate(DateTime.Today, IPDat);
                    string Date = dtn.Rows[0]["mth_start"].ToString();                    
                    DateTime Datee = DateTime.ParseExact(Date, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddMonths(-1);
                    sb.Append(@"<div class='col-7'><small>Last Interest Payment Date</small><p class='h6  font_2'><span class='abs'><span id='ContentPlaceHolder1_rptData_txtLastIP_0'>" + IP.ToString("dd/MM/yyyy").Replace("-", "/") + "</span></span></p></div>");

                }
                if (dr["PaymentTypeHead"].ToString() == "Yearly")
                {
                    DateTime IPDat = DateTime.ParseExact(dr["IPDate"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtn = dl.get_YearlyDatess(DateTime.Today, IPDat);
                    string Date = dtn.Rows[0]["mth_start"].ToString();                   
                    DateTime Datee = DateTime.ParseExact(Date, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddYears(-1);
                    sb.Append(@"<div class='col-7'><small>Last Interest Payment Date</small><p class='h6  font_2'><span class='abs'><span id='ContentPlaceHolder1_rptData_txtLastIP_0'>" + IP.ToString("dd/MM/yyyy").Replace("-", "/") + "</span></span></p></div>");

                }
                if (dr["PaymentTypeHead"].ToString() == "Quarterly")
                {
                    DateTime IPDat = DateTime.ParseExact(dr["IPDate"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtn = dl.get_QuarterlyDate(DateTime.Today, IPDat);
                    string Date = dtn.Rows[0]["mth_start"].ToString();
                    DateTime Datee = DateTime.ParseExact(Date, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddMonths(-3);
                    sb.Append(@"<div class='col-7'><small>Last Interest Payment Date</small><p class='h6  font_2'><span class='abs'><span id='ContentPlaceHolder1_rptData_txtLastIP_0'>" + IP.ToString("dd/MM/yyyy").Replace("-", "/") + "</span></span></p></div>");

                }
                if (dr["PaymentTypeHead"].ToString() == "Half Yearly")
                {
                    DateTime IPDat = DateTime.ParseExact(dr["IPDate"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtn = dl.get_HalfYearlyDate(DateTime.Today, IPDat);
                    string Date = dtn.Rows[0]["mth_start"].ToString();
                    DateTime Datee = DateTime.ParseExact(Date, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddMonths(-6);
                    sb.Append(@"<div class='col-7'><small>Last Interest Payment Date</small><p class='h6  font_2'><span class='abs'><span id='ContentPlaceHolder1_rptData_txtLastIP_0'>" + IP.ToString("dd/MM/yyyy").Replace("-", "/") + "</span></span></p></div>");
                }
            }

            sb.Append(@"<div class='col-5 text-right'><small>Maturity Date</small><p class='h6  font_2'>" + dr["MaturityDate"].ToString() +"</p></div></div>");
            sb.Append(@"<div class='row'><div class='col-12'><small>Type of Bond</small><p class='h6  font_2'><span class='mmm' title='" + dr["CategoryHead"].ToString() + "'>" + dr["CategoryHead"].ToString() + "</span></p></div></div>");
            if (dr["MaturityType"].ToString() == "Bullet")
            {
                sb.Append(@"<div class='row'><div class='col-12'><small>Redemption Type</small><p class='h6  font_2'><span id='ContentPlaceHolder1_rptData_lblm_0'>Bullet Redemption</span></p></div></div>");
               
            }
            if (dr["MaturityType"].ToString() == "Staggered")
            {
                sb.Append(@"<div class='row'><div class='col-12'><small>Redemption Type</small><p class='h6  font_2'><span id='ContentPlaceHolder1_rptData_lblm_0'>Partial Redemption</span></p></div></div>");
            }
            if (dr["MaturityType"].ToString() == "Cumulative")
            {
                sb.Append(@"<div class='row'><div class='col-12'><small>Redemption Type</small><p class='h6  font_2'><span id='ContentPlaceHolder1_rptData_lblm_0'>Cumulative Redemption</span></p></div></div>");  
            }
            
            sb.Append(@"<div class='button'><a href='/CashFlow?oId=" + dr["ProductsId"].ToString() + "' class='font_2 text-white'>View Details</a></div></div></div></div>");

        }
        pd.PageCount = pagecount;
        pd.DataString = sb.ToString();
        return JsonConvert.SerializeObject(pd);

    }

    private double CalculateXIRR(double[] cashFlows, DateTime[] dates, double guess = 0.1)
    {
        const double tol = 0.0001; // tolerance for accuracy
        double x0 = guess;
        double x1;

        int maxIterations = 1000; // maximum number of iterations
        int i = 0;

        do
        {
            double fValue = 0.0;
            double fDerivative = 0.0;

            for (int j = 0; j < cashFlows.Length; j++)
            {
                double d1 = (dates[j] - dates[0]).TotalDays / 365;
                fValue += cashFlows[j] / Math.Pow(1.0 + x0, d1);
                fDerivative -= d1 * cashFlows[j] / Math.Pow(1.0 + x0, d1 + 1.0);
            }

            x1 = x0 - fValue / fDerivative;

            if (Math.Abs(x1 - x0) < tol)
                return x1;

            x0 = x1;
            i++;

        } while (i < maxIterations);

        throw new InvalidOperationException("XIRR calculation did not converge.");
    }





}
