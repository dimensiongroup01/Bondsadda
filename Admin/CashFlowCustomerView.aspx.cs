using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CashFlowCustomerView : System.Web.UI.Page
{

    DAL dl = new DAL();
    SendMailSmS sms = new SendMailSmS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string url = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            DataTable dtsub = dl.getPanelMenuSubByurl(url);
            ViewState["SubmemnuId"] = dtsub.Rows[0]["SubMenuId"].ToString();
            ViewState["MainMenuId"] = dtsub.Rows[0]["MainMenuId"].ToString();
            getPermision();
            UserDetails();
            BindData();
            CustomerName();
            ProductName();
        }
    }
    private void BindData()
    {
        if(hfRM.Value== "True")
        {
            grdData.DataSource = dl.get_CashFlowViewRM(null, null, null,GetUserLoggedIn(), null);
            grdData.DataBind();
        }
        if(hfRM.Value == "False")
        {
            grdData.DataSource = dl.get_CashFlowView(null, null, null, null);
            grdData.DataBind();
        }

    }
    
    private void CustomerName()
    {
        ddlCustomerName.DataSource = dl.getCustomer(null, null);
        ddlCustomerName.DataTextField = "CFullName";
        ddlCustomerName.DataValueField = "CustomerId";
        ddlCustomerName.DataBind();
        ddlCustomerName.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void ProductName()
    {
        ddlProductName.DataSource = dl.get_Products(null, null, null,null);
        ddlProductName.DataTextField = "Security";
        ddlProductName.DataValueField = "ProductsId";
        ddlProductName.DataBind();
        ddlProductName.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void UserDetails()
    {
        DataTable dt = dl.getPanelUsers(GetUserLoggedIn(), null);
        if (dt.Rows.Count > 0)
        {
            string RM = dt.Rows[0]["RM"].ToString();
            hfRM.Value = RM;
        }
    }
    protected void lnkAdd_Click(object sender, EventArgs e)
    {
        if(hfRM.Value == "True")
        {
            string ProductName = null, CustomerName = null;
            if (ddlCustomerName.SelectedValue != "-1")
            {
                CustomerName = ddlCustomerName.SelectedValue;
            }
            if (ddlProductName.SelectedValue != "-1")
            {
                ProductName = ddlProductName.SelectedValue;
            }
            grdData.DataSource = dl.get_CashFlowViewRM(null, CustomerName, ProductName,GetUserLoggedIn(), null);
            grdData.DataBind();
        }
        if(hfRM.Value == "False")
        {
            string ProductName = null, CustomerName = null;
            if (ddlCustomerName.SelectedValue != "-1")
            {
                CustomerName = ddlCustomerName.SelectedValue;
            }
            if (ddlProductName.SelectedValue != "-1")
            {
                ProductName = ddlProductName.SelectedValue;
            }
            grdData.DataSource = dl.get_CashFlowView(null, CustomerName, ProductName, null);
            grdData.DataBind();
        }


    }
    private string GetUserLoggedIn()
    {

        HttpCookie cookieuser = Request.Cookies["DGBA"];
        if (cookieuser == null)
        {
            return null;
        }
        else
        {
            return cookieuser.Value.ToString();
        }

    }
    private void PaymentType()
    {
        if (hfPaymentType.Value == "Monthly")
        {
            float Year = float.Parse(hfTotalYear.Value);
            float Month = float.Parse(hfTotalMonth.Value);
            float Day = float.Parse(hfTotalDay.Value);


            var totalMonths = ((Year * 12) + Month);
            hfMonth.Value = totalMonths.ToString();
            hfRemainingDay.Value = Day.ToString();
        }
        if (hfPaymentType.Value == "Yearly")
        {
            float Year = float.Parse(hfTotalYear.Value);
            float Month = float.Parse(hfTotalMonth.Value);
            float Day = float.Parse(hfTotalDay.Value);
            var totalYear = Year;
            hfYearly.Value = totalYear.ToString();
            var totalMonths = Month;
            var TotalDay = Day;
            hfMonth.Value = totalMonths.ToString();
            hfRemainingDay.Value = TotalDay.ToString();

        }
        if (hfPaymentType.Value == "Quarterly")
        {
            float Year = float.Parse(hfTotalYear.Value);
            float Month = float.Parse(hfTotalMonth.Value);
            float Day = float.Parse(hfTotalDay.Value);
            var totalQuarter = (Year * 4);
            var totalmonth = (Month / 3);
            var totalQuarterly = Math.Truncate(totalQuarter + totalmonth);
            var month = (Month - (totalmonth * 3));
            var TotalDay = Day;


            hfQuerterly.Value = totalQuarterly.ToString();
            hfMonth.Value = month.ToString();
            hfRemainingDay.Value = TotalDay.ToString();

        }
        if (hfPaymentType.Value == "Half Yearly")
        {
            float Year = float.Parse(hfTotalYear.Value);
            float Month = float.Parse(hfTotalMonth.Value);
            float Day = float.Parse(hfTotalDay.Value);
            var totalHalfYearl = (Year * 2);
            var mon = (Month / 6);
            var totalHalfYearly = Math.Truncate(totalHalfYearl + mon);
            var month = (Month - (mon * 2));
            var TotalDay = Day;
            hfHalfYearly.Value = totalHalfYearly.ToString();
            hfMonth.Value = month.ToString();
            hfRemainingDay.Value = TotalDay.ToString();

        }
    }
    private void SattlementData()
    {
        string Sattle = hfSattlementDate.Value;
        string LastIP = hfLastIPDate.Value;
        DateTime Sattles = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        DateTime LastIPDate = DateTime.ParseExact(hfLastIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        DateTime IPDat = Convert.ToDateTime(hfIPDa.Value);
        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        if(hfPaymentType.Value == "One Time Interest")
        {
            TimeSpan objFirstInt = Maturity - Sattles;
            float FirstDay = (float)objFirstInt.TotalDays;
            hfTotalDay.Value = FirstDay.ToString();

        }
        if (hfPaymentType.Value == "Monthly")
        {

            if (hfEOM.Value == "1")
            {
                DataTable dt = dl.get_LastMonthlyDate(Sattles, IPDat);
                string Date = dt.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;
                DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
                TimeSpan objFirstInt = IPDates - Sattles;
                float FirstDay = (float)objFirstInt.TotalDays;
                hfFirstIntDay.Value = FirstDay.ToString();

                TimeSpan objSecondInt = Maturity - IPDates;
                float SecondDay = (float)objSecondInt.TotalDays;
                hfSecondIntDay.Value = SecondDay.ToString();
                float day = FirstDay + SecondDay;
                hfDayValue.Value = day.ToString();

                DateTime compareTo = IPDates;
                DateTime now = Maturity;
                var dateSpan = DateTimeSpan.CompareDates(compareTo, now);
                var TotalYear = dateSpan.Years;
                hfTotalYear.Value = TotalYear.ToString();
                var TotalMonth = dateSpan.Months;
                hfTotalMonth.Value = TotalMonth.ToString();
                var TotalDay = dateSpan.Days;
                hfTotalDay.Value = TotalDay.ToString();
                PaymentType();
            }
            else
            {
                DataTable dt = dl.get_MonthlyDate(Sattles, IPDat);
                string Date = dt.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;
                DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
                TimeSpan objFirstInt = IPDates - Sattles;
                float FirstDay = (float)objFirstInt.TotalDays;
                hfFirstIntDay.Value = FirstDay.ToString();

                TimeSpan objSecondInt = Maturity - IPDates;
                float SecondDay = (float)objSecondInt.TotalDays;
                hfSecondIntDay.Value = SecondDay.ToString();
                float day = FirstDay + SecondDay;
                hfDayValue.Value = day.ToString();

                DateTime compareTo = IPDates;
                DateTime now = Maturity;
                var dateSpan = DateTimeSpan.CompareDates(compareTo, now);
                var TotalYear = dateSpan.Years;
                hfTotalYear.Value = TotalYear.ToString();
                var TotalMonth = dateSpan.Months;
                hfTotalMonth.Value = TotalMonth.ToString();
                var TotalDay = dateSpan.Days;
                hfTotalDay.Value = TotalDay.ToString();
                PaymentType();
            }
            
        }
        if (hfPaymentType.Value == "Yearly")
        {

            DataTable dt = dl.get_YearlyDate(Sattles, IPDat);
            if (dt.Rows.Count > 0)
            {
                string Date = dt.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;
            }
            DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
            TimeSpan objFirstInt = IPDates - Sattles;
            float FirstDay = (float)objFirstInt.TotalDays;
            hfFirstIntDay.Value = FirstDay.ToString();

            TimeSpan objSecondInt = Maturity - IPDates;
            float SecondDay = (float)objSecondInt.TotalDays;
            hfSecondIntDay.Value = SecondDay.ToString();
            float day = FirstDay + SecondDay;
            hfDayValue.Value = day.ToString();

            DateTime compareTo = IPDates;
            DateTime now = Maturity;
            var dateSpan = DateTimeSpan.CompareDates(compareTo, now);
            var TotalYear = dateSpan.Years;
            hfTotalYear.Value = TotalYear.ToString();
            var TotalMonth = dateSpan.Months;
            hfTotalMonth.Value = TotalMonth.ToString();
            var TotalDay = dateSpan.Days;
            hfTotalDay.Value = TotalDay.ToString();
            PaymentType();
        }

        if (hfPaymentType.Value == "Quarterly")
        {

            if (hfEOM.Value == "1")
            {
                DataTable dt = dl.get_LastQuarterlyDate(Sattles, IPDat);
                if (dt.Rows.Count > 0)
                {
                    string Date = dt.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;

                    DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
                    TimeSpan objFirstInt = IPDates - Sattles;
                    float FirstDay = (float)objFirstInt.TotalDays;
                    hfFirstIntDay.Value = FirstDay.ToString();

                    TimeSpan objSecondInt = Maturity - IPDates;
                    float SecondDay = (float)objSecondInt.TotalDays;
                    hfSecondIntDay.Value = SecondDay.ToString();
                    float day = FirstDay + SecondDay;
                    hfDayValue.Value = day.ToString();

                    DateTime compareTo = IPDates;
                    DateTime now = Maturity;
                    var dateSpan = DateTimeSpan.CompareDates(compareTo, now);
                    var TotalYear = dateSpan.Years;
                    hfTotalYear.Value = TotalYear.ToString();
                    var TotalMonth = dateSpan.Months;
                    hfTotalMonth.Value = TotalMonth.ToString();
                    var TotalDay = dateSpan.Days;
                    hfTotalDay.Value = TotalDay.ToString();
                    PaymentType();
                }
            }
            else
            {
                DataTable dt = dl.get_QuarterlyDate(Sattles, IPDat);
                if (dt.Rows.Count > 0)
                {
                    string Date = dt.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;

                    DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
                    TimeSpan objFirstInt = IPDates - Sattles;
                    float FirstDay = (float)objFirstInt.TotalDays;
                    hfFirstIntDay.Value = FirstDay.ToString();

                    TimeSpan objSecondInt = Maturity - IPDates;
                    float SecondDay = (float)objSecondInt.TotalDays;
                    hfSecondIntDay.Value = SecondDay.ToString();
                    float day = FirstDay + SecondDay;
                    hfDayValue.Value = day.ToString();

                    DateTime compareTo = IPDates;
                    DateTime now = Maturity;
                    var dateSpan = DateTimeSpan.CompareDates(compareTo, now);
                    var TotalYear = dateSpan.Years;
                    hfTotalYear.Value = TotalYear.ToString();
                    var TotalMonth = dateSpan.Months;
                    hfTotalMonth.Value = TotalMonth.ToString();
                    var TotalDay = dateSpan.Days;
                    hfTotalDay.Value = TotalDay.ToString();
                    PaymentType();
                }
            }
            
        }

        if (hfPaymentType.Value == "Half Yearly")
        {
            if (hfEOM.Value == "1")
            {
                DataTable dt = dl.get_LastHalfYearlyDate(Sattles, IPDat);
                if (dt.Rows.Count > 0)
                {
                    string Date = dt.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
                    TimeSpan objFirstInt = IPDates - Sattles;
                    float FirstDay = (float)objFirstInt.TotalDays;
                    hfFirstIntDay.Value = FirstDay.ToString();

                    TimeSpan objSecondInt = Maturity - IPDates;
                    float SecondDay = (float)objSecondInt.TotalDays;
                    hfSecondIntDay.Value = SecondDay.ToString();
                    float day = FirstDay + SecondDay;
                    hfDayValue.Value = day.ToString();

                    DateTime compareTo = IPDates;
                    DateTime now = Maturity;
                    var dateSpan = DateTimeSpan.CompareDates(compareTo, now);
                    var TotalYear = dateSpan.Years;
                    hfTotalYear.Value = TotalYear.ToString();
                    var TotalMonth = dateSpan.Months;
                    hfTotalMonth.Value = TotalMonth.ToString();
                    var TotalDay = dateSpan.Days;
                    hfTotalDay.Value = TotalDay.ToString();
                    PaymentType();
                }
            }
            else
            {
                DataTable dt = dl.get_HalfYearlyDate(Sattles, IPDat);
                if (dt.Rows.Count > 0)
                {
                    string Date = dt.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime IPDates = DateTime.ParseExact(hfLastIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
                    TimeSpan objFirstInt = IPDates - Sattles;
                    float FirstDay = (float)objFirstInt.TotalDays;
                    hfFirstIntDay.Value = FirstDay.ToString();

                    TimeSpan objSecondInt = Maturity - IPDates;
                    float SecondDay = (float)objSecondInt.TotalDays;
                    hfSecondIntDay.Value = SecondDay.ToString();
                    float day = FirstDay + SecondDay;
                    hfDayValue.Value = day.ToString();

                    DateTime compareTo = IPDates;
                    DateTime now = Maturity;
                    var dateSpan = DateTimeSpan.CompareDates(compareTo, now);
                    var TotalYear = dateSpan.Years;
                    hfTotalYear.Value = TotalYear.ToString();
                    var TotalMonth = dateSpan.Months;
                    hfTotalMonth.Value = TotalMonth.ToString();
                    var TotalDay = dateSpan.Days;
                    hfTotalDay.Value = TotalDay.ToString();
                    PaymentType();
                }
            }
            
        }
    }
    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        if(dl.delete_CashFlowView(lnkDelete.CommandArgument,GetUserLoggedIn()))
        {
            BindData();
        }
    }

    protected void lnkDealClose_Click(object sender, EventArgs e)
    {
        LinkButton lnkApproved = (LinkButton)sender;
        GridViewRow gvr = ((LinkButton)sender).NamingContainer as GridViewRow;
        HiddenField hfCustomer = (HiddenField)gvr.FindControl("hfCustomer");
        HiddenField hfCashFlowView = (HiddenField)gvr.FindControl("hfCashFlowView");
        HiddenField hfProduct = (HiddenField)gvr.FindControl("hfProduct");
        HiddenField ddlPaymentType = (HiddenField)gvr.FindControl("hfFrequency");
        hfPaymentType.Value = ddlPaymentType.Value;
        DataTable dtg = dl.CheckLastDayOFMonth(hfProduct.Value);
        string EOM = dtg.Rows[0]["EOM"].ToString();
        hfEOM.Value = EOM;
        string IPDate = dtg.Rows[0]["IPDate"].ToString();
        hfIPDa.Value = IPDate.ToString();

        DataTable dt = dl.get_CashFlowView(hfCashFlowView.Value, hfCustomer.Value, hfProduct.Value, null);
        if(dt.Rows.Count > 0)
        {
            string Sattlement = dt.Rows[0]["SattlementDate"].ToString();
            hfSattlementDate.Value = Sattlement;
            string LastIPDate = dt.Rows[0]["LastIPDate"].ToString();
            hfLastIPDate.Value = LastIPDate;
            string Maturity = dt.Rows[0]["MaturityDate"].ToString();
            hfMaturityDate.Value = Maturity;
            string Quantity = dt.Rows[0]["Quantity"].ToString();
            hfQuantity.Value = Quantity;
            string PrincipalAmount = dt.Rows[0]["PrincipalAmount"].ToString();
            hfPrincipalAmount.Value = PrincipalAmount;
            string TotalInterest = dt.Rows[0]["TotalAssuredInterest"].ToString();
            hfTotalAssuredInterest.Value = TotalInterest;
            string GrossConsideration = dt.Rows[0]["GrossConsideration"].ToString();
            hfGrossConsideration.Value = GrossConsideration;
            string FaceValueForDeal = dt.Rows[0]["FaceValueForDeal"].ToString();
            hfFaceValueForDeal.Value = FaceValueForDeal;
            string TotalConsideration = dt.Rows[0]["TotalConsiderationAmount"].ToString();
            hfTotalConsiderationAmount.Value = TotalConsideration;
            string CouponRate = dt.Rows[0]["CouponRate"].ToString();
            hfCouponRate.Value = CouponRate;
            string ProductName = dt.Rows[0]["Security"].ToString();
            hfProductName.Value = ProductName;
            string Rates = dt.Rows[0]["Price"].ToString();
            hfRate.Value = Rates;
            string MaturityType = dt.Rows[0]["MaturityType"].ToString();
            hfMaturityType.Value = MaturityType;
            SattlementData();
            
        }
        int IId = dl.add_CloseDeal(null, hfProduct.Value, hfCustomer.Value, hfCashFlowView.Value, hfPaymentType.Value, hfSattlementDate.Value, hfFaceValueForDeal.Value, hfQuantity.Value, hfPrincipalAmount.Value, hfTotalAssuredInterest.Value, hfGrossConsideration.Value, GetUserLoggedIn(), hfLastIPDate.Value, hfTotalConsiderationAmount.Value);
        if(IId.ToString() !=null)
        {
            float Deal = float.Parse(hfFaceValueForDeal.Value);
            float coupon = float.Parse(hfCouponRate.Value);
            float Rate = float.Parse(hfRate.Value);

            float FaceValue = float.Parse(hfFaceValueForDeal.Value);
            if(hfMaturityType.Value == "Bullet")
            {
                if (hfPaymentType.Value == "Monthly")
                {
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    float FirstMonth = (((Deal * coupon * fday) / 36500));
                    hfFirstMonthly.Value = FirstMonth.ToString();
                    dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstMonthly.Value, GetUserLoggedIn());

                    DateTime lastDate = InstallDate;
                    int UnitCount = Convert.ToInt32(hfMonth.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = InstallDate.AddMonths(i);
                        TimeSpan objTimeSpan = InsDate - lastDate;
                        float days = (float)objTimeSpan.TotalDays;
                        float monthlyinterest = (((Deal * coupon * days) / 36500));
                        hfMInterest.Value = monthlyinterest.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                        lastDate = InsDate;
                    }
                    float LastMonthInt = float.Parse(hfRemainingDay.Value);
                    float LastMonth = (((Deal * coupon * LastMonthInt) / 36500) + (Rate * Deal / 100));
                    hfLastMonthly.Value = LastMonth.ToString();
                    dl.add_CloseDealInterestDetails(null, IId.ToString(), LastMonthInt.ToString(), hfCustomer.Value, hfMaturityDate.Value, hfLastMonthly.Value, GetUserLoggedIn());
                    if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                    {
                        DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                        string Email = dts.Rows[0]["CEmail"].ToString();
                        string Customer = dts.Rows[0]["CFullName"].ToString();
                        DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                        if (dth.Rows.Count > 0)
                        {
                            string RMemail = dth.Rows[0]["Email"].ToString();
                            hfRMemail.Value = RMemail;
                        }
                        DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                        if (dtj.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtj.Rows.Count; i++)
                            {
                                string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                            }
                        }
                        sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                        BindData();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                        return;
                    }
                }
                if (hfPaymentType.Value == "Quarterly")
                {
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    float FirstQuarterly = ((Deal * coupon * fday) / 36500);
                    hfFirstQuarterly.Value = FirstQuarterly.ToString();
                    dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstQuarterly.Value, GetUserLoggedIn());
                    DateTime lastDate = InstallDate;
                    int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = InstallDate.AddMonths(i * 3);
                        TimeSpan objTimeSpan = InsDate - lastDate;
                        float days = (float)objTimeSpan.TotalDays;
                        float QuertarlyInterest = (((Deal * coupon * days) / 36500));
                        hfMInterest.Value = QuertarlyInterest.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                        lastDate = InsDate;
                        hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                    }
                    DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objtime = (Maturity - Last);
                    float dayss = (float)objtime.TotalDays;
                    float LastYearly = (((Deal * coupon * dayss) / 36500) + (Rate * Deal / 100));
                    dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                    if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                    {
                        DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                        string Email = dts.Rows[0]["CEmail"].ToString();
                        string Customer = dts.Rows[0]["CFullName"].ToString();
                        DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                        if (dth.Rows.Count > 0)
                        {
                            string RMemail = dth.Rows[0]["Email"].ToString();
                            hfRMemail.Value = RMemail;
                        }
                        DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                        if (dtj.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtj.Rows.Count; i++)
                            {
                                string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                            }
                        }
                        sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                        BindData();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                        return;

                    }

                }
                if (hfPaymentType.Value == "Yearly")
                {

                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    float FirstYear = ((Deal * coupon * fday) / 36500);
                    hfFirstYearly.Value = FirstYear.ToString();
                    dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstYearly.Value, GetUserLoggedIn());
                    DateTime lastDate = InstallDate;
                    int UnitCount = Convert.ToInt32(hfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {

                        DateTime InsDate = InstallDate.AddMonths(i * 12);
                        TimeSpan objTimeSpan = InsDate - lastDate;
                        float days = (float)objTimeSpan.TotalDays;
                        float yearlyInterest = (((Deal * coupon * days) / 36500));
                        hfMInterest.Value = yearlyInterest.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                        lastDate = InsDate;
                        hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                    }
                    DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objtime = (Maturity - Last);
                    float dayss = (float)objtime.TotalDays;
                    float LastYearly = (((Deal * coupon * dayss) / 36500) + (Rate * Deal / 100));
                    dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                    if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                    {
                        DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                        string Email = dts.Rows[0]["CEmail"].ToString();
                        string Customer = dts.Rows[0]["CFullName"].ToString();
                        DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                        if (dth.Rows.Count > 0)
                        {
                            string RMemail = dth.Rows[0]["Email"].ToString();
                            hfRMemail.Value = RMemail;
                        }
                        DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                        if (dtj.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtj.Rows.Count; i++)
                            {
                                string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                            }
                        }
                        sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                        BindData();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                        return;
                    }
                }
                if (hfPaymentType.Value == "Half Yearly")
                {
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    float FirstHalfY = ((Deal * coupon * fday) / 36500);
                    hfFirstHalf.Value = FirstHalfY.ToString();
                    dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstHalf.Value, GetUserLoggedIn());
                    DateTime lastDate = InstallDate;
                    int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = InstallDate.AddMonths(i * 6);
                        TimeSpan objTimeSpan = InsDate - lastDate;
                        float days = (float)objTimeSpan.TotalDays;
                        float halfInterest = (((Deal * coupon * days) / 36500));
                        hfMInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                        lastDate = InsDate;
                        hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                    }
                    DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objtime = (Maturity - Last);
                    float dayss = (float)objtime.TotalDays;
                    float LastYearly = (((Deal * coupon * dayss) / 36500) + (Rate * Deal / 100));
                    dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                    if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                    {
                        DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                        string Email = dts.Rows[0]["CEmail"].ToString();
                        string Customer = dts.Rows[0]["CFullName"].ToString();
                        DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                        if (dth.Rows.Count > 0)
                        {
                            string RMemail = dth.Rows[0]["Email"].ToString();
                            hfRMemail.Value = RMemail;
                        }
                        DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                        if (dtj.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtj.Rows.Count; i++)
                            {
                                string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                            }
                        }
                        sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                        BindData();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                        return;
                    }
                }
            }

            if(hfMaturityType.Value == "Staggered")
            {
                if (hfPaymentType.Value == "Monthly")
                {
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    DataTable dtc = dl.CheckMaturityTypeValue(hfProduct.Value, hfIPDates.Value);
                    if(dtc.Rows.Count > 0)
                    {
                        string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                        float percent = float.Parse(Percentage.ToString());
                        float FirstMonth = (((Deal * coupon * fday) / 36500) + (FaceValue * percent / 100));
                        hfFirstMonthly.Value = FirstMonth.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstMonthly.Value, GetUserLoggedIn());
                        float face = (Deal - (FaceValue * percent / 100));
                        DateTime lastDate = InstallDate;
                        float per = percent;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfMonth.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProduct.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float monthlyinterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                                hfMInterest.Value = monthlyinterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                float Faces = (face - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                face = Faces;
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();
                            }
                            else
                            {

                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float monthlyinterest = (((face * coupon * days) / 36500));
                                hfMInterest.Value = monthlyinterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                            }

                        }
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProduct.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        if (dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotapercent = (per + lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotapercent);
                            float LastMonthInt = float.Parse(hfRemainingDay.Value);
                            float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent / 100));
                            hfLastMonthly.Value = LastMonth.ToString();
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), LastMonthInt.ToString(), hfCustomer.Value, hfMaturityDate.Value, hfLastMonthly.Value, GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                           
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastMonthInt = float.Parse(hfRemainingDay.Value);
                            float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * remainingpercent / 100));
                            hfLastMonthly.Value = LastMonth.ToString();
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), LastMonthInt.ToString(), hfCustomer.Value, hfMaturityDate.Value, hfLastMonthly.Value, GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }

                    }
                    else
                    {
                        float FirstMonth = (((Deal * coupon * fday) / 36500));
                        hfFirstMonthly.Value = FirstMonth.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstMonthly.Value, GetUserLoggedIn());
                        float Pers = 0;
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfMonth.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProduct.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float monthlyinterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce / 100));
                                hfMInterest.Value = monthlyinterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                float Faces = (Deal - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                Deal = Faces;
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();
                            }
                            else
                            {
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float monthlyinterest = (((Deal * coupon * days) / 36500));
                                hfMInterest.Value = monthlyinterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                            }

                        }
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProduct.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        if (dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotalpercent);
                            float LastMonthInt = float.Parse(hfRemainingDay.Value);
                            float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent / 100));
                            hfLastMonthly.Value = LastMonth.ToString();
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), LastMonthInt.ToString(), hfCustomer.Value, hfMaturityDate.Value, hfLastMonthly.Value, GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastMonthInt = float.Parse(hfRemainingDay.Value);
                            float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * remainingpercent / 100));
                            hfLastMonthly.Value = LastMonth.ToString();
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), LastMonthInt.ToString(), hfCustomer.Value, hfMaturityDate.Value, hfLastMonthly.Value, GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }
                    }

                }
                if (hfPaymentType.Value == "Quarterly")
                {
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    DataTable dtc = dl.CheckMaturityTypeValue(hfProduct.Value, hfIPDates.Value);
                    if(dtc.Rows.Count > 0)
                    {
                        string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                        float percent = float.Parse(Percentage.ToString());
                        float FirstQuarterly = (((Deal * coupon * fday) / 36500) + (FaceValue * percent / 100));
                        hfFirstQuarterly.Value = FirstQuarterly.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstQuarterly.Value, GetUserLoggedIn());

                        DateTime lastDate = InstallDate;
                        float face = (Deal - (FaceValue * percent / 100));
                        float per = percent;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 3);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProduct.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float QuertarlyInterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                                hfMInterest.Value = QuertarlyInterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                float Faces = (face - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                face = Faces;
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();
                            }
                            else
                            {
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float QuertarlyInterest = (((face * coupon * days) / 36500));
                                hfMInterest.Value = QuertarlyInterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }

                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProduct.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        if(dtn.Rows.Count > 0)
                        {

                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotapercent = (per + lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotapercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;

                            }

                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;

                            }
                        }

                    }
                    else
                    {

                        float FirstQuarterly = ((Deal * coupon * fday) / 36500);
                        hfFirstQuarterly.Value = FirstQuarterly.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstQuarterly.Value, GetUserLoggedIn());
                        DateTime lastDate = InstallDate;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 3);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProduct.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float QuertarlyInterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce / 100));
                                hfMInterest.Value = QuertarlyInterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                float Faces = (Deal - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                Deal = Faces;
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();
                            }
                            else
                            {
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float QuertarlyInterest = (((Deal * coupon * days) / 36500));
                                hfMInterest.Value = QuertarlyInterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }

                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProduct.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        if(dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotalpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;

                            }
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;

                            }
                        }

                    }
                    

                }
                if (hfPaymentType.Value == "Yearly")
                {

                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    DataTable dtc = dl.CheckMaturityTypeValue(hfProduct.Value, hfIPDates.Value);
                    if(dtc.Rows.Count > 0)
                    {
                        string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                        float percent = float.Parse(Percentage.ToString());
                        float FirstYear = (((Deal * coupon * fday) / 36500) + (FaceValue * percent / 100));
                        hfFirstYearly.Value = FirstYear.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstYearly.Value, GetUserLoggedIn());
                        float face = (Deal - (FaceValue * percent / 100));
                        DateTime lastDate = InstallDate;
                        float per = percent;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {

                            DateTime InsDate = InstallDate.AddMonths(i * 12);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProduct.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if (dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float yearlyInterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                                hfMInterest.Value = yearlyInterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                float Faces = (Deal - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                Deal = Faces;
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();
                            }
                            else
                            {
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float yearlyInterest = (((Deal * coupon * days) / 36500));
                                hfMInterest.Value = yearlyInterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }

                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProduct.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        if(dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotapercent = (per + lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotapercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }

                    }
                    else
                    {
                        float FirstYear = ((Deal * coupon * fday) / 36500);
                        hfFirstYearly.Value = FirstYear.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstYearly.Value, GetUserLoggedIn());
                        float Pers = 0;
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {

                            DateTime InsDate = InstallDate.AddMonths(i * 12);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProduct.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float yearlyInterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce / 100));
                                hfMInterest.Value = yearlyInterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                float Faces = (Deal - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                Deal = Faces;
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();
                            }
                            else
                            {
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float yearlyInterest = (((Deal * coupon * days) / 36500));
                                hfMInterest.Value = yearlyInterest.ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProduct.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        if(dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotalpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }

                    }

                }
                if (hfPaymentType.Value == "Half Yearly")
                {
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    DataTable dtc = dl.CheckMaturityTypeValue(hfProduct.Value, hfIPDates.Value);
                    if(dtc.Rows.Count > 0)
                    {
                        string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                        float percent = float.Parse(Percentage.ToString());
                        float FirstHalfY = (((Deal * coupon * fday) / 36500) + (FaceValue * percent / 100));
                        hfFirstHalf.Value = FirstHalfY.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstHalf.Value, GetUserLoggedIn());
                        DateTime lastDate = InstallDate;
                        float face = (Deal - (FaceValue * percent / 100));
                        float per = percent;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 6);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProduct.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float halfInterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                                hfMInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                float Faces = (face - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                face = Faces;
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();

                            }
                            else
                            {
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float halfInterest = (((face * coupon * days) / 36500));
                                hfMInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProduct.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        if(dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotapercent = (per + lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotapercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }
                        else
                        {
                            float remainingperenct = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingperenct / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }

                    }
                    else
                    {
                        float FirstHalfY = ((Deal * coupon * fday) / 36500);
                        hfFirstHalf.Value = FirstHalfY.ToString();
                        dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstHalf.Value, GetUserLoggedIn());
                        DateTime lastDate = InstallDate;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 6);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProduct.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float halfInterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce / 100));
                                hfMInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                float Faces = (Deal - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                Deal = Faces;
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();
                            }
                            else
                            {
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float halfInterest = (((Deal * coupon * days) / 36500));
                                hfMInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                                dl.add_CloseDealInterestDetails(null, IId.ToString(), days.ToString(), hfCustomer.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMInterest.Value, GetUserLoggedIn());
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }

                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProduct.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        if(dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotalpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent / 100));
                            dl.add_CloseDealInterestDetails(null, IId.ToString(), dayss.ToString(), hfCustomer.Value, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                            if (dl.CashFlowViewStatus(hfCashFlowView.Value, GetUserLoggedIn()))
                            {
                                DataTable dts = dl.getCustomer(hfCustomer.Value, null);
                                string Email = dts.Rows[0]["CEmail"].ToString();
                                string Customer = dts.Rows[0]["CFullName"].ToString();
                                DataTable dth = dl.getPanelUsersRMs(GetUserLoggedIn(), null);
                                if (dth.Rows.Count > 0)
                                {
                                    string RMemail = dth.Rows[0]["Email"].ToString();
                                    hfRMemail.Value = RMemail;
                                }
                                DataTable dtj = dl.getPanelUsersWithoutRM(null, null);
                                if (dtj.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dtj.Rows.Count; i++)
                                    {
                                        string AdminEmail = dtj.Rows[0]["Email"].ToString();
                                        sms.sendBondConfirmationDetails(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, AdminEmail);
                                    }
                                }
                                sms.sendBondConfirmationDetailss(hfProductName.Value, Email, Customer, hfTotalAssuredInterest.Value, hfTotalConsiderationAmount.Value, hfMaturityDate.Value, hfIPDates.Value, hfSattlementDate.Value, hfRMemail.Value);
                                BindData();
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Deal Close Successfully', type: 'success',});", true);
                                return;
                            }
                        }
                    }
                }
            }

            if(hfMaturityType.Value == "Cumulative")
            {
                DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime InstallDate = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                TimeSpan FirstDay = (InstallDate - Salltle);
                float fday = (float)FirstDay.TotalDays;
                float FirstMonth = (((Deal * coupon * fday) / 36500));
                hfFirstMonthly.Value = FirstMonth.ToString();
                dl.add_CloseDealInterestDetails(null, IId.ToString(), fday.ToString(), hfCustomer.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstMonthly.Value, GetUserLoggedIn());
            }

        }

    }

    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            LinkButton lnkDealClose = (e.Row.FindControl("lnkDealClose") as LinkButton);
            LinkButton lnkdelete = (e.Row.FindControl("lnkdelete") as LinkButton);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());

            lnkDealClose.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
            grdData.Columns[7].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[8].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);


        }

    }
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());

        //pnlView.Visible = true;

    }
}