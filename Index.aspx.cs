using DocumentFormat.OpenXml.Bibliography;
using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    DAL dl = new DAL();
    Random rnd = new Random();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            NewsData();
            BindVideo();
            CollectionBind();
            generateCaptcha();
        }
    }

    private void CollectionBind()
    {
        //rptCollection.DataSource = dl.get_Category(null, null);
        //rptCollection.DataBind();
    }
    private void BindVideo()
    {
        //DataTable dt = dl.get_VideoOne(null, null);
        //if (dt.Rows.Count > 0)
        //{
        //    rptVideo.DataSource = dt;
        //    rptVideo.DataBind();
        //}


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

    private void getYieldWithXIRR()
    {

    //    float rate = 0, couponrate = 0;
    //    DateTime d1 = DateTime.Now;
    //    DateTime d2 = DateTime.ParseExact(hfLastIPDateXIRR.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
    //    //DateTime d2 = Convert.ToDateTime(lblLastIP.Text);
    //    //DateTime d3 = Convert.ToDateTime(lblMaturity.Text);
    //    //DateTime d2 = DateTime.ParseExact(lblLastIP.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
    //    DateTime d3 = DateTime.ParseExact(lblMaturity.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);

    //    TimeSpan t = d1 - d2;
    //    double NrOfDays = t.TotalDays;
    //    TimeSpan t1 = d3 - d2;

    //    couponrate = float.Parse(lblCouponRates.Text);
    //    if (lblPrice.Text == "0" || lblPrice.Text == "")
    //    {
    //        lblPrice.Text = "100";
    //        rate = float.Parse(lblPrice.Text);
    //    }
    //    else
    //    {
    //        rate = float.Parse(lblPrice.Text);
    //    }

    //    var dateSpan = DateTimeSpan.CompareDates(d3, d2);
    //    var TotalYear = dateSpan.Years;
    //    var TotalMonth = dateSpan.Months;
    //    var TotalDay = dateSpan.Days;
    //    float Year = float.Parse(TotalYear.ToString());
    //    float Month = float.Parse(TotalMonth.ToString());
    //    float Day = float.Parse(TotalDay.ToString());

    //    float tday = float.Parse(NrOfDays.ToString("0"));
    //    float interest = ((100 * tday * couponrate) / 36500);

    //    float fa = -(rate + interest);
    //    List<double> cashFlowss = new List<double>();

    //    List<DateTime> dateList = new List<DateTime>();
    //    if (hfFrequencyType.Value == "Monthly")
    //    {
    //        var totalMonths = ((Year * 12) + Month);
    //        hfMonth.Value = totalMonths.ToString();

    //    }
    //    if (hfFrequencyType.Value == "Yearly")
    //    {
    //        string TYear = Year.ToString();
    //        hfYearly.Value = TYear.ToString();
    //    }
    //    if (hfFrequencyType.Value == "Quarterly")
    //    {
    //        var totalQuarter = (Year * 4);
    //        var totalmonth = (Month / 3);
    //        var totalQuarterly = Math.Truncate(totalQuarter + totalmonth);
    //        hfQuerterly.Value = totalQuarterly.ToString();
    //    }
    //    if (hfFrequencyType.Value == "Half Yearly")
    //    {
    //        var totalHalfYearl = (Year * 2);
    //        var mon = (Month / 6);
    //        var totalHalfYearly = Math.Truncate(totalHalfYearl + mon);
    //        var month = (Month - (mon * 2));
    //        hfHalfYearly.Value = totalHalfYearly.ToString();
    //    }
    //    string dates = d1.ToString("dd/MM/yyyy").Replace("-", "/");
    //    string[] splitedDates = dates.Split('/');
    //    //Save this in MonthDay field
    //    string monthDays = string.Join("/", splitedDates[1]);
    //    //Save this in Year field
    //    string datedayss = splitedDates[0];
    //    string years = splitedDates[2];
    //    int ys = Convert.ToInt32(years.ToString());
    //    int ms = Convert.ToInt32(monthDays.ToString());
    //    int ds = Convert.ToInt32(datedayss.ToString());
    //    cashFlowss.Add(fa);
    //    dateList.Add(new DateTime(ys, ms, ds));
    //    DateTime ldate = d2;
    //    int UnitCount = 0;
    //    if (hfMaturityType.Value == "Bullet")
    //    {
    //        if (hfFrequencyType.Value == "Monthly")
    //        {
    //            UnitCount = Convert.ToInt32(hfMonth.Value);
    //            for (int i = 1; i < UnitCount + 1; i++)
    //            {
    //                DateTime InsDate = d2.AddMonths(i);
    //                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                string[] splitedDate = date.Split('/');
    //                //Save this in MonthDay field
    //                string monthDay = string.Join("/", splitedDate[1]);
    //                //Save this in Year field
    //                string year = splitedDate[2];
    //                string day = splitedDate[0];
    //                int y = Convert.ToInt32(year.ToString());
    //                int m = Convert.ToInt32(monthDay.ToString());
    //                int d = Convert.ToInt32(day.ToString());
    //                // if (InsDate == d3)
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                //    cashFlowss.Add(100 + cop);

    //                //    dateList.Add(new DateTime(y, m, d));

    //                //}
    //                //else
    //                //{
    //                if (d3 > InsDate)
    //                {
    //                    if (i == 1)
    //                    {
    //                        //if (d3 > InsDate)
    //                        //{

    //                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));


    //                        TimeSpan tm = InsDate - d2;
    //                        double cd = tm.TotalDays;
    //                        double c = couponrate * (cd) / 365;
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));
    //                        // }

    //                        //}
    //                    }
    //                    else
    //                    {
    //                        //if (d3 > InsDate)
    //                        //{

    //                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));

    //                        TimeSpan tm = InsDate - ldate;
    //                        double cd = tm.TotalDays;
    //                        double c = couponrate * (cd) / 365;
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));
    //                        // }

    //                        // }
    //                    }
    //                    ldate = InsDate;
    //                }
    //                //else
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));

    //                //    TimeSpan tm = d3 - ldate;
    //                //    double cd = tm.TotalDays;
    //                //    double c = 100 + (couponrate * (cd) / 365);
    //                //    cashFlowss.Add(c);
    //                //    dateList.Add(new DateTime(y, m, d));
    //                //}
    //                // ldate = InsDate;
    //            }
    //            if (d3 > ldate || d3 == ldate)
    //            {
    //                string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                string[] splitedDate = date.Split('/');
    //                //Save this in MonthDay field
    //                string monthDay = string.Join("/", splitedDate[1]);
    //                //Save this in Year field
    //                string year = splitedDate[2];
    //                string day = splitedDate[0];
    //                int y = Convert.ToInt32(year.ToString());
    //                int m = Convert.ToInt32(monthDay.ToString());
    //                int d = Convert.ToInt32(day.ToString());
    //                double cop = Convert.ToDouble(couponrate.ToString("0.00"));

    //                TimeSpan tm = d3 - ldate;
    //                double cd = tm.TotalDays;
    //                double c = 100 + (couponrate * (cd) / 365);
    //                cashFlowss.Add(c);
    //                dateList.Add(new DateTime(y, m, d));
    //            }

    //            //if(ldate == d3)
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));

    //            //    float cop = 100 + (couponrate);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //            //else
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate * nday / 365)+ couponrate;
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //        }
    //        if (hfFrequencyType.Value == "Yearly")
    //        {
    //            UnitCount = Convert.ToInt32(hfYearly.Value);
    //            for (int i = 1; i < UnitCount + 1; i++)
    //            {
    //                DateTime InsDate = d2.AddMonths(i * 12);
    //                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                string[] splitedDate = date.Split('/');
    //                //Save this in MonthDay field
    //                string monthDay = string.Join("/", splitedDate[1]);
    //                //Save this in Year field
    //                string year = splitedDate[2];
    //                string day = splitedDate[0];
    //                int y = Convert.ToInt32(year.ToString());
    //                int m = Convert.ToInt32(monthDay.ToString());
    //                int d = Convert.ToInt32(day.ToString());
    //                //if (InsDate == d3)
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                //    cashFlowss.Add(100 + cop);

    //                //    dateList.Add(new DateTime(y, m, d));

    //                //}
    //                //else
    //                //{
    //                if (d3 > InsDate)
    //                {
    //                    if (i == 1)
    //                    {

    //                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        TimeSpan tm = InsDate - d2;
    //                        double cd = tm.TotalDays;
    //                        double c = couponrate * (cd) / 365;
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));


    //                    }
    //                    else
    //                    {

    //                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        TimeSpan tm = InsDate - ldate;
    //                        double cd = tm.TotalDays;
    //                        double c = couponrate * (cd) / 365;
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));

    //                    }

    //                    ldate = InsDate;
    //                }
    //                //else
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                //    TimeSpan tm = d3 - ldate;
    //                //    double cd = tm.TotalDays;
    //                //    double c = 100 + (couponrate * (cd) / 365);
    //                //    cashFlowss.Add(c);
    //                //    dateList.Add(new DateTime(y, m, d));
    //                //}

    //            }
    //            if (d3 > ldate || d3 == ldate)
    //            {
    //                string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                string[] splitedDate = date.Split('/');
    //                //Save this in MonthDay field
    //                string monthDay = string.Join("/", splitedDate[1]);
    //                //Save this in Year field
    //                string year = splitedDate[2];
    //                string day = splitedDate[0];
    //                int y = Convert.ToInt32(year.ToString());
    //                int m = Convert.ToInt32(monthDay.ToString());
    //                int d = Convert.ToInt32(day.ToString());
    //                TimeSpan tm = d3 - ldate;
    //                double cd = tm.TotalDays;
    //                double c = 100 + (couponrate * (cd) / 365);
    //                cashFlowss.Add(c);
    //                dateList.Add(new DateTime(y, m, d));
    //            }

    //            //if (ldate == d3)
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + couponrate;
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //            //else
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //        }
    //        if (hfFrequencyType.Value == "Quarterly")
    //        {
    //            UnitCount = Convert.ToInt32(hfQuerterly.Value);
    //            for (int i = 1; i < UnitCount + 1; i++)
    //            {
    //                DateTime InsDate = d2.AddMonths(i * 3);
    //                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                string[] splitedDate = date.Split('/');
    //                //Save this in MonthDay field
    //                string monthDay = string.Join("/", splitedDate[1]);
    //                //Save this in Year field
    //                string year = splitedDate[2];
    //                string day = splitedDate[0];
    //                int y = Convert.ToInt32(year.ToString());
    //                int m = Convert.ToInt32(monthDay.ToString());
    //                int d = Convert.ToInt32(day.ToString());
    //                //if (InsDate == d3)
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                //    cashFlowss.Add(100 + cop);

    //                //    dateList.Add(new DateTime(y, m, d));

    //                //}
    //                //else
    //                //{
    //                if (d3 > InsDate)
    //                {
    //                    if (i == 1)
    //                    {
    //                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        TimeSpan tm = InsDate - d2;
    //                        double cd = tm.TotalDays;
    //                        double c = couponrate * (cd) / 365;
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));
    //                    }
    //                    else
    //                    {
    //                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        TimeSpan tm = InsDate - ldate;
    //                        double cd = tm.TotalDays;
    //                        double c = couponrate * (cd) / 365;
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));
    //                    }
    //                    ldate = InsDate;
    //                }
    //                //else
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                //    TimeSpan tm = d3 - ldate;
    //                //    double cd = tm.TotalDays;
    //                //    double c = 100 + (couponrate * (cd) / 365);
    //                //    cashFlowss.Add(c);
    //                //    dateList.Add(new DateTime(y, m, d));
    //                //}


    //                //}
    //            }
    //            if (d3 > ldate || d3 == ldate)
    //            {
    //                string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                string[] splitedDate = date.Split('/');
    //                //Save this in MonthDay field
    //                string monthDay = string.Join("/", splitedDate[1]);
    //                //Save this in Year field
    //                string year = splitedDate[2];
    //                string day = splitedDate[0];
    //                int y = Convert.ToInt32(year.ToString());
    //                int m = Convert.ToInt32(monthDay.ToString());
    //                int d = Convert.ToInt32(day.ToString());
    //                TimeSpan tm = d3 - ldate;
    //                double cd = tm.TotalDays;
    //                double c = 100 + (couponrate * (cd) / 365);
    //                cashFlowss.Add(c);
    //                dateList.Add(new DateTime(y, m, d));
    //            }
    //            //if (ldate == d3)
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate/3);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //            //else
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //        }
    //        if (hfFrequencyType.Value == "Half Yearly")
    //        {
    //            UnitCount = Convert.ToInt32(hfHalfYearly.Value);
    //            for (int i = 1; i < UnitCount + 1; i++)
    //            {
    //                DateTime InsDate = d2.AddMonths(i * 6);
    //                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                string[] splitedDate = date.Split('/');
    //                //Save this in MonthDay field
    //                string monthDay = string.Join("/", splitedDate[1]);
    //                //Save this in Year field
    //                string year = splitedDate[2];
    //                string day = splitedDate[0];
    //                int y = Convert.ToInt32(year.ToString());
    //                int m = Convert.ToInt32(monthDay.ToString());
    //                int d = Convert.ToInt32(day.ToString());
    //                //if (InsDate == d3)
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                //    cashFlowss.Add(100 + cop);

    //                //    dateList.Add(new DateTime(y, m, d));

    //                //}
    //                //else
    //                //{
    //                if (d3 > InsDate)
    //                {

    //                    if (i == 1)
    //                    {
    //                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        TimeSpan tm = InsDate - d2;
    //                        double cd = tm.TotalDays;
    //                        double c = couponrate * (cd) / 365;
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));
    //                    }
    //                    else
    //                    {
    //                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        TimeSpan tm = InsDate - ldate;
    //                        double cd = tm.TotalDays;
    //                        double c = couponrate * (cd) / 365;
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));
    //                    }
    //                    ldate = InsDate;
    //                }
    //                //else
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                //    TimeSpan tm = d3 - ldate;
    //                //    double cd = tm.TotalDays;
    //                //    double c = 100 + (couponrate * (cd) / 365);
    //                //    cashFlowss.Add(c);
    //                //    dateList.Add(new DateTime(y, m, d));
    //                //}


    //                // }
    //            }
    //            if (d3 > ldate || d3 == ldate)
    //            {
    //                string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                string[] splitedDate = date.Split('/');
    //                //Save this in MonthDay field
    //                string monthDay = string.Join("/", splitedDate[1]);
    //                //Save this in Year field
    //                string year = splitedDate[2];
    //                string day = splitedDate[0];
    //                int y = Convert.ToInt32(year.ToString());
    //                int m = Convert.ToInt32(monthDay.ToString());
    //                int d = Convert.ToInt32(day.ToString());
    //                TimeSpan tm = d3 - ldate;
    //                double cd = tm.TotalDays;
    //                double c = 100 + (couponrate * (cd) / 365);
    //                cashFlowss.Add(c);
    //                dateList.Add(new DateTime(y, m, d));
    //            }
    //            //if (ldate == d3)
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate/2);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //            //else
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //        }






    //        //for (int i = 1; i < UnitCount + 1; i++)
    //        //{
    //        //    DateTime InsDate = d2.AddMonths(i);
    //        //    string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //        //    string[] splitedDate = date.Split('/');
    //        //    //Save this in MonthDay field
    //        //    string monthDay = string.Join("/",splitedDate[1]);
    //        //    //Save this in Year field
    //        //    string year = splitedDate[2];
    //        //    string day = splitedDate[0];
    //        //    int y = Convert.ToInt32(year.ToString());
    //        //    int m = Convert.ToInt32(monthDay.ToString());
    //        //    int d = Convert.ToInt32(day.ToString());
    //        //    if (InsDate == d3)
    //        //    {
    //        //        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //        //        cashFlowss.Add(100 + cop);

    //        //        dateList.Add(new DateTime(y, m, d));

    //        //    }
    //        //    else
    //        //    {
    //        //        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //        //        cashFlowss.Add(cop);
    //        //        dateList.Add(new DateTime(y, m, d));
    //        //    }
    //        //}

    //    }

    //    if (hfMaturityType.Value == "Staggered")
    //    {
    //        if (hfFrequencyType.Value == "Monthly")
    //        {
    //            float ratevalue = 100, tpercent = 0;
    //            UnitCount = Convert.ToInt32(hfMonth.Value);
    //            for (int i = 1; i < UnitCount + 1; i++)
    //            {
    //                DateTime InsDate = d2.AddMonths(i);
    //                DataTable dt = dl.CheckMaturityTypeValue(Request.QueryString["oId"].ToString(), InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string Percentage = dt.Rows[0]["MaturityTypePercentage"].ToString();
    //                    if (Percentage != null || Percentage != "")
    //                    {
    //                        float percent = float.Parse(Percentage.ToString());


    //                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        // if (InsDate == d3)
    //                        //{
    //                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        //    cashFlowss.Add(100 + cop);

    //                        //    dateList.Add(new DateTime(y, m, d));

    //                        //}
    //                        //else
    //                        //{

    //                        if (d3 > InsDate)
    //                        {
    //                            if (i == 1)
    //                            {
    //                                //if (d3 > InsDate)
    //                                //{

    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));


    //                                TimeSpan tm = InsDate - d2;
    //                                double cd = tm.TotalDays;
    //                                double c = percent + (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                                // }

    //                                //}
    //                            }
    //                            else
    //                            {
    //                                //if (d3 > InsDate)
    //                                //{

    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));

    //                                TimeSpan tm = InsDate - ldate;
    //                                double cd = tm.TotalDays;
    //                                double c = percent + (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                                // }

    //                                // }
    //                            }
    //                        }
    //                        ldate = InsDate;
    //                        tpercent = tpercent + percent;
    //                        ratevalue = ratevalue - percent;
    //                    }
    //                    else
    //                    {
    //                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        // if (InsDate == d3)
    //                        //{
    //                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        //    cashFlowss.Add(100 + cop);

    //                        //    dateList.Add(new DateTime(y, m, d));

    //                        //}
    //                        //else
    //                        //{

    //                        if (d3 > InsDate)
    //                        {
    //                            if (i == 1)
    //                            {
    //                                //if (d3 > InsDate)
    //                                //{

    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));


    //                                TimeSpan tm = InsDate - d2;
    //                                double cd = tm.TotalDays;
    //                                double c = (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                                // }

    //                                //}
    //                            }
    //                            else
    //                            {
    //                                //if (d3 > InsDate)
    //                                //{

    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));

    //                                TimeSpan tm = InsDate - ldate;
    //                                double cd = tm.TotalDays;
    //                                double c = (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                                // }

    //                                // }
    //                            }
    //                        }
    //                        ldate = InsDate;
    //                    }
    //                }
    //                else
    //                {
    //                    string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    // if (InsDate == d3)
    //                    //{
    //                    //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                    //    cashFlowss.Add(100 + cop);

    //                    //    dateList.Add(new DateTime(y, m, d));

    //                    //}
    //                    //else
    //                    //{
    //                    if (d3 > InsDate)
    //                    {
    //                        if (i == 1)
    //                        {
    //                            //if (d3 > InsDate)
    //                            //{

    //                            double cop = Convert.ToDouble(couponrate.ToString("0.00"));


    //                            TimeSpan tm = InsDate - d2;
    //                            double cd = tm.TotalDays;
    //                            double c = ratevalue * couponrate * (cd) / 36500;
    //                            cashFlowss.Add(c);
    //                            dateList.Add(new DateTime(y, m, d));
    //                            // }

    //                            //}
    //                        }
    //                        else
    //                        {
    //                            //if (d3 > InsDate)
    //                            //{

    //                            double cop = Convert.ToDouble(couponrate.ToString("0.00"));

    //                            TimeSpan tm = InsDate - ldate;
    //                            double cd = tm.TotalDays;
    //                            double c = ratevalue * couponrate * (cd) / 36500;
    //                            cashFlowss.Add(c);
    //                            dateList.Add(new DateTime(y, m, d));
    //                            // }

    //                            // }
    //                        }
    //                    }
    //                    ldate = InsDate;
    //                }
    //                //else
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));

    //                //    TimeSpan tm = d3 - ldate;
    //                //    double cd = tm.TotalDays;
    //                //    double c = 100 + (couponrate * (cd) / 365);
    //                //    cashFlowss.Add(c);
    //                //    dateList.Add(new DateTime(y, m, d));
    //                //}
    //                // ldate = InsDate;
    //            }
    //            if (d3 > ldate || d3 == ldate)
    //            {
    //                DataTable dt = dl.CheckMaturityTypeValue(Request.QueryString["oId"].ToString(), ldate.ToString("dd/MM/yyyy").Replace("-", "/"));
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string percent = dt.Rows[0]["MaturityTypePercentage"].ToString();
    //                    float perc = float.Parse(percent);
    //                    float tpc = 100 - tpercent;
    //                    tpercent = tpercent + perc;
    //                    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    double cop = Convert.ToDouble(couponrate.ToString("0.00"));


    //                    TimeSpan tm = d3 - ldate;
    //                    double cd = tm.TotalDays;
    //                    double c = tpc + ratevalue * (couponrate * (cd) / 36500);
    //                    cashFlowss.Add(c);
    //                    dateList.Add(new DateTime(y, m, d));
    //                    ratevalue = ratevalue - tpc;
    //                }
    //                else
    //                {
    //                    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    double cop = Convert.ToDouble(couponrate.ToString("0.00"));

    //                    TimeSpan tm = d3 - ldate;
    //                    double cd = tm.TotalDays;
    //                    double c = ratevalue * (couponrate * (cd) / 36500);
    //                    cashFlowss.Add(c);
    //                    dateList.Add(new DateTime(y, m, d));
    //                }

    //            }

    //            //if(ldate == d3)
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));

    //            //    float cop = 100 + (couponrate);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //            //else
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate * nday / 365)+ couponrate;
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //        }
    //        if (hfFrequencyType.Value == "Yearly")
    //        {
    //            float ratevalue = 100, tpercent = 0;
    //            UnitCount = Convert.ToInt32(hfYearly.Value);
    //            for (int i = 1; i < UnitCount + 1; i++)
    //            {
    //                DateTime InsDate = d2.AddMonths(i * 12);
    //                DataTable dt = dl.CheckMaturityTypeValue(Request.QueryString["oId"].ToString(), InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string Percent = dt.Rows[0]["MaturityTypePercentage"].ToString();
    //                    if (Percent != null || Percent != "")
    //                    {
    //                        float perct = float.Parse(Percent);

    //                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        //if (InsDate == d3)
    //                        //{
    //                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        //    cashFlowss.Add(100 + cop);

    //                        //    dateList.Add(new DateTime(y, m, d));

    //                        //}
    //                        //else
    //                        //{
    //                        if (d3 > InsDate)
    //                        {
    //                            if (i == 1)
    //                            {

    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - d2;
    //                                double cd = tm.TotalDays;
    //                                double c = perct + (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));


    //                            }
    //                            else
    //                            {

    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - ldate;
    //                                double cd = tm.TotalDays;
    //                                double c = perct + (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));

    //                            }

    //                            ldate = InsDate;
    //                            ratevalue = ratevalue - perct;
    //                            tpercent = tpercent + perct;
    //                        }
    //                    }
    //                    else
    //                    {
    //                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        //if (InsDate == d3)
    //                        //{
    //                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        //    cashFlowss.Add(100 + cop);

    //                        //    dateList.Add(new DateTime(y, m, d));

    //                        //}
    //                        //else
    //                        //{
    //                        if (d3 > InsDate)
    //                        {
    //                            if (i == 1)
    //                            {

    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - d2;
    //                                double cd = tm.TotalDays;
    //                                double c = (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));


    //                            }
    //                            else
    //                            {

    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - ldate;
    //                                double cd = tm.TotalDays;
    //                                double c = (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));

    //                            }

    //                            ldate = InsDate;
    //                        }
    //                    }
    //                }
    //                else
    //                {
    //                    string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    //if (InsDate == d3)
    //                    //{
    //                    //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                    //    cashFlowss.Add(100 + cop);

    //                    //    dateList.Add(new DateTime(y, m, d));

    //                    //}
    //                    //else
    //                    //{
    //                    if (d3 > InsDate)
    //                    {
    //                        if (i == 1)
    //                        {

    //                            double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                            TimeSpan tm = InsDate - d2;
    //                            double cd = tm.TotalDays;
    //                            double c = (ratevalue * couponrate * (cd) / 36500);
    //                            cashFlowss.Add(c);
    //                            dateList.Add(new DateTime(y, m, d));


    //                        }
    //                        else
    //                        {

    //                            double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                            TimeSpan tm = InsDate - ldate;
    //                            double cd = tm.TotalDays;
    //                            double c = (ratevalue * couponrate * (cd) / 36500);
    //                            cashFlowss.Add(c);
    //                            dateList.Add(new DateTime(y, m, d));

    //                        }

    //                        ldate = InsDate;
    //                    }
    //                    //else
    //                    //{
    //                    //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                    //    TimeSpan tm = d3 - ldate;
    //                    //    double cd = tm.TotalDays;
    //                    //    double c = 100 + (couponrate * (cd) / 365);
    //                    //    cashFlowss.Add(c);
    //                    //    dateList.Add(new DateTime(y, m, d));
    //                    //}

    //                }
    //            }
    //            if (d3 > ldate || d3 == ldate)
    //            {
    //                DataTable dt = dl.CheckMaturityTypeValue(Request.QueryString["oId"].ToString(), ldate.ToString("dd/MM/yyyy").Replace("-", "/"));
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string per = dt.Rows[0]["MaturityTypePercentage"].ToString();
    //                    float pert = float.Parse(per);
    //                    float tp = 100 - tpercent;
    //                    tpercent = tpercent + pert;

    //                    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    TimeSpan tm = d3 - ldate;
    //                    double cd = tm.TotalDays;
    //                    double c = tp + (ratevalue * couponrate * (cd) / 36500);
    //                    cashFlowss.Add(c);
    //                    dateList.Add(new DateTime(y, m, d));
    //                    ratevalue = ratevalue - tp;
    //                }
    //                else
    //                {
    //                    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    TimeSpan tm = d3 - ldate;
    //                    double cd = tm.TotalDays;
    //                    double c = (ratevalue * couponrate * (cd) / 36500);
    //                    cashFlowss.Add(c);
    //                    dateList.Add(new DateTime(y, m, d));
    //                }
    //            }


    //            //if (ldate == d3)
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + couponrate;
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //            //else
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //        }
    //        if (hfFrequencyType.Value == "Quarterly")
    //        {
    //            float ratevalue = 100, tpercent = 0;
    //            UnitCount = Convert.ToInt32(hfQuerterly.Value);
    //            for (int i = 1; i < UnitCount + 1; i++)
    //            {
    //                DateTime InsDate = d2.AddMonths(i * 3);
    //                DataTable dt = dl.CheckMaturityTypeValue(Request.QueryString["oId"].ToString(), InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string perc = dt.Rows[0]["MaturityTypePercentage"].ToString();
    //                    if (perc != null || perc != "")
    //                    {
    //                        float pert = float.Parse(perc);
    //                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        //if (InsDate == d3)
    //                        //{
    //                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        //    cashFlowss.Add(100 + cop);

    //                        //    dateList.Add(new DateTime(y, m, d));

    //                        //}
    //                        //else
    //                        //{
    //                        if (d3 > InsDate)
    //                        {
    //                            if (i == 1)
    //                            {
    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - d2;
    //                                double cd = tm.TotalDays;
    //                                double c = pert + (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                            }
    //                            else
    //                            {
    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - ldate;
    //                                double cd = tm.TotalDays;
    //                                double c = pert + (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                            }
    //                            ldate = InsDate;
    //                            ratevalue = ratevalue - pert;
    //                            tpercent = tpercent + pert;
    //                        }
    //                    }
    //                    else
    //                    {
    //                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        //if (InsDate == d3)
    //                        //{
    //                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        //    cashFlowss.Add(100 + cop);

    //                        //    dateList.Add(new DateTime(y, m, d));

    //                        //}
    //                        //else
    //                        //{
    //                        if (d3 > InsDate)
    //                        {
    //                            if (i == 1)
    //                            {
    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - d2;
    //                                double cd = tm.TotalDays;
    //                                double c = (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                            }
    //                            else
    //                            {
    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - ldate;
    //                                double cd = tm.TotalDays;
    //                                double c = (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                            }
    //                            ldate = InsDate;

    //                        }
    //                    }
    //                }
    //                else
    //                {

    //                    string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    //if (InsDate == d3)
    //                    //{
    //                    //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                    //    cashFlowss.Add(100 + cop);

    //                    //    dateList.Add(new DateTime(y, m, d));

    //                    //}
    //                    //else
    //                    //{
    //                    if (d3 > InsDate)
    //                    {
    //                        if (i == 1)
    //                        {
    //                            double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                            TimeSpan tm = InsDate - d2;
    //                            double cd = tm.TotalDays;
    //                            double c = ratevalue * couponrate * (cd) / 36500;
    //                            cashFlowss.Add(c);
    //                            dateList.Add(new DateTime(y, m, d));
    //                        }
    //                        else
    //                        {
    //                            double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                            TimeSpan tm = InsDate - ldate;
    //                            double cd = tm.TotalDays;
    //                            double c = ratevalue * couponrate * (cd) / 36500;
    //                            cashFlowss.Add(c);
    //                            dateList.Add(new DateTime(y, m, d));
    //                        }
    //                        ldate = InsDate;
    //                    }
    //                }
    //                //else
    //                //{
    //                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                //    TimeSpan tm = d3 - ldate;
    //                //    double cd = tm.TotalDays;
    //                //    double c = 100 + (couponrate * (cd) / 365);
    //                //    cashFlowss.Add(c);
    //                //    dateList.Add(new DateTime(y, m, d));
    //                //}


    //                //}
    //            }
    //            if (d3 > ldate || d3 == ldate)
    //            {
    //                DataTable dt = dl.CheckMaturityTypeValue(Request.QueryString["oId"].ToString(), ldate.ToString("dd/MM/yyyy").Replace("-", "/"));
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string pert = dt.Rows[0]["MaturityTypePercentage"].ToString();
    //                    float perc = float.Parse(pert);
    //                    float tp = 100 - tpercent;
    //                    tpercent = tpercent + perc;

    //                    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    TimeSpan tm = d3 - ldate;
    //                    double cd = tm.TotalDays;
    //                    double c = tp + (ratevalue * couponrate * (cd) / 36500);
    //                    cashFlowss.Add(c);
    //                    dateList.Add(new DateTime(y, m, d));
    //                }
    //                else
    //                {
    //                    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    TimeSpan tm = d3 - ldate;
    //                    double cd = tm.TotalDays;
    //                    double c = ratevalue * couponrate * (cd) / 36500;
    //                    cashFlowss.Add(c);
    //                    dateList.Add(new DateTime(y, m, d));
    //                }
    //            }
    //            //if (ldate == d3)
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate/3);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //            //else
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //        }
    //        if (hfFrequencyType.Value == "Half Yearly")
    //        {
    //            float ratevalue = 100, tpercent = 0;
    //            UnitCount = Convert.ToInt32(hfHalfYearly.Value);
    //            for (int i = 1; i < UnitCount + 1; i++)
    //            {
    //                DateTime InsDate = d2.AddMonths(i * 6);
    //                DataTable dt = dl.CheckMaturityTypeValue(Request.QueryString["oId"].ToString(), InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string percent = dt.Rows[0]["MaturityTypePercentage"].ToString();
    //                    if (percent != "")
    //                    {
    //                        float perct = float.Parse(percent);
    //                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        //if (InsDate == d3)
    //                        //{
    //                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                        //    cashFlowss.Add(100 + cop);

    //                        //    dateList.Add(new DateTime(y, m, d));

    //                        //}
    //                        //else
    //                        //{
    //                        if (d3 > InsDate)
    //                        {

    //                            if (i == 1)
    //                            {
    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - d2;
    //                                double cd = tm.TotalDays;
    //                                double c = perct + (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                            }
    //                            else
    //                            {
    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - ldate;
    //                                double cd = tm.TotalDays;
    //                                double c = perct + (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                            }
    //                            ldate = InsDate;
    //                            ratevalue = ratevalue - perct;
    //                            tpercent = tpercent + perct;
    //                        }
    //                    }
    //                    else
    //                    {
    //                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        if (d3 > InsDate)
    //                        {
    //                            if (i == 1)
    //                            {
    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - d2;
    //                                double cd = tm.TotalDays;
    //                                double c = (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                            }
    //                            else
    //                            {
    //                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                                TimeSpan tm = InsDate - ldate;
    //                                double cd = tm.TotalDays;
    //                                double c = (ratevalue * couponrate * (cd) / 36500);
    //                                cashFlowss.Add(c);
    //                                dateList.Add(new DateTime(y, m, d));
    //                            }
    //                            ldate = InsDate;
    //                        }
    //                    }
    //                    //else
    //                    //{
    //                    //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
    //                    //    TimeSpan tm = d3 - ldate;
    //                    //    double cd = tm.TotalDays;
    //                    //    double c = 100 + (couponrate * (cd) / 365);
    //                    //    cashFlowss.Add(c);
    //                    //    dateList.Add(new DateTime(y, m, d));
    //                    //}


    //                    // }
    //                }
    //            }
    //            if (d3 > ldate || d3 == ldate)
    //            {
    //                DataTable dt = dl.CheckMaturityTypeValue(Request.QueryString["oId"].ToString(), ldate.ToString("dd/MM/yyyy").Replace("-", "/"));
    //                if (dt.Rows.Count > 0)
    //                {
    //                    string perc = dt.Rows[0]["MaturityTypePercentage"].ToString();
    //                    if (perc != "")
    //                    {
    //                        float per = float.Parse(perc);
    //                        float tp = 100 - tpercent;
    //                        string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        TimeSpan tm = d3 - ldate;
    //                        double cd = tm.TotalDays;
    //                        double c = tp + (ratevalue * couponrate * (cd) / 36500);
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));
    //                    }
    //                    else
    //                    {
    //                        float tp = 100 - tpercent;
    //                        string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                        string[] splitedDate = date.Split('/');
    //                        //Save this in MonthDay field
    //                        string monthDay = string.Join("/", splitedDate[1]);
    //                        //Save this in Year field
    //                        string year = splitedDate[2];
    //                        string day = splitedDate[0];
    //                        int y = Convert.ToInt32(year.ToString());
    //                        int m = Convert.ToInt32(monthDay.ToString());
    //                        int d = Convert.ToInt32(day.ToString());
    //                        TimeSpan tm = d3 - ldate;
    //                        double cd = tm.TotalDays;
    //                        double c = tp + (ratevalue * couponrate * (cd) / 36500);
    //                        cashFlowss.Add(c);
    //                        dateList.Add(new DateTime(y, m, d));
    //                    }
    //                }
    //                else
    //                {
    //                    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //                    string[] splitedDate = date.Split('/');
    //                    //Save this in MonthDay field
    //                    string monthDay = string.Join("/", splitedDate[1]);
    //                    //Save this in Year field
    //                    string year = splitedDate[2];
    //                    string day = splitedDate[0];
    //                    int y = Convert.ToInt32(year.ToString());
    //                    int m = Convert.ToInt32(monthDay.ToString());
    //                    int d = Convert.ToInt32(day.ToString());
    //                    TimeSpan tm = d3 - ldate;
    //                    double cd = tm.TotalDays;
    //                    double c = (ratevalue * couponrate * (cd) / 36500);
    //                    cashFlowss.Add(c);
    //                    dateList.Add(new DateTime(y, m, d));
    //                }
    //            }

    //            //if (ldate == d3)
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate/2);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //            //else
    //            //{
    //            //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
    //            //    string[] splitedDate = date.Split('/');
    //            //    //Save this in MonthDay field
    //            //    string monthDay = string.Join("/", splitedDate[1]);
    //            //    //Save this in Year field
    //            //    string year = splitedDate[2];
    //            //    string day = splitedDate[0];
    //            //    int y = Convert.ToInt32(year.ToString());
    //            //    int m = Convert.ToInt32(monthDay.ToString());
    //            //    int d = Convert.ToInt32(day.ToString());
    //            //    TimeSpan tt = d3 - ldate;
    //            //    double noday = tt.TotalDays;
    //            //    float nday = float.Parse(noday.ToString("0"));
    //            //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
    //            //    cashFlowss.Add(cop);
    //            //    dateList.Add(new DateTime(y, m, d));
    //            //}
    //        }
    //    }

    //    double[] cashflows = cashFlowss.ToArray();
    //    DateTime[] datess = dateList.ToArray();

    //    // Calculate XIRR
    //    double xirr = CalculateXIRR(cashflows, datess);
    //    float xr = float.Parse(xirr.ToString("0.0000"));
    //    float xir = (xr * 100);
    //    hfYieldValue.Value = xir.ToString();
    //    //  Response.Write(xir);
    //    // lblXIRR.Text = xir.ToString("0.00");

    }

    private void BindData()
    {

        DataTable dt = dl.get_ProductsTops(null, null, null, true);
        if (dt.Rows.Count > 0)
        {

            string Frequency = dt.Rows[0]["PaymentTypeHead"].ToString();
            hfFrequencyType.Value = Frequency;
            string Maturity = dt.Rows[0]["MaturityType"].ToString();
            hfMaturityType.Value = Maturity;

        }
        rptData.DataSource = dt;
        rptData.DataBind();
        

    }
    private void NewsData()
    {
        rptNews.DataSource = dl.get_BlogNewsTop(null, null, null);
        rptNews.DataBind();
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
            Label lblredemption = (e.Item.FindControl("lblredemption") as Label);
            Label lblMaturityDate = (e.Item.FindControl("lblMaturityDate") as Label);
            Label lblCouponrate = (e.Item.FindControl("lblCouponrate") as Label);
            Label lblm = (e.Item.FindControl("lblm") as Label);
            Label lblYTM = (e.Item.FindControl("lblYTM") as Label);
            //Label lblIP = (e.Item.FindControl("lblIP") as Label);
            //hfIPDateaaa.Value = lblIP.Text;
            Label hfPayment = (e.Item.FindControl("hfPayment") as Label);
            Panel pnlYield = (e.Item.FindControl("pnlYield") as Panel);
            HiddenField lblIP = (e.Item.FindControl("lblIP") as HiddenField);
            HiddenField hfPrice = (e.Item.FindControl("hfPrice") as HiddenField);
            Panel pnlYieldView = (e.Item.FindControl("pnlYieldView") as Panel);
            string ProductsId = (e.Item.FindControl("hfProducts") as HiddenField).Value;
            Repeater rptCredit = e.Item.FindControl("rptCredit") as Repeater;
            rptCredit.DataSource = dl.get_CreditRatingTags(null, ProductsId, null, null);
            rptCredit.DataBind();
            HiddenField hfProductName = (e.Item.FindControl("HfProductName") as HiddenField);
            HiddenField hfCategory = (e.Item.FindControl("hfCategory") as HiddenField);
            HiddenField hfProductId = (e.Item.FindControl("hfProductId") as HiddenField);
            Repeater rptproductimg = e.Item.FindControl("rptproductimg") as Repeater;
            rptproductimg.DataSource = dl.get_HProductImage(null,hfProductName.Value,hfCategory.Value,null);
            rptproductimg.DataBind();
            DataTable dtk = dl.get_Products(ProductsId, null, null, null);
            hfPayment.Text = dtk.Rows[0]["PaymentTypeHead"].ToString();
            lblm.Text = dtk.Rows[0]["MaturityType"].ToString();
            DataTable dtn = dl.CheckLastDayOFMonth(ProductsId);

            hfEOM.Text = dtn.Rows[0]["EOM"].ToString();
            if(lblm.Text == "Bullet")
            {
                lblredemption.Text = "Bullet Redemption";
            }
            if(lblm.Text == "Staggered")
            {
                lblredemption.Text = "Partial Redemption";
            }
            if(lblm.Text == "Cumulative")
            {
                lblredemption.Text = "Cumulative Redemption";
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
                    hfLastIPDateXIRR.Value = Date;
                }
                if (hfPayment.Text == "Yearly")
                {
                    DataTable dtc = dl.get_YearlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddYears(-1);
                    txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    hfLastIPDateXIRR.Value = IP.ToString("dd/MM/yyyy").Replace("-", "/");
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
                    hfLastIPDateXIRR.Value = Datees;
                }
                if (hfPayment.Text == "Half Yearly")
                {
                    DataTable dtc = dl.get_HalfYearlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DataTable dtm = dl.get_LastDateHalfYearly(Datee);
                    string Datees = dtm.Rows[0]["get_LastDateHalfYearly"].ToString();

                    txtLastIP.Text = Datees;
                    hfLastIPDateXIRR.Value = Datees;
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
                    hfLastIPDateXIRR.Value = IP.ToString("dd/MM/yyyy").Replace("-", "/");

                }
                if (hfPayment.Text == "Yearly")
                {
                    DataTable dtc = dl.get_YearlyDatess(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddYears(-1);
                    txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    hfLastIPDateXIRR.Value = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                }
                if (hfPayment.Text == "Quarterly")
                {
                    DataTable dtc = dl.get_QuarterlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddMonths(-3);
                    txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    hfLastIPDateXIRR.Value = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                }
                if (hfPayment.Text == "Half Yearly")
                {
                    DataTable dtc = dl.get_HalfYearlyDate(Sattles, IPDat);
                    string Date = dtc.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                    DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime IP = Datee.AddMonths(-6);
                    txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    hfLastIPDateXIRR.Value = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                }
            }

            float rate = 0, couponrate = 0;
            DateTime d1 = DateTime.Now;
            DateTime d2 = DateTime.ParseExact(hfLastIPDateXIRR.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            //DateTime d2 = Convert.ToDateTime(lblLastIP.Text);
            //DateTime d3 = Convert.ToDateTime(lblMaturity.Text);
            //DateTime d2 = DateTime.ParseExact(lblLastIP.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime d3 = DateTime.ParseExact(lblMaturityDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);

            TimeSpan t = d1 - d2;
            double NrOfDays = t.TotalDays;
            TimeSpan t1 = d3 - d2;

            couponrate = float.Parse(lblCouponrate.Text);
            if (hfPrice.Value == "0" || hfPrice.Value == "")
            {
                hfPrice.Value = "100";
                rate = float.Parse(hfPrice.Value);
            }
            else
            {
                rate = float.Parse(hfPrice.Value);
            }

            var dateSpan = DateTimeSpan.CompareDates(d3, d2);
            var TotalYear = dateSpan.Years;
            var TotalMonth = dateSpan.Months;
            var TotalDay = dateSpan.Days;
            float Year = float.Parse(TotalYear.ToString());
            float Month = float.Parse(TotalMonth.ToString());
            float Day = float.Parse(TotalDay.ToString());

            float tday = float.Parse(NrOfDays.ToString("0"));
            float interest = ((100 * tday * couponrate) / 36500);

            float fa = -(rate + interest);
            List<double> cashFlowss = new List<double>();

            List<DateTime> dateList = new List<DateTime>();
            if (hfPayment.Text == "Monthly")
            {
                var totalMonths = ((Year * 12) + Month);
                hfMonth.Value = totalMonths.ToString();

            }
            if (hfPayment.Text == "Yearly")
            {
                string TYear = Year.ToString();
                hfYearly.Value = TYear.ToString();
            }
            if (hfPayment.Text == "Quarterly")
            {
                var totalQuarter = (Year * 4);
                var totalmonth = (Month / 3);
                var totalQuarterly = Math.Truncate(totalQuarter + totalmonth);
                hfQuerterly.Value = totalQuarterly.ToString();
            }
            if (hfPayment.Text == "Half Yearly")
            {
                var totalHalfYearl = (Year * 2);
                var mon = (Month / 6);
                var totalHalfYearly = Math.Truncate(totalHalfYearl + mon);
                var month = (Month - (mon * 2));
                hfHalfYearly.Value = totalHalfYearly.ToString();
            }
            string dates = d1.ToString("dd/MM/yyyy").Replace("-", "/");
            string[] splitedDates = dates.Split('/');
            //Save this in MonthDay field
            string monthDays = string.Join("/", splitedDates[1]);
            //Save this in Year field
            string datedayss = splitedDates[0];
            string years = splitedDates[2];
            int ys = Convert.ToInt32(years.ToString());
            int ms = Convert.ToInt32(monthDays.ToString());
            int ds = Convert.ToInt32(datedayss.ToString());
            cashFlowss.Add(fa);
            dateList.Add(new DateTime(ys, ms, ds));
            DateTime ldate = d2;
            int UnitCount = 0;
            if (lblm.Text == "Bullet")
            {
                if (hfPayment.Text == "Monthly")
                {
                    UnitCount = Convert.ToInt32(hfMonth.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = d2.AddMonths(i);
                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        string[] splitedDate = date.Split('/');
                        //Save this in MonthDay field
                        string monthDay = string.Join("/", splitedDate[1]);
                        //Save this in Year field
                        string year = splitedDate[2];
                        string day = splitedDate[0];
                        int y = Convert.ToInt32(year.ToString());
                        int m = Convert.ToInt32(monthDay.ToString());
                        int d = Convert.ToInt32(day.ToString());
                        // if (InsDate == d3)
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                        //    cashFlowss.Add(100 + cop);

                        //    dateList.Add(new DateTime(y, m, d));

                        //}
                        //else
                        //{
                        if (d3 > InsDate)
                        {
                            if (i == 1)
                            {
                                //if (d3 > InsDate)
                                //{

                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));


                                TimeSpan tm = InsDate - d2;
                                double cd = tm.TotalDays;
                                double c = couponrate * (cd) / 365;
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));
                                // }

                                //}
                            }
                            else
                            {
                                //if (d3 > InsDate)
                                //{

                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));

                                TimeSpan tm = InsDate - ldate;
                                double cd = tm.TotalDays;
                                double c = couponrate * (cd) / 365;
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));
                                // }

                                // }
                            }
                            ldate = InsDate;
                        }
                        //else
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));

                        //    TimeSpan tm = d3 - ldate;
                        //    double cd = tm.TotalDays;
                        //    double c = 100 + (couponrate * (cd) / 365);
                        //    cashFlowss.Add(c);
                        //    dateList.Add(new DateTime(y, m, d));
                        //}
                        // ldate = InsDate;
                    }
                    if (d3 > ldate || d3 == ldate)
                    {
                        string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                        string[] splitedDate = date.Split('/');
                        //Save this in MonthDay field
                        string monthDay = string.Join("/", splitedDate[1]);
                        //Save this in Year field
                        string year = splitedDate[2];
                        string day = splitedDate[0];
                        int y = Convert.ToInt32(year.ToString());
                        int m = Convert.ToInt32(monthDay.ToString());
                        int d = Convert.ToInt32(day.ToString());
                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));

                        TimeSpan tm = d3 - ldate;
                        double cd = tm.TotalDays;
                        double c = 100 + (couponrate * (cd) / 365);
                        cashFlowss.Add(c);
                        dateList.Add(new DateTime(y, m, d));
                    }

                    //if(ldate == d3)
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));

                    //    float cop = 100 + (couponrate);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                    //else
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate * nday / 365)+ couponrate;
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                }
                if (hfPayment.Text == "Yearly")
                {
                    UnitCount = Convert.ToInt32(hfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = d2.AddMonths(i * 12);
                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        string[] splitedDate = date.Split('/');
                        //Save this in MonthDay field
                        string monthDay = string.Join("/", splitedDate[1]);
                        //Save this in Year field
                        string year = splitedDate[2];
                        string day = splitedDate[0];
                        int y = Convert.ToInt32(year.ToString());
                        int m = Convert.ToInt32(monthDay.ToString());
                        int d = Convert.ToInt32(day.ToString());
                        //if (InsDate == d3)
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                        //    cashFlowss.Add(100 + cop);

                        //    dateList.Add(new DateTime(y, m, d));

                        //}
                        //else
                        //{
                        if (d3 > InsDate)
                        {
                            if (i == 1)
                            {

                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                TimeSpan tm = InsDate - d2;
                                double cd = tm.TotalDays;
                                double c = couponrate * (cd) / 365;
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));


                            }
                            else
                            {

                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                TimeSpan tm = InsDate - ldate;
                                double cd = tm.TotalDays;
                                double c = couponrate * (cd) / 365;
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));

                            }

                            ldate = InsDate;
                        }
                        //else
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                        //    TimeSpan tm = d3 - ldate;
                        //    double cd = tm.TotalDays;
                        //    double c = 100 + (couponrate * (cd) / 365);
                        //    cashFlowss.Add(c);
                        //    dateList.Add(new DateTime(y, m, d));
                        //}

                    }
                    if (d3 > ldate || d3 == ldate)
                    {
                        string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                        string[] splitedDate = date.Split('/');
                        //Save this in MonthDay field
                        string monthDay = string.Join("/", splitedDate[1]);
                        //Save this in Year field
                        string year = splitedDate[2];
                        string day = splitedDate[0];
                        int y = Convert.ToInt32(year.ToString());
                        int m = Convert.ToInt32(monthDay.ToString());
                        int d = Convert.ToInt32(day.ToString());
                        TimeSpan tm = d3 - ldate;
                        double cd = tm.TotalDays;
                        double c = 100 + (couponrate * (cd) / 365);
                        cashFlowss.Add(c);
                        dateList.Add(new DateTime(y, m, d));
                    }

                    //if (ldate == d3)
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + couponrate;
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                    //else
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                }
                if (hfPayment.Text == "Quarterly")
                {
                    UnitCount = Convert.ToInt32(hfQuerterly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = d2.AddMonths(i * 3);
                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        string[] splitedDate = date.Split('/');
                        //Save this in MonthDay field
                        string monthDay = string.Join("/", splitedDate[1]);
                        //Save this in Year field
                        string year = splitedDate[2];
                        string day = splitedDate[0];
                        int y = Convert.ToInt32(year.ToString());
                        int m = Convert.ToInt32(monthDay.ToString());
                        int d = Convert.ToInt32(day.ToString());
                        //if (InsDate == d3)
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                        //    cashFlowss.Add(100 + cop);

                        //    dateList.Add(new DateTime(y, m, d));

                        //}
                        //else
                        //{
                        if (d3 > InsDate)
                        {
                            if (i == 1)
                            {
                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                TimeSpan tm = InsDate - d2;
                                double cd = tm.TotalDays;
                                double c = couponrate * (cd) / 365;
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));
                            }
                            else
                            {
                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                TimeSpan tm = InsDate - ldate;
                                double cd = tm.TotalDays;
                                double c = couponrate * (cd) / 365;
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));
                            }
                            ldate = InsDate;
                        }
                        //else
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                        //    TimeSpan tm = d3 - ldate;
                        //    double cd = tm.TotalDays;
                        //    double c = 100 + (couponrate * (cd) / 365);
                        //    cashFlowss.Add(c);
                        //    dateList.Add(new DateTime(y, m, d));
                        //}


                        //}
                    }
                    if (d3 > ldate || d3 == ldate)
                    {
                        string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                        string[] splitedDate = date.Split('/');
                        //Save this in MonthDay field
                        string monthDay = string.Join("/", splitedDate[1]);
                        //Save this in Year field
                        string year = splitedDate[2];
                        string day = splitedDate[0];
                        int y = Convert.ToInt32(year.ToString());
                        int m = Convert.ToInt32(monthDay.ToString());
                        int d = Convert.ToInt32(day.ToString());
                        TimeSpan tm = d3 - ldate;
                        double cd = tm.TotalDays;
                        double c = 100 + (couponrate * (cd) / 365);
                        cashFlowss.Add(c);
                        dateList.Add(new DateTime(y, m, d));
                    }
                    //if (ldate == d3)
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate/3);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                    //else
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                }
                if (hfPayment.Text == "Half Yearly")
                {
                    UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = d2.AddMonths(i * 6);
                        string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        string[] splitedDate = date.Split('/');
                        //Save this in MonthDay field
                        string monthDay = string.Join("/", splitedDate[1]);
                        //Save this in Year field
                        string year = splitedDate[2];
                        string day = splitedDate[0];
                        int y = Convert.ToInt32(year.ToString());
                        int m = Convert.ToInt32(monthDay.ToString());
                        int d = Convert.ToInt32(day.ToString());
                        //if (InsDate == d3)
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                        //    cashFlowss.Add(100 + cop);

                        //    dateList.Add(new DateTime(y, m, d));

                        //}
                        //else
                        //{
                        if (d3 > InsDate)
                        {

                            if (i == 1)
                            {
                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                TimeSpan tm = InsDate - d2;
                                double cd = tm.TotalDays;
                                double c = couponrate * (cd) / 365;
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));
                            }
                            else
                            {
                                double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                TimeSpan tm = InsDate - ldate;
                                double cd = tm.TotalDays;
                                double c = couponrate * (cd) / 365;
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));
                            }
                            ldate = InsDate;
                        }
                        //else
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                        //    TimeSpan tm = d3 - ldate;
                        //    double cd = tm.TotalDays;
                        //    double c = 100 + (couponrate * (cd) / 365);
                        //    cashFlowss.Add(c);
                        //    dateList.Add(new DateTime(y, m, d));
                        //}


                        // }
                    }
                    if (d3 > ldate || d3 == ldate)
                    {
                        string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                        string[] splitedDate = date.Split('/');
                        //Save this in MonthDay field
                        string monthDay = string.Join("/", splitedDate[1]);
                        //Save this in Year field
                        string year = splitedDate[2];
                        string day = splitedDate[0];
                        int y = Convert.ToInt32(year.ToString());
                        int m = Convert.ToInt32(monthDay.ToString());
                        int d = Convert.ToInt32(day.ToString());
                        TimeSpan tm = d3 - ldate;
                        double cd = tm.TotalDays;
                        double c = 100 + (couponrate * (cd) / 365);
                        cashFlowss.Add(c);
                        dateList.Add(new DateTime(y, m, d));
                    }
                    //if (ldate == d3)
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate/2);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                    //else
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                }


            }

            if (lblm.Text == "Staggered")
            {
                if (hfPayment.Text == "Monthly")
                {
                    float ratevalue = 100, tpercent = 0;
                    UnitCount = Convert.ToInt32(hfMonth.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = d2.AddMonths(i);
                        DataTable dt = dl.CheckMaturityTypeValue(hfProductId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dt.Rows.Count > 0)
                        {
                            string Percentage = dt.Rows[0]["MaturityTypePercentage"].ToString();
                            if (Percentage != null || Percentage != "")
                            {
                                float percent = float.Parse(Percentage.ToString());


                                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                // if (InsDate == d3)
                                //{
                                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                //    cashFlowss.Add(100 + cop);

                                //    dateList.Add(new DateTime(y, m, d));

                                //}
                                //else
                                //{

                                if (d3 > InsDate)
                                {
                                    if (i == 1)
                                    {
                                        //if (d3 > InsDate)
                                        //{

                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));


                                        TimeSpan tm = InsDate - d2;
                                        double cd = tm.TotalDays;
                                        double c = percent + (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                        // }

                                        //}
                                    }
                                    else
                                    {
                                        //if (d3 > InsDate)
                                        //{

                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));

                                        TimeSpan tm = InsDate - ldate;
                                        double cd = tm.TotalDays;
                                        double c = percent + (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                        // }

                                        // }
                                    }
                                }
                                ldate = InsDate;
                                tpercent = tpercent + percent;
                                ratevalue = ratevalue - percent;
                            }
                            else
                            {
                                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                // if (InsDate == d3)
                                //{
                                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                //    cashFlowss.Add(100 + cop);

                                //    dateList.Add(new DateTime(y, m, d));

                                //}
                                //else
                                //{

                                if (d3 > InsDate)
                                {
                                    if (i == 1)
                                    {
                                        //if (d3 > InsDate)
                                        //{

                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));


                                        TimeSpan tm = InsDate - d2;
                                        double cd = tm.TotalDays;
                                        double c = (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                        // }

                                        //}
                                    }
                                    else
                                    {
                                        //if (d3 > InsDate)
                                        //{

                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));

                                        TimeSpan tm = InsDate - ldate;
                                        double cd = tm.TotalDays;
                                        double c = (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                        // }

                                        // }
                                    }
                                }
                                ldate = InsDate;
                            }
                        }
                        else
                        {
                            string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            // if (InsDate == d3)
                            //{
                            //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                            //    cashFlowss.Add(100 + cop);

                            //    dateList.Add(new DateTime(y, m, d));

                            //}
                            //else
                            //{
                            if (d3 > InsDate)
                            {
                                if (i == 1)
                                {
                                    //if (d3 > InsDate)
                                    //{

                                    double cop = Convert.ToDouble(couponrate.ToString("0.00"));


                                    TimeSpan tm = InsDate - d2;
                                    double cd = tm.TotalDays;
                                    double c = ratevalue * couponrate * (cd) / 36500;
                                    cashFlowss.Add(c);
                                    dateList.Add(new DateTime(y, m, d));
                                    // }

                                    //}
                                }
                                else
                                {
                                    //if (d3 > InsDate)
                                    //{

                                    double cop = Convert.ToDouble(couponrate.ToString("0.00"));

                                    TimeSpan tm = InsDate - ldate;
                                    double cd = tm.TotalDays;
                                    double c = ratevalue * couponrate * (cd) / 36500;
                                    cashFlowss.Add(c);
                                    dateList.Add(new DateTime(y, m, d));
                                    // }

                                    // }
                                }
                            }
                            ldate = InsDate;
                        }
                        //else
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));

                        //    TimeSpan tm = d3 - ldate;
                        //    double cd = tm.TotalDays;
                        //    double c = 100 + (couponrate * (cd) / 365);
                        //    cashFlowss.Add(c);
                        //    dateList.Add(new DateTime(y, m, d));
                        //}
                        // ldate = InsDate;
                    }
                    if (d3 > ldate || d3 == ldate)
                    {
                        DataTable dt = dl.CheckMaturityTypeValue(hfProductId.Value, ldate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dt.Rows.Count > 0)
                        {
                            string percent = dt.Rows[0]["MaturityTypePercentage"].ToString();
                            float perc = float.Parse(percent);
                            float tpc = 100 - tpercent;
                            tpercent = tpercent + perc;
                            string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            double cop = Convert.ToDouble(couponrate.ToString("0.00"));


                            TimeSpan tm = d3 - ldate;
                            double cd = tm.TotalDays;
                            double c = tpc + ratevalue * (couponrate * (cd) / 36500);
                            cashFlowss.Add(c);
                            dateList.Add(new DateTime(y, m, d));
                            ratevalue = ratevalue - tpc;
                        }
                        else
                        {
                            string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            double cop = Convert.ToDouble(couponrate.ToString("0.00"));

                            TimeSpan tm = d3 - ldate;
                            double cd = tm.TotalDays;
                            double c = ratevalue * (couponrate * (cd) / 36500);
                            cashFlowss.Add(c);
                            dateList.Add(new DateTime(y, m, d));
                        }

                    }

                    //if(ldate == d3)
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));

                    //    float cop = 100 + (couponrate);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                    //else
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate * nday / 365)+ couponrate;
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                }
                if (hfPayment.Text == "Yearly")
                {
                    float ratevalue = 100, tpercent = 0;
                    UnitCount = Convert.ToInt32(hfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = d2.AddMonths(i * 12);
                        DataTable dt = dl.CheckMaturityTypeValue(hfProductId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dt.Rows.Count > 0)
                        {
                            string Percent = dt.Rows[0]["MaturityTypePercentage"].ToString();
                            if (Percent != null || Percent != "")
                            {
                                float perct = float.Parse(Percent);

                                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                //if (InsDate == d3)
                                //{
                                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                //    cashFlowss.Add(100 + cop);

                                //    dateList.Add(new DateTime(y, m, d));

                                //}
                                //else
                                //{
                                if (d3 > InsDate)
                                {
                                    if (i == 1)
                                    {

                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - d2;
                                        double cd = tm.TotalDays;
                                        double c = perct + (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));


                                    }
                                    else
                                    {

                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - ldate;
                                        double cd = tm.TotalDays;
                                        double c = perct + (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));

                                    }

                                    ldate = InsDate;
                                    ratevalue = ratevalue - perct;
                                    tpercent = tpercent + perct;
                                }
                            }
                            else
                            {
                                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                //if (InsDate == d3)
                                //{
                                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                //    cashFlowss.Add(100 + cop);

                                //    dateList.Add(new DateTime(y, m, d));

                                //}
                                //else
                                //{
                                if (d3 > InsDate)
                                {
                                    if (i == 1)
                                    {

                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - d2;
                                        double cd = tm.TotalDays;
                                        double c = (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));


                                    }
                                    else
                                    {

                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - ldate;
                                        double cd = tm.TotalDays;
                                        double c = (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));

                                    }

                                    ldate = InsDate;
                                }
                            }
                        }
                        else
                        {
                            string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            //if (InsDate == d3)
                            //{
                            //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                            //    cashFlowss.Add(100 + cop);

                            //    dateList.Add(new DateTime(y, m, d));

                            //}
                            //else
                            //{
                            if (d3 > InsDate)
                            {
                                if (i == 1)
                                {

                                    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                    TimeSpan tm = InsDate - d2;
                                    double cd = tm.TotalDays;
                                    double c = (ratevalue * couponrate * (cd) / 36500);
                                    cashFlowss.Add(c);
                                    dateList.Add(new DateTime(y, m, d));


                                }
                                else
                                {

                                    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                    TimeSpan tm = InsDate - ldate;
                                    double cd = tm.TotalDays;
                                    double c = (ratevalue * couponrate * (cd) / 36500);
                                    cashFlowss.Add(c);
                                    dateList.Add(new DateTime(y, m, d));

                                }

                                ldate = InsDate;
                            }
                            //else
                            //{
                            //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                            //    TimeSpan tm = d3 - ldate;
                            //    double cd = tm.TotalDays;
                            //    double c = 100 + (couponrate * (cd) / 365);
                            //    cashFlowss.Add(c);
                            //    dateList.Add(new DateTime(y, m, d));
                            //}

                        }
                    }
                    if (d3 > ldate || d3 == ldate)
                    {
                        DataTable dt = dl.CheckMaturityTypeValue(hfProductId.Value, ldate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dt.Rows.Count > 0)
                        {
                            string per = dt.Rows[0]["MaturityTypePercentage"].ToString();
                            float pert = float.Parse(per);
                            float tp = 100 - tpercent;
                            tpercent = tpercent + pert;

                            string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            TimeSpan tm = d3 - ldate;
                            double cd = tm.TotalDays;
                            double c = tp + (ratevalue * couponrate * (cd) / 36500);
                            cashFlowss.Add(c);
                            dateList.Add(new DateTime(y, m, d));
                            ratevalue = ratevalue - tp;
                        }
                        else
                        {
                            string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            TimeSpan tm = d3 - ldate;
                            double cd = tm.TotalDays;
                            double c = (ratevalue * couponrate * (cd) / 36500);
                            cashFlowss.Add(c);
                            dateList.Add(new DateTime(y, m, d));
                        }
                    }


                    //if (ldate == d3)
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + couponrate;
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                    //else
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                }
                if (hfPayment.Text == "Quarterly")
                {
                    float ratevalue = 100, tpercent = 0;
                    UnitCount = Convert.ToInt32(hfQuerterly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = d2.AddMonths(i * 3);
                        DataTable dt = dl.CheckMaturityTypeValue(hfProductId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dt.Rows.Count > 0)
                        {
                            string perc = dt.Rows[0]["MaturityTypePercentage"].ToString();
                            if (perc != null || perc != "")
                            {
                                float pert = float.Parse(perc);
                                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                //if (InsDate == d3)
                                //{
                                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                //    cashFlowss.Add(100 + cop);

                                //    dateList.Add(new DateTime(y, m, d));

                                //}
                                //else
                                //{
                                if (d3 > InsDate)
                                {
                                    if (i == 1)
                                    {
                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - d2;
                                        double cd = tm.TotalDays;
                                        double c = pert + (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                    }
                                    else
                                    {
                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - ldate;
                                        double cd = tm.TotalDays;
                                        double c = pert + (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                    }
                                    ldate = InsDate;
                                    ratevalue = ratevalue - pert;
                                    tpercent = tpercent + pert;
                                }
                            }
                            else
                            {
                                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                //if (InsDate == d3)
                                //{
                                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                //    cashFlowss.Add(100 + cop);

                                //    dateList.Add(new DateTime(y, m, d));

                                //}
                                //else
                                //{
                                if (d3 > InsDate)
                                {
                                    if (i == 1)
                                    {
                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - d2;
                                        double cd = tm.TotalDays;
                                        double c = (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                    }
                                    else
                                    {
                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - ldate;
                                        double cd = tm.TotalDays;
                                        double c = (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                    }
                                    ldate = InsDate;

                                }
                            }
                        }
                        else
                        {

                            string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            //if (InsDate == d3)
                            //{
                            //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                            //    cashFlowss.Add(100 + cop);

                            //    dateList.Add(new DateTime(y, m, d));

                            //}
                            //else
                            //{
                            if (d3 > InsDate)
                            {
                                if (i == 1)
                                {
                                    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                    TimeSpan tm = InsDate - d2;
                                    double cd = tm.TotalDays;
                                    double c = ratevalue * couponrate * (cd) / 36500;
                                    cashFlowss.Add(c);
                                    dateList.Add(new DateTime(y, m, d));
                                }
                                else
                                {
                                    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                    TimeSpan tm = InsDate - ldate;
                                    double cd = tm.TotalDays;
                                    double c = ratevalue * couponrate * (cd) / 36500;
                                    cashFlowss.Add(c);
                                    dateList.Add(new DateTime(y, m, d));
                                }
                                ldate = InsDate;
                            }
                        }
                        //else
                        //{
                        //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                        //    TimeSpan tm = d3 - ldate;
                        //    double cd = tm.TotalDays;
                        //    double c = 100 + (couponrate * (cd) / 365);
                        //    cashFlowss.Add(c);
                        //    dateList.Add(new DateTime(y, m, d));
                        //}


                        //}
                    }
                    if (d3 > ldate || d3 == ldate)
                    {
                        DataTable dt = dl.CheckMaturityTypeValue(hfProductId.Value, ldate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dt.Rows.Count > 0)
                        {
                            string pert = dt.Rows[0]["MaturityTypePercentage"].ToString();
                            float perc = float.Parse(pert);
                            float tp = 100 - tpercent;
                            tpercent = tpercent + perc;

                            string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            TimeSpan tm = d3 - ldate;
                            double cd = tm.TotalDays;
                            double c = tp + (ratevalue * couponrate * (cd) / 36500);
                            cashFlowss.Add(c);
                            dateList.Add(new DateTime(y, m, d));
                        }
                        else
                        {
                            string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            TimeSpan tm = d3 - ldate;
                            double cd = tm.TotalDays;
                            double c = ratevalue * couponrate * (cd) / 36500;
                            cashFlowss.Add(c);
                            dateList.Add(new DateTime(y, m, d));
                        }
                    }
                    //if (ldate == d3)
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate/3);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                    //else
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                }
                if (hfPayment.Text == "Half Yearly")
                {
                    float ratevalue = 100, tpercent = 0;
                    UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = d2.AddMonths(i * 6);
                        DataTable dt = dl.CheckMaturityTypeValue(hfProductId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dt.Rows.Count > 0)
                        {
                            string percent = dt.Rows[0]["MaturityTypePercentage"].ToString();
                            if (percent != "")
                            {
                                float perct = float.Parse(percent);
                                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                //if (InsDate == d3)
                                //{
                                //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                //    cashFlowss.Add(100 + cop);

                                //    dateList.Add(new DateTime(y, m, d));

                                //}
                                //else
                                //{
                                if (d3 > InsDate)
                                {

                                    if (i == 1)
                                    {
                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - d2;
                                        double cd = tm.TotalDays;
                                        double c = perct + (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                    }
                                    else
                                    {
                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - ldate;
                                        double cd = tm.TotalDays;
                                        double c = perct + (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                    }
                                    ldate = InsDate;
                                    ratevalue = ratevalue - perct;
                                    tpercent = tpercent + perct;
                                }
                            }
                            else
                            {
                                string date = InsDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                if (d3 > InsDate)
                                {
                                    if (i == 1)
                                    {
                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - d2;
                                        double cd = tm.TotalDays;
                                        double c = (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                    }
                                    else
                                    {
                                        double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                                        TimeSpan tm = InsDate - ldate;
                                        double cd = tm.TotalDays;
                                        double c = (ratevalue * couponrate * (cd) / 36500);
                                        cashFlowss.Add(c);
                                        dateList.Add(new DateTime(y, m, d));
                                    }
                                    ldate = InsDate;
                                }
                            }
                            //else
                            //{
                            //    double cop = Convert.ToDouble(couponrate.ToString("0.00"));
                            //    TimeSpan tm = d3 - ldate;
                            //    double cd = tm.TotalDays;
                            //    double c = 100 + (couponrate * (cd) / 365);
                            //    cashFlowss.Add(c);
                            //    dateList.Add(new DateTime(y, m, d));
                            //}


                            // }
                        }
                    }
                    if (d3 > ldate || d3 == ldate)
                    {
                        DataTable dt = dl.CheckMaturityTypeValue(hfProductId.Value, ldate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dt.Rows.Count > 0)
                        {
                            string perc = dt.Rows[0]["MaturityTypePercentage"].ToString();
                            if (perc != "")
                            {
                                float per = float.Parse(perc);
                                float tp = 100 - tpercent;
                                string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                TimeSpan tm = d3 - ldate;
                                double cd = tm.TotalDays;
                                double c = tp + (ratevalue * couponrate * (cd) / 36500);
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));
                            }
                            else
                            {
                                float tp = 100 - tpercent;
                                string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                                string[] splitedDate = date.Split('/');
                                //Save this in MonthDay field
                                string monthDay = string.Join("/", splitedDate[1]);
                                //Save this in Year field
                                string year = splitedDate[2];
                                string day = splitedDate[0];
                                int y = Convert.ToInt32(year.ToString());
                                int m = Convert.ToInt32(monthDay.ToString());
                                int d = Convert.ToInt32(day.ToString());
                                TimeSpan tm = d3 - ldate;
                                double cd = tm.TotalDays;
                                double c = tp + (ratevalue * couponrate * (cd) / 36500);
                                cashFlowss.Add(c);
                                dateList.Add(new DateTime(y, m, d));
                            }
                        }
                        else
                        {
                            string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                            string[] splitedDate = date.Split('/');
                            //Save this in MonthDay field
                            string monthDay = string.Join("/", splitedDate[1]);
                            //Save this in Year field
                            string year = splitedDate[2];
                            string day = splitedDate[0];
                            int y = Convert.ToInt32(year.ToString());
                            int m = Convert.ToInt32(monthDay.ToString());
                            int d = Convert.ToInt32(day.ToString());
                            TimeSpan tm = d3 - ldate;
                            double cd = tm.TotalDays;
                            double c = (ratevalue * couponrate * (cd) / 36500);
                            cashFlowss.Add(c);
                            dateList.Add(new DateTime(y, m, d));
                        }
                    }

                    //if (ldate == d3)
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate/2);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                    //else
                    //{
                    //    string date = d3.ToString("dd/MM/yyyy").Replace("-", "/");
                    //    string[] splitedDate = date.Split('/');
                    //    //Save this in MonthDay field
                    //    string monthDay = string.Join("/", splitedDate[1]);
                    //    //Save this in Year field
                    //    string year = splitedDate[2];
                    //    string day = splitedDate[0];
                    //    int y = Convert.ToInt32(year.ToString());
                    //    int m = Convert.ToInt32(monthDay.ToString());
                    //    int d = Convert.ToInt32(day.ToString());
                    //    TimeSpan tt = d3 - ldate;
                    //    double noday = tt.TotalDays;
                    //    float nday = float.Parse(noday.ToString("0"));
                    //    float cop = 100 + (couponrate * (nday / 365) + couponrate);
                    //    cashFlowss.Add(cop);
                    //    dateList.Add(new DateTime(y, m, d));
                    //}
                }
            }

            double[] cashflows = cashFlowss.ToArray();
            DateTime[] datess = dateList.ToArray();

            // Calculate XIRR
            double xirr = CalculateXIRR(cashflows, datess);
            float xr = float.Parse(xirr.ToString("0.0000"));
            float xir = (xr * 100);
            hfYieldValue.Value = xir.ToString();
            lblYTM.Text = xir.ToString();
            //  Response.Write(xir);
            // lblXIRR.Text = xir.ToString("0.00");

        }

    }

    private void FrequencyLast()
    {

    }
    protected void lnkViewAll_Click(object sender, EventArgs e)
    {

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
    private void clear()
    {
        txtEmail.Text = string.Empty;
    }
    protected void btnSubscribe_Click(object sender, EventArgs e)
    {
        if(txtEmail.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Email Required', type: 'error',});", true);
            return;
        }
        if(!IsValidMail(txtEmail.Text))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Email Must Be Enter', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"]==null)
        {
            if(dl.AddSubscribe(null,txtEmail.Text))
            {
                clear();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Subscribe Successfully', type: 'success',});", true);
                return;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Already Subscribe', type: 'success',});", true);
                return;
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin?url=" + Server.UrlEncode(Request.Url.AbsoluteUri.Replace(".aspx","")));
    }

    //#region Web Services

    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static string[] GetProducts(string prefix)
    //{
    //    DAL dl = new DAL();
    //    DataTable dt = dl.getSearchedProducts(prefix);
    //    List<string> pl = new List<string>();

    //    foreach (DataRow dr in dt.Rows)
    //    {
    //        pl.Add(string.Format("{0}", dr["searchproduct"].ToString()));
    //    }
    //    return pl.ToArray();
    //}


    //#endregion
    protected void lnkSerch_Click(object sender, EventArgs e)
    {
        string sfilters = "";
        if (txtResult.Text != "")
        {
            sfilters = txtResult.Text;
        }
        if (txtResult.Text == "")
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

                //string plainText = productId;
                //string encryptedText = EncryptionHelper.Encrypt(plainText);
               // Console.WriteLine("Encrypted: " + encryptedText);
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

    protected void lnkSignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signup?url=" + Server.UrlEncode(Request.Url.AbsoluteUri.Replace(".aspx", "")));
    }

    private void generateCaptcha()
    {
        int length = 4;
        const string pool = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var chars = Enumerable.Range(0, length).Select(x => pool[rnd.Next(0, pool.Length)]);
        lblCaptcha.Text = new string(chars.ToArray());
    }
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        if (txtFirstName.Text == "")
        {

            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid First Name Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (txtLastName.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Last Name Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (txtMobile.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Mobile Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Email Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (!IsValidMail(txtEmail.Text))
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Email Must be Added ..!!!', type: 'error',});", true);
            return;
        }

        if (txtMessage.Text == "")
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Message Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (txtCapchaCode.Text != lblCaptcha.Text)
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Valid Security code Must be Added ..!!!', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"] == null)
        {
            if (dl.AddLeadForm(null, txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtMobile.Text, txtMessage.Text))
            {
                clears();
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                return;
            }
        }
    }

    private void clears()
    {
        txtFirstName.Text = string.Empty;
        txtLastName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtMobile.Text = string.Empty;
        txtMessage.Text = string.Empty;
        txtCapchaCode.Text = string.Empty;
        ViewState["Id"] = null;
    }
    protected void lnkRefresh_Click(object sender, EventArgs e)
    {
        generateCaptcha();
    }

    protected void lnkdetails_Click(object sender, EventArgs e)
    {
        LinkButton lnksend = (LinkButton)sender;

        //string encryptedText = EncryptionHelper.Encrypt(lnksend.CommandArgument);
        // Console.WriteLine("Encrypted: " + encryptedText);
        Response.Redirect("CashFlow?oId=" + lnksend.CommandArgument);
    }

    protected void lnkmonth_Click(object sender, EventArgs e)
    {

        //string encryptedText = EncryptionHelper.Encrypt("13");
        // Console.WriteLine("Encrypted: " + encryptedText);
        Response.Redirect("OurCollections?oId=" + 13);
    }

    protected void lnkpsu_Click(object sender, EventArgs e)
    {
        //string encryptedText = EncryptionHelper.Encrypt("14");
        // Console.WriteLine("Encrypted: " + encryptedText);
        Response.Redirect("OurCollections?oId=" + 14);
    }

    protected void lnkpublic_Click(object sender, EventArgs e)
    {
        //string encryptedText = EncryptionHelper.Encrypt("26");
        // Console.WriteLine("Encrypted: " + encryptedText);
        Response.Redirect("OurCollections?oId=" + 26);
    }

    protected void lnksaver_Click(object sender, EventArgs e)
    {
        //string encryptedText = EncryptionHelper.Encrypt("28");
        // Console.WriteLine("Encrypted: " + encryptedText);
        Response.Redirect("OurCollections?oId=" + 28);
    }

    protected void lnkhigh_Click(object sender, EventArgs e)
    {
       // string encryptedText = EncryptionHelper.Encrypt("16");
        // Console.WriteLine("Encrypted: " + encryptedText);
        Response.Redirect("OurCollections?oId=" + 16);
    }

    protected void lnktax_Click(object sender, EventArgs e)
    {
       // string encryptedText = EncryptionHelper.Encrypt("17");
        // Console.WriteLine("Encrypted: " + encryptedText);
        Response.Redirect("OurCollections?oId=" + 17);
    }

    protected void lnkcapital_Click(object sender, EventArgs e)
    {
       // string encryptedText = EncryptionHelper.Encrypt("27");
        // Console.WriteLine("Encrypted: " + encryptedText);
        Response.Redirect("OurCollections?oId=" + 27);
    }
}