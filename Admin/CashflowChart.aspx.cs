using LanguageExt.TypeClasses;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CashflowChart : System.Web.UI.Page
{

    DAL dl = new DAL(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            ProductName();
            CustomerName();
        }
    }
    private void BindData()
    {
        grdData.DataSource = dl.get_CashFlowChart(null, null, null, null,null);
        grdData.DataBind();
    }
    private void ProductName()
    {
        ddlProductName.DataSource = dl.get_Products(null, null,null,null);
        ddlProductName.DataTextField = "Security";
        ddlProductName.DataValueField = "ProductsId";
        ddlProductName.DataBind();
        ddlProductName.Items.Insert(0, new ListItem("Choose one", "-1"));
    }

    private void CustomerName()
    {
        ddlCustomerName.DataSource = dl.getCustomer(null, null);
        ddlCustomerName.DataTextField = "CFullName";
        ddlCustomerName.DataValueField = "CustomerId";
        ddlCustomerName.DataBind();
        ddlCustomerName.Items.Insert(0, new ListItem("Choose one", "-1"));
    }



    private void ProductDetails()
    {
        DataTable dt = dl.get_Products(ddlProductName.SelectedValue,null,null,null);
        if(dt.Rows.Count > 0)
        {
            txtISIN.Text = dt.Rows[0]["ISINNumber"].ToString();
            hfISINNumber.Value = txtISIN.Text;
            txtCoupon.Text = dt.Rows[0]["CouponRate"].ToString();
            hfCouponRate.Value = txtCoupon.Text;
            txtMaturity.Text = dt.Rows[0]["MaturityDate"].ToString();
            hfMaturityDate.Value = txtMaturity.Text;
            txtRatePrice.Text = dt.Rows[0]["Price"].ToString();
            hfRatePrice.Value = txtRatePrice.Text;
            txtFaceValueForBond.Text = dt.Rows[0]["FacevalueForBond"].ToString();
            hfFaceValueForBond.Value = txtFaceValueForBond.Text;
            ddlFrequency.Text = dt.Rows[0]["PaymentTypeHead"].ToString();
            hfPaymentType.Value = ddlFrequency.Text;
            string IPDateaa = dt.Rows[0]["IPDate"].ToString();
            hfIPDate.Value = IPDateaa.ToString();
            DateTime IPDat = DateTime.ParseExact(hfIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime Sattles = DateTime.Now;
            if (hfPaymentType.Value == "Monthly")
            {
                DataTable dtc = dl.get_MonthlyDate(Sattles, IPDat);
                string Date = dtc.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;
                DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime IP = Datee.AddMonths(-1);
                txtIPDate.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                hfnewIPDate.Value = IP.ToString("dd/MM/yyyy").Replace("-", "/");
            }
            if (hfPaymentType.Value == "Yearly")
            {
                DataTable dtc = dl.get_YearlyDate(Sattles, IPDat);
                string Date = dtc.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;
                DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime IP = Datee.AddYears(-1);
                txtIPDate.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                hfnewIPDate.Value = txtIPDate.Text;
            }
            if (hfPaymentType.Value == "Quarterly")
            {
                DataTable dtc = dl.get_QuarterlyDate(Sattles, IPDat);
                string Date = dtc.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;
                DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime IP = Datee.AddMonths(-3);
                txtIPDate.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                hfnewIPDate.Value = txtIPDate.Text;
            }
            if (hfPaymentType.Value == "Half Yearly")
            {
                DataTable dtc = dl.get_HalfYearlyDate(Sattles, IPDat);
                string Date = dtc.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;
                DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime IP = Datee.AddMonths(-6);
                txtIPDate.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                hfnewIPDate.Value = txtIPDate.Text;
            }
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

    private void clear()
    {
        ddlCustomerName.SelectedIndex = 0;
        ddlProductName.SelectedIndex = 0;
        txtSattlement.Text = string.Empty;
        txtFaceValueForDeal.Text = string.Empty;
        txtRatePrice.Text = string.Empty;
        txtAccuredInterest.Text = string.Empty;
        txtCoupon.Text = string.Empty;
        txtFaceValueForBond.Text = string.Empty;
        txtISIN.Text = string.Empty;
        ddlFrequency.Text = string.Empty;
        txtMaturity.Text = string.Empty;
        txtIPDate.Text = string.Empty;
        txtQuantity.Text = string.Empty;
        txtGrossConsideration.Text = string.Empty;
        txtPrincipalAmount.Text = string.Empty;
        txtNumber.Text = string.Empty;
        ViewState["Id"] = null;
    }

    protected void lnkAdd_Click(object sender, EventArgs e)
    {
        float Deal = float.Parse(txtFaceValueForDeal.Text);
        float coupon = float.Parse(hfCouponRate.Value);
        DateTime IPDate = DateTime.ParseExact(hfIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        DateTime Sattle = DateTime.ParseExact(txtSattlement.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        if (ddlCustomerName.SelectedIndex==0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Choose Customer Name', type: 'error',});", true);
            return;
        }
        if(ddlProductName.SelectedIndex ==0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Choose Customer Name, type: 'error',});", true);
            return;
        }
        if(txtSattlement.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Sattlement Date Must Be Enter', type: 'error',});", true);
            return;
        }
        
        if(txtFaceValueForDeal.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Face Value For Deal Must Be Enter', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"]==null)
        {
            if(hfPaymentType.Value == "Monthly")
            {
                int month = Convert.ToInt32(hfMonth.Value);
                int newbata = (month + 2);
                hftotalrowbond.Value = newbata.ToString();
            }
            if (hfPaymentType.Value == "Yearly")
            {
                int month = Convert.ToInt32(hfYearly.Value);
                int newbata = (month + 2);
                hftotalrowbond.Value = newbata.ToString();
            }
            if (hfPaymentType.Value == "Quarterly")
            {
                int month = Convert.ToInt32(hfQuerterly.Value);
                int newbata = (month + 2);
                hftotalrowbond.Value = newbata.ToString();
            }
            if (hfPaymentType.Value == "Half Yearly")
            {
                int month = Convert.ToInt32(hfHalfYearly.Value);
                int newbata = (month + 2);
                hftotalrowbond.Value = newbata.ToString();
            }

            int IId = dl.add_CashFlowChart(null, ddlProductName.SelectedValue, ddlCustomerName.SelectedValue, hfPaymentType.Value, txtSattlement.Text, txtFaceValueForDeal.Text, txtQuantity.Text, txtPrincipalAmount.Text, txtAccuredInterest.Text, txtGrossConsideration.Text, GetUserLoggedIn(),hfnewIPDate.Value, hftotalrowbond.Value);
            if(IId !=0)
            {
                if(hfPaymentType.Value =="Monthly")
                {
                    if (IPDate > Sattle)
                    {

                        DateTime InstallDate = IPDate;
                        TimeSpan FirstDay = (InstallDate - Sattle);
                        float fday = (float)FirstDay.TotalDays;
                        dl.add_CashFlowChartDetails(null, IId.ToString(), fday.ToString(), ddlCustomerName.SelectedValue, hfIPDate.Value, hfFirstMonthly.Value, GetUserLoggedIn());

                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfMonth.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float monthlyinterest = (((Deal * coupon * days) / 36500));
                            hfMonthlyInterest.Value = monthlyinterest.ToString();
                            dl.add_CashFlowChartDetails(null, IId.ToString(), days.ToString(), ddlCustomerName.SelectedValue, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMonthlyInterest.Value, GetUserLoggedIn());
                            lastDate = InsDate;
                        }

                        float LastMonthInt = float.Parse(hfRemainingDay.Value);
                        float LastMonth = ((Deal * coupon * LastMonthInt) / 36500);
                        hfLastMonthly.Value = LastMonth.ToString();
                        dl.add_CashFlowChartDetails(null, IId.ToString(), LastMonthInt.ToString(), ddlCustomerName.SelectedValue, hfMaturityDate.Value, hfLastMonthly.Value, GetUserLoggedIn());
                    }
                    else
                    {
                        DateTime Salltle = Sattle;
                        DateTime InstallDate = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        dl.add_CashFlowChartDetails(null, IId.ToString(), fday.ToString(), ddlCustomerName.SelectedValue, hfQuar.Value, hfFirstMonthly.Value, GetUserLoggedIn());

                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfMonth.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float monthlyinterest = (((Deal * coupon * days) / 36500));
                            hfMonthlyInterest.Value = monthlyinterest.ToString();
                            dl.add_CashFlowChartDetails(null, IId.ToString(), days.ToString(), ddlCustomerName.SelectedValue, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMonthlyInterest.Value, GetUserLoggedIn());
                            lastDate = InsDate;
                        }
                        float LastMonthInt = float.Parse(hfRemainingDay.Value);
                        float LastMonth = ((Deal * coupon * LastMonthInt) / 36500);
                        hfLastMonthly.Value = LastMonth.ToString();
                        dl.add_CashFlowChartDetails(null, IId.ToString(), LastMonthInt.ToString(), ddlCustomerName.SelectedValue, hfMaturityDate.Value, hfLastMonthly.Value, GetUserLoggedIn());
                    }
                    clear();
                    BindData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                    return;
                }
                if (hfPaymentType.Value == "Yearly")
                {
                    if (IPDate > Sattle)
                    {
                        DateTime InstallDate = IPDate;
                        DateTime Salltle = Sattle;
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        dl.add_CashFlowChartDetails(null, IId.ToString(), fday.ToString(), ddlCustomerName.SelectedValue, hfIPDate.Value, hfFirstYearly.Value, GetUserLoggedIn());
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {

                            DateTime InsDate = InstallDate.AddMonths(i*12);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;                         
                            float yearlyInterest = (((Deal * coupon * days) / 36500));
                            hfYearlyInterest.Value = yearlyInterest.ToString();
                            dl.add_CashFlowChartDetails(null, IId.ToString(), days.ToString(), ddlCustomerName.SelectedValue, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfYearlyInterest.Value, GetUserLoggedIn());
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString();
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500));
                        dl.add_CashFlowChartDetails(null, IId.ToString(), dayss.ToString(), ddlCustomerName.SelectedValue, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                    }
                    else
                    {
                        DateTime InstallDate = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture); 
                        DateTime Salltle = Sattle;
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        dl.add_CashFlowChartDetails(null, IId.ToString(), fday.ToString(), ddlCustomerName.SelectedValue, hfQuar.Value, hfFirstYearly.Value, GetUserLoggedIn());
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {

                            DateTime InsDate = InstallDate.AddMonths(i*12);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float yearlyInterest = (((Deal * coupon * days) / 36500));
                            hfYearlyInterest.Value = yearlyInterest.ToString();
                            dl.add_CashFlowChartDetails(null, IId.ToString(), days.ToString(), ddlCustomerName.SelectedValue, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfYearlyInterest.Value, GetUserLoggedIn());
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString();
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = Convert.ToDateTime(hfLastDate.Value);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500));
                        dl.add_CashFlowChartDetails(null, IId.ToString(), dayss.ToString(), ddlCustomerName.SelectedValue, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                    }
                    clear();
                    BindData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                    return;

                }
                if (hfPaymentType.Value == "Quarterly")
                {
                    if (IPDate > Sattle)
                    {
                        DateTime InstallDate = IPDate;
                        DateTime Salltle = Sattle;
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        dl.add_CashFlowChartDetails(null, IId.ToString(), fday.ToString(), ddlCustomerName.SelectedValue, hfIPDate.Value, hfFirstQuarterly.Value, GetUserLoggedIn());
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 3);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float QuertarlyInterest = (((Deal * coupon * days) / 36500));
                            hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                            dl.add_CashFlowChartDetails(null, IId.ToString(), days.ToString(), ddlCustomerName.SelectedValue, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfQuarterlyInterest.Value, GetUserLoggedIn());
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString();
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500));
                        dl.add_CashFlowChartDetails(null, IId.ToString(), dayss.ToString(), ddlCustomerName.SelectedValue, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                    }
                    else
                    {
                        DateTime InstallDate = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Salltle = Sattle; ;
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        dl.add_CashFlowChartDetails(null, IId.ToString(), fday.ToString(), ddlCustomerName.SelectedValue, hfQuar.Value, hfFirstQuarterly.Value, GetUserLoggedIn());
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 3);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float QuertarlyInterest = (((Deal * coupon * days) / 36500));
                            hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                            dl.add_CashFlowChartDetails(null, IId.ToString(), days.ToString(), ddlCustomerName.SelectedValue, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfQuarterlyInterest.Value, GetUserLoggedIn());
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString();
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = Convert.ToDateTime(hfLastDate.Value);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500));
                        dl.add_CashFlowChartDetails(null, IId.ToString(), dayss.ToString(), ddlCustomerName.SelectedValue, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                    }

                    clear();
                    BindData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                    return;
                }
                if(hfPaymentType.Value == "Half Yearly")
                {
                    if (IPDate > Sattle)
                    {
                        DateTime InstallDate = IPDate;
                        DateTime Salltle = Sattle;
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        dl.add_CashFlowChartDetails(null, IId.ToString(), fday.ToString(), ddlCustomerName.SelectedValue, hfIPDate.Value, hfFirstHalf.Value, GetUserLoggedIn());
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 6);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float halfInterest = (((Deal * coupon * days) / 36500));
                            hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                            dl.add_CashFlowChartDetails(null, IId.ToString(), days.ToString(), ddlCustomerName.SelectedValue, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfHalfYearlyInterest.Value, GetUserLoggedIn());
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString();
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500));
                        dl.add_CashFlowChartDetails(null, IId.ToString(), dayss.ToString(), ddlCustomerName.SelectedValue, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                    }
                    else
                    {
                        DateTime InstallDate = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Salltle = Sattle;
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        dl.add_CashFlowChartDetails(null, IId.ToString(), fday.ToString(), ddlCustomerName.SelectedValue, hfQuar.Value, hfFirstHalf.Value, GetUserLoggedIn());
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 6);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float halfInterest = (((Deal * coupon * days) / 36500));
                            hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                            dl.add_CashFlowChartDetails(null, IId.ToString(), null, ddlCustomerName.SelectedValue, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfHalfYearlyInterest.Value, GetUserLoggedIn());
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString();
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = Convert.ToDateTime(hfLastDate.Value);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500));
                        dl.add_CashFlowChartDetails(null, IId.ToString(), dayss.ToString(), ddlCustomerName.SelectedValue, hfMaturityDate.Value, LastYearly.ToString(), GetUserLoggedIn());
                    }
                    clear();
                    BindData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                    return;
                }

            }
        }
        //else
        //{
        //    if (dl.update_CashFlowChart(ViewState["Id"].ToString(), ddlProductName.SelectedValue, ddlCustomerName.SelectedValue, ddlFrequency.SelectedValue, txtSattlement.Text, txtFaceValueForDeal.Text, txtQuantity.Text, txtPrincipalAmount.Text, txtAccuredInterest.Text, txtGrossConsideration.Text, GetUserLoggedIn()))
        //    {
        //        dl.delete_CashFlowChartDetails(null, ViewState["Id"].ToString(), GetUserLoggedIn());
        //        if (ddlFrequency.SelectedValue == "Monthly")
        //        {

        //            int UnitCount = Convert.ToInt32(hfMonth.Value);
        //            for (int i = 1; i < UnitCount + 2; i++)
        //            {
        //                dl.add_CashFlowChartDetails(null, ViewState["Id"].ToString(), ddlCustomerName.SelectedValue, null, hfMonthlyInterest.Value, GetUserLoggedIn());
                       
        //            }
        //            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
        //            return;
        //        }
        //        if (ddlFrequency.SelectedValue == "Yearly")
        //        {
        //            int UnitCount = Convert.ToInt32(hfYearly.Value);
        //            for (int i = 1; i < UnitCount + 2; i++)
        //            {
        //                dl.add_CashFlowChartDetails(null, ViewState["Id"].ToString(), ddlCustomerName.SelectedValue, null, hfMonthlyInterest.Value, GetUserLoggedIn());
                       
        //            }
        //            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
        //            return;
        //        }
        //        if (ddlFrequency.SelectedValue == "Quarterly")
        //        {
        //            int UnitCount = Convert.ToInt32(hfQuerterly.Value);
        //            for (int i = 1; i < UnitCount + 2; i++)
        //            {
        //                dl.add_CashFlowChartDetails(null, ViewState["Id"].ToString(), ddlCustomerName.SelectedValue, null, hfQuarterlyInterest.Value, GetUserLoggedIn());
                           
        //            }
        //            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
        //            return;
        //        }
        //        if (ddlFrequency.SelectedValue == "Half Yearly")
        //        {
        //            int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
        //            for (int i = 1; i < UnitCount + 2; i++)
        //            {
        //                dl.add_CashFlowChartDetails(null, ViewState["Id"].ToString(), ddlCustomerName.SelectedValue, null, hfHalfYearlyInterest.Value, GetUserLoggedIn());
                   
        //            }
        //            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
        //            return;
        //        }

        //    }
        //}
    }

    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if(dl.update_CashFlowChart_Active_Status(chkIsActive.ToolTip,chkIsActive.Checked,GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;    
        DataTable dt = dl.get_CashFlowChart(lnkEdit.CommandArgument, null, null, null, null);
        if(dt.Rows.Count > 0)
        {
            ddlCustomerName.SelectedValue = dt.Rows[0]["CustomerId"].ToString();
            ddlProductName.SelectedValue = dt.Rows[0]["ProductsId"].ToString();
            ProductDetails();
            txtISIN.Text = dt.Rows[0]["ISINNumber"].ToString();
            txtCoupon.Text = dt.Rows[0]["CouponRate"].ToString();
            txtMaturity.Text = dt.Rows[0]["MaturityDate"].ToString();
            txtIPDate.Text = dt.Rows[0]["IPDate"].ToString();
            txtRatePrice.Text = dt.Rows[0]["Price"].ToString();
            txtFaceValueForBond.Text = dt.Rows[0]["FacevalueForBond"].ToString();
            txtSattlement.Text = dt.Rows[0]["FSattlementDate"].ToString();
            ddlFrequency.Text = dt.Rows[0]["PaymentType"].ToString();
            txtFaceValueForDeal.Text = dt.Rows[0]["FFaceValueForDeal"].ToString();
            txtQuantity.Text = dt.Rows[0]["FQuantity"].ToString();
            txtPrincipalAmount.Text = dt.Rows[0]["FPrincipalAmount"].ToString();
            txtAccuredInterest.Text = dt.Rows[0]["FTotalAssuredInterest"].ToString();
            txtGrossConsideration.Text = dt.Rows[0]["FGrossConsideration"].ToString();
            ViewState["Id"] = lnkEdit.CommandArgument;
        }
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkdelete = (LinkButton)sender;  
        if(dl.delete_CashFlowChart(lnkdelete.CommandArgument,GetUserLoggedIn()))
        {
            dl.delete_CashFlowChartDetails(null,lnkdelete.CommandArgument,GetUserLoggedIn());
            BindData();
        }
    }
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCashflowChartId = e.Row.FindControl("hfCashflowChartId") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            grdItems.DataSource = dl.get_CashFlowChartDetails(null, hfCashflowChartId.Value, null, true);
            grdItems.DataBind();
            for (int i = 0; i <= grdItems.Rows.Count - 1; i++)
            {
                LinkButton lnkApprove = (LinkButton)grdItems.Rows[i].FindControl("lnkApprove");
                HiddenField hfInterest = (HiddenField)grdItems.Rows[i].FindControl("hfInterest");
                Label Label1 = (Label)grdItems.Rows[i].FindControl("Label1");
                if (hfInterest.Value == "Pending")
                {
                    lnkApprove.Visible = true;
                }
                if(hfInterest.Value =="Approved")
                {
                    lnkApprove.Visible=false;
                    Label1.Text = "Approved";
                }
            }

        }

    }


    protected void ddlProductName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ProductDetails();

    }

    private void PaymentType()
    {
        if (hfPaymentType.Value == "Monthly")
        {
            float Year = float.Parse(hfTotalYear.Value);
            float Month = float.Parse(hfTotalMonth.Value);
            float Day = float.Parse(hfTotalDay.Value);


            //float day = float.Parse(hfSecondIntDay.Value);
            //var totalYear = Math.Truncate(day / 365);
            //var totalMonth = Math.Truncate((day % 365) / 30);
            //var remainingDays = Math.Truncate((day % 365) % 30);

            var totalMonths = ((Year * 12) + Month);
            txtNumber.Text = totalMonths.ToString();
            hfMonth.Value = txtNumber.Text;
            hfRemainingDay.Value = Day.ToString();
        }
        if (hfPaymentType.Value == "Yearly")
        {
            float Year = float.Parse(hfTotalYear.Value);
            float Month = float.Parse(hfTotalMonth.Value);
            float Day = float.Parse(hfTotalDay.Value);
            var totalYear = Year;
            txtNumber.Text = totalYear.ToString();
            hfYearly.Value = txtNumber.Text;
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


            txtNumber.Text = totalQuarterly.ToString();
            hfQuerterly.Value = txtNumber.Text;
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

            txtNumber.Text = totalHalfYearly.ToString();
            hfHalfYearly.Value = txtNumber.Text;
            hfMonth.Value = month.ToString();
            hfRemainingDay.Value = TotalDay.ToString();
        }
    }

    protected void txtSattlement_TextChanged(object sender, EventArgs e)
    {
        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        DateTime IPDate = DateTime.ParseExact(hfIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        DateTime Sattle = DateTime.ParseExact(txtSattlement.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        //TimeSpan objTimeSpan = Maturity - Sattle;
        //float day = (float)objTimeSpan.TotalDays;
        if(hfPaymentType.Value == "Monthly")
        {
            if (IPDate > Sattle)
            {
                TimeSpan objFirstInt = IPDate - Sattle;
                float FirstDay = (float)objFirstInt.TotalDays;
                hfFirstIntDay.Value = FirstDay.ToString();

                TimeSpan objSecondInt = Maturity - IPDate;
                float SecondDay = (float)objSecondInt.TotalDays;
                hfSecondIntDay.Value = SecondDay.ToString();
                float day = FirstDay + SecondDay;
                hfDayValue.Value = day.ToString();

                DateTime compareTo = IPDate;
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
                DataTable dt = dl.get_MonthlyDate(Sattle, IPDate);
                string Date = dt.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;


                DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                TimeSpan objFirstInt = IPDates - Sattle;
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
        if(hfPaymentType.Value == "Yearly")
        {
            if (IPDate > Sattle)
            {
                TimeSpan objFirstInt = IPDate - Sattle;
                float FirstDay = (float)objFirstInt.TotalDays;
                hfFirstIntDay.Value = FirstDay.ToString();

                TimeSpan objSecondInt = Maturity - IPDate;
                float SecondDay = (float)objSecondInt.TotalDays;
                hfSecondIntDay.Value = SecondDay.ToString();
                float day = FirstDay + SecondDay;
                hfDayValue.Value = day.ToString();

                DateTime compareTo = IPDate;
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
                DataTable dt = dl.get_YearlyDate(Sattle, IPDate);
                string Date = dt.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;


                DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                TimeSpan objFirstInt = IPDates - Sattle;
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

            if(hfPaymentType.Value == "Quarterly")
            {
                if (IPDate > Sattle)
                {
                    TimeSpan objFirstInt = IPDate - Sattle;
                    float FirstDay = (float)objFirstInt.TotalDays;
                    hfFirstIntDay.Value = FirstDay.ToString();

                    TimeSpan objSecondInt = Maturity - IPDate;
                    float SecondDay = (float)objSecondInt.TotalDays;
                    hfSecondIntDay.Value = SecondDay.ToString();
                    float day = FirstDay + SecondDay;
                    hfDayValue.Value = day.ToString();

                    DateTime compareTo = IPDate;
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
                    DataTable dt = dl.get_QuarterlyDate(Sattle, IPDate);
                    string Date = dt.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;


                    DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objFirstInt = IPDates - Sattle;
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
            if(hfPaymentType.Value == "Half Yearly")
            {
                if (IPDate > Sattle)
                {
                    TimeSpan objFirstInt = IPDate - Sattle;
                    float FirstDay = (float)objFirstInt.TotalDays;
                    hfFirstIntDay.Value = FirstDay.ToString();

                    TimeSpan objSecondInt = Maturity - IPDate;
                    float SecondDay = (float)objSecondInt.TotalDays;
                    hfSecondIntDay.Value = SecondDay.ToString();
                    float day = FirstDay + SecondDay;
                    hfDayValue.Value = day.ToString();

                    DateTime compareTo = IPDate;
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
                    DataTable dt = dl.get_HalfYearlyDate(Sattle, IPDate);
                    string Date = dt.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;


                    DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objFirstInt = IPDates - Sattle;
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
        if(hfPaymentType.Value == "Quarterly")
        {
            if (IPDate > Sattle)
            {
                TimeSpan objFirstInt = IPDate - Sattle;
                float FirstDay = (float)objFirstInt.TotalDays;
                hfFirstIntDay.Value = FirstDay.ToString();

                TimeSpan objSecondInt = Maturity - IPDate;
                float SecondDay = (float)objSecondInt.TotalDays;
                hfSecondIntDay.Value = SecondDay.ToString();
                float day = FirstDay + SecondDay;
                hfDayValue.Value = day.ToString();

                DateTime compareTo = IPDate;
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
                DataTable dt = dl.get_QuarterlyDate(Sattle, IPDate);
                string Date = dt.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;


                DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                TimeSpan objFirstInt = IPDates - Sattle;
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
        if(hfPaymentType.Value == "Half Yearly")
        {
            if (IPDate > Sattle)
            {
                TimeSpan objFirstInt = IPDate - Sattle;
                float FirstDay = (float)objFirstInt.TotalDays;
                hfFirstIntDay.Value = FirstDay.ToString();

                TimeSpan objSecondInt = Maturity - IPDate;
                float SecondDay = (float)objSecondInt.TotalDays;
                hfSecondIntDay.Value = SecondDay.ToString();
                float day = FirstDay + SecondDay;
                hfDayValue.Value = day.ToString();

                DateTime compareTo = IPDate;
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
                DataTable dt = dl.get_HalfYearlyDate(Sattle, IPDate);
                string Date = dt.Rows[0]["mth_start"].ToString();
                hfQuar.Value = Date;


                DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                TimeSpan objFirstInt = IPDates - Sattle;
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

    protected void txtFaceValueForDeal_TextChanged(object sender, EventArgs e)
    {
        float Rate = float.Parse(hfRatePrice.Value);
        float Deal = float.Parse(txtFaceValueForDeal.Text);
        float BondValue = float.Parse(hfFaceValueForBond.Value);
        txtPrincipalAmount.Text = Convert.ToString((Rate * Deal) / 100);
        float principal = float.Parse(txtPrincipalAmount.Text);
        float coupon = float.Parse(hfCouponRate.Value);
        float days = float.Parse(hfDayValue.Value);
        float dayFirstInt = float.Parse(hfFirstIntDay.Value);
        float daySecondInt = float.Parse(hfSecondIntDay.Value);
        txtAccuredInterest.Text = Convert.ToString((Deal*coupon*days)/36500);
        float interest = float.Parse(txtAccuredInterest.Text);
        hfOneDayInterest.Value = (interest / days).ToString();

        txtGrossConsideration.Text = Convert.ToString(((Rate * Deal) / 100) + ((Deal * coupon * days) / 36500));
        txtQuantity.Text = (Deal / BondValue).ToString();
        
        if(hfPaymentType.Value == "Monthly")
        {
            float month = float.Parse(hfMonth.Value);
            float FirstMonth = ((Deal * coupon * dayFirstInt) / 36500);
            hfFirstMonthly.Value = FirstMonth.ToString();

        }
        if(hfPaymentType.Value =="Yearly")
        {
            float Year = float.Parse(hfYearly.Value);
            float FirstYear = ((Deal * coupon * dayFirstInt) / 36500);
            hfFirstYearly.Value = FirstYear.ToString();
            float yearlyInterest = (((Deal * coupon * daySecondInt) / 36500) / Year);
            hfYearlyInterest.Value = yearlyInterest.ToString();
        }
        if(hfPaymentType.Value == "Quarterly")
        {
            float Querterly = float.Parse(hfQuerterly.Value);
            float FirstQuarterly = ((Deal * coupon * dayFirstInt) / 36500);
            hfFirstQuarterly.Value = FirstQuarterly.ToString();
            float QuertarlyInterest = (((Deal * coupon * daySecondInt) / 36500) / Querterly);
            hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
        }
        if(hfPaymentType.Value == "Half Yearly")
        {
            float halfYear = float.Parse(hfHalfYearly.Value);
            float FirstHalfY = ((Deal * coupon * dayFirstInt) / 36500);
            hfFirstHalf.Value = halfYear.ToString();
            float halfInterest = (((Deal * coupon * daySecondInt) / 36500) / halfYear);
            hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
        }

    }

    protected void lnkApprove_Click(object sender, EventArgs e)
    {
        LinkButton lnkApprove = (LinkButton)sender;
        if (dl.update_CashFlowChartDetails_Interest(lnkApprove.CommandArgument, GetUserLoggedIn()))
        {
            BindData();
        }
    }


}