using LanguageExt;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CashFlowMaturityType : System.Web.UI.Page
{
    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindInterestView();
            if (GetUserLoggedIn() != null)
            {
                pnlCashFlow.Visible = true;
                pnl.Visible = true;
                pnlViewSheet.Visible = true;
                pnlLoginToView.Visible = false;
            }
            else
            {
                pnlCashFlow.Visible = false;
                pnl.Visible = false;
                pnlViewSheet.Visible = false;
                pnlLoginToView.Visible = true;
            }
            pnlView.Visible = false;


            getData();
            BindFlowChart();
            BindDataaa();
            BindOverView();
            FrequencyTypeView();
        }

    }
    private void FrequencyTypeView()
    {
        if(hfMaturityType.Value == "Bullet")
        {
            pnlInterestBullet.Visible = true;
            pnlInterestStaggered.Visible = false;
        }
        if(hfMaturityType.Value == "Staggered")
        {
            pnlInterestBullet.Visible = false;
            pnlInterestStaggered.Visible = true;
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

    private void getData()
    {
        DataTable dt = new DAL().get_MaturityTypeProducts(null, null, null, true);
        if (dt.Rows.Count > 0)
        {
            this.Page.Title = dt.Rows[0]["Security"].ToString();
            string PaymentType = dt.Rows[0]["PaymentTypeHead"].ToString();
            hfPaymentType.Value = PaymentType;
            string ProductId = dt.Rows[0]["MProductsId"].ToString();
            hfProductsId.Value = ProductId;
            string MaturityType = dt.Rows[0]["MaturityType"].ToString();
            hfMaturityType.Value = MaturityType;

        }
        rptDataBind.DataSource = dt;
        rptDataBind.DataBind();
        rptViewproduct.DataSource = dt;
        rptViewproduct.DataBind();
        rptBondCalculator.DataSource = dt;
        rptBondCalculator.DataBind();
        DataTable dtm = dl.get_FAQProducts(null, null, null, null, null);
        if (dtm.Rows.Count > 0)
        {
            pnlView.Visible = true;
            rptFAQ.DataSource = dtm;
            rptFAQ.DataBind();
        }
        DataTable dtc = dl.MCheckLastDayOFMonth(hfProductsId.Value);
        if (dt.Rows.Count > 0)
        {
            string EOM = dtc.Rows[0]["EOM"].ToString();
            hfEOM.Value = EOM;
        }
    }
    private void BindInterestView()
    {
        DataTable dtc = dl.get_CashFlowView(null, GetUserLoggedIn(), null, null);
        if (dtc.Rows.Count > 0)
        {
            rptCashFlowDetails.DataSource = dtc;
            rptCashFlowDetails.DataBind();
        }
    }
    private void BindFlowChart()
    {
        DataTable dt = dl.get_CashFlow(null, GetUserLoggedIn(), null, null);
        //if(dt.Rows.Count > 0)
        //{

        //    string widthdata = dt.Rows[0]["NumberBond"].ToString();
        //    float width = float.Parse(widthdata);
        //    hfWidthForm.Value = (width * 200).ToString();

        //}
        rptChartFace.DataSource = dt;
        rptChartFace.DataBind();
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
        if (txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Email Required', type: 'error',});", true);
            return;
        }
        if (!IsValidMail(txtEmail.Text))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Email Must Be Enter', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"] == null)
        {
            if (dl.AddSubscribe(null, txtEmail.Text))
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

    protected void rptDataBind_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }

    protected void rptViewproduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Panel pnlPrice = (e.Item.FindControl("pnlPrice") as Panel);
            Panel pnlYield = (e.Item.FindControl("pnlYield") as Panel);
            Panel pnlPriceView = (e.Item.FindControl("pnlPriceView") as Panel);
            Panel pnlYieldView = (e.Item.FindControl("pnlYieldView") as Panel);

            string ProductsId = (e.Item.FindControl("hfProducts") as HiddenField).Value;
            Repeater rptCredit = e.Item.FindControl("rptCredit") as Repeater;
            rptCredit.DataSource = dl.get_CreditRatingTags(null, ProductsId, null, null);
            rptCredit.DataBind();
            string hfAgencies = (e.Item.FindControl("hfAgencies") as HiddenField).Value;
            Repeater rptAgencies = e.Item.FindControl("rptAgencies") as Repeater;
            rptAgencies.DataSource = dl.get_RatingAgenciesTags(null, hfAgencies, null, null);
            rptAgencies.DataBind();
            if (GetUserLoggedIn() != null)
            {
                pnlPrice.Visible = true;
                pnlYield.Visible = true;
                pnlPriceView.Visible = false;
                pnlYieldView.Visible = false;
            }
            else
            {
                pnlPrice.Visible = false;
                pnlYield.Visible = false;
                pnlPriceView.Visible = true;
                pnlYieldView.Visible = true;
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin?url=" + Server.UrlEncode(Request.Url.AbsoluteUri.Replace(".aspx", "")));
    }

    protected void rptBondCalculator_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            TextBox MaturityDate = (e.Item.FindControl("txtMaturityDate") as TextBox);
            hfMaturityDate.Value = MaturityDate.Text;
            TextBox PriceRate = (e.Item.FindControl("txtRate") as TextBox);
            hfRatePrice.Value = PriceRate.Text;

        }
    }
    private void BindDataaa()
    {
        DataTable dt = dl.get_MaturityTypeProducts(hfProductsId.Value, null, null, null);
        if (dt.Rows.Count > 0)
        {
            string IPDateaa = dt.Rows[0]["IPDate"].ToString();

            hfIPDateaaa.Value = IPDateaa.ToString();
            DateTime IPDat = DateTime.ParseExact(hfIPDateaaa.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string Frequency = dt.Rows[0]["PaymentTypeHead"].ToString();
            hfFrequencyType.Value = Frequency;
            DateTime Sattles = DateTime.Now;
            foreach (RepeaterItem rp in rptBondCalculator.Items)
            {
                if (hfEOM.Value == "1")
                {
                    TextBox txtLastIP = (TextBox)rp.FindControl("txtLastIP");
                    if (hfFrequencyType.Value == "Monthly")
                    {
                        DataTable dtc = dl.get_LastDateMonthly(Sattles);
                        string Date = dtc.Rows[0]["LastMonth"].ToString();
                        hfQuar.Value = Date;
                        //DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        txtLastIP.Text = Date;

                    }
                    if (hfFrequencyType.Value == "Yearly")
                    {
                        DataTable dtc = dl.get_YearlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime IP = Datee.AddYears(-1);
                        txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    }
                    if (hfFrequencyType.Value == "Quarterly")
                    {
                        DataTable dtc = dl.get_QuarterlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DataTable dtm = dl.get_LastDateQuarterly(Datee);
                        string Datees = dtm.Rows[0]["LastQuarterly"].ToString();
                        hfSattlementDate.Value = Datees;
                        txtLastIP.Text = Datees;
                    }
                    if (hfFrequencyType.Value == "Half Yearly")
                    {
                        DataTable dtc = dl.get_HalfYearlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DataTable dtm = dl.get_LastDateHalfYearly(Datee);
                        string Datees = dtm.Rows[0]["get_LastDateHalfYearly"].ToString();

                        txtLastIP.Text = Datees;
                    }
                }
                else
                {
                    TextBox txtLastIP = (TextBox)rp.FindControl("txtLastIP");
                    if (hfFrequencyType.Value == "Monthly")
                    {
                        DataTable dtc = dl.get_MonthlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime IP = Datee.AddMonths(-1);
                        txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");

                    }
                    if (hfFrequencyType.Value == "Yearly")
                    {
                        DataTable dtc = dl.get_YearlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime IP = Datee.AddYears(-1);
                        txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    }
                    if (hfFrequencyType.Value == "Quarterly")
                    {
                        DataTable dtc = dl.get_QuarterlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime IP = Datee.AddMonths(-3);
                        txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    }
                    if (hfFrequencyType.Value == "Half Yearly")
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
    }
    private void BindOverView()
    {
        DataTable dt = dl.get_MaturityTypeProducts(hfProductsId.Value, null, null, null);
        if (dt.Rows.Count > 0)
        {
            string IPDateaa = dt.Rows[0]["IPDate"].ToString();

            hfIPDateaaa.Value = IPDateaa.ToString();
            DateTime IPDat = DateTime.ParseExact(hfIPDateaaa.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string Frequency = dt.Rows[0]["PaymentTypeHead"].ToString();
            hfFrequencyType.Value = Frequency;
            DateTime Sattles = DateTime.Now;
            foreach (RepeaterItem rp in rptViewproduct.Items)
            {
                if (hfEOM.Value == "1")
                {
                    Label txtLastIP = (Label)rp.FindControl("txtLastIP");
                    if (hfFrequencyType.Value == "Monthly")
                    {
                        DataTable dtc = dl.get_LastDateMonthly(Sattles);
                        string Date = dtc.Rows[0]["LastMonth"].ToString();
                        hfQuar.Value = Date;
                        //DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        txtLastIP.Text = Date;

                    }
                    if (hfFrequencyType.Value == "Yearly")
                    {
                        DataTable dtc = dl.get_YearlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime IP = Datee.AddYears(-1);
                        txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    }
                    if (hfFrequencyType.Value == "Quarterly")
                    {
                        DataTable dtc = dl.get_QuarterlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DataTable dtm = dl.get_LastDateQuarterly(Datee);
                        string Datees = dtm.Rows[0]["LastQuarterly"].ToString();
                        hfSattlementDate.Value = Datees;
                        txtLastIP.Text = Datees;
                    }
                    if (hfFrequencyType.Value == "Half Yearly")
                    {
                        DataTable dtc = dl.get_HalfYearlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DataTable dtm = dl.get_LastDateHalfYearly(Datee);
                        string Datees = dtm.Rows[0]["get_LastDateHalfYearly"].ToString();

                        txtLastIP.Text = Datees;
                    }
                }
                else
                {
                    Label txtLastIP = (Label)rp.FindControl("txtLastIP");
                    if (hfFrequencyType.Value == "Monthly")
                    {
                        DataTable dtc = dl.get_MonthlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime IP = Datee.AddMonths(-1);
                        txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");

                    }
                    if (hfFrequencyType.Value == "Yearly")
                    {
                        DataTable dtc = dl.get_YearlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime IP = Datee.AddYears(-1);
                        txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    }
                    if (hfFrequencyType.Value == "Quarterly")
                    {
                        DataTable dtc = dl.get_QuarterlyDate(Sattles, IPDat);
                        string Date = dtc.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;
                        DateTime Datee = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime IP = Datee.AddMonths(-3);
                        txtLastIP.Text = IP.ToString("dd/MM/yyyy").Replace("-", "/");
                    }
                    if (hfFrequencyType.Value == "Half Yearly")
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
    }

    protected void txtFaceValueDeal_TextChanged(object sender, EventArgs e)
    {
        PaymentType();
        if (hfMaturityType.Value == "Bullet")
        {
            TextBox txtFaceValueDeal = sender as TextBox;
            RepeaterItem item = (RepeaterItem)txtFaceValueDeal.NamingContainer;
            TextBox txtCouponRate = (TextBox)item.FindControl("txtCouponRate");
            TextBox txtRate = (TextBox)item.FindControl("txtRate");
            TextBox txtPrincipalAmount = (TextBox)item.FindControl("txtPrincipalAmount");
            TextBox txtLastIP = (TextBox)item.FindControl("txtLastIP");
            TextBox txtAccured = (TextBox)item.FindControl("txtAccured");
            TextBox txtGrossConder = (TextBox)item.FindControl("txtGrossConder");
            TextBox txtStampDuty = (TextBox)item.FindControl("txtStampDuty");
            TextBox txtConsiderationStamp = (TextBox)item.FindControl("txtConsiderationStamp");
            TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");
            TextBox txtFaceValueBond = (TextBox)item.FindControl("txtFaceValueBond");
            TextBox txtSattlementdate = (TextBox)item.FindControl("txtSattlementdate");
            //  TextBox txtFaceValueDeal = (TextBox)item.FindControl("txtFaceValueDeal");

            float Rate = float.Parse(txtRate.Text);
            float FacevalueBond = float.Parse(txtFaceValueBond.Text);
            float FaceValue = float.Parse(txtFaceValueDeal.Text);
            hfFacrValueForDeal.Value = FaceValue.ToString();
            txtPrincipalAmount.Text = Convert.ToDecimal(Rate * FaceValue / 100).ToString();
            hfPrincipalAmount.Value = txtPrincipalAmount.Text;
            float Principle = float.Parse(txtPrincipalAmount.Text);
            float Coupon = float.Parse(txtCouponRate.Text);
            hfCouponRate.Value = Coupon.ToString();
            int NDay = 0;
            try
            {
                NDay = int.Parse(hfDayValue.Value);
            }
            catch (Exception ex) { }
            float Numbers = NDay;
            txtAccured.Text = Convert.ToString(FaceValue * Coupon * NDay / 36500);
            hfTotalAssuredInterest.Value = txtAccured.Text;
            float Accured = float.Parse(txtAccured.Text);
            txtGrossConder.Text = Convert.ToString((Rate * FaceValue / 100) + (FaceValue * Coupon * NDay / 36500));
            hfGrossConsideration.Value = txtGrossConder.Text;
            float GrossCo = float.Parse(txtGrossConder.Text);
            txtStampDuty.Text = Convert.ToInt32(GrossCo * 0.0001 / 100).ToString();
            txtQuantity.Text = (FaceValue / FacevalueBond).ToString();
            hfQuantity.Value = txtQuantity.Text;
            float StampDuty = float.Parse(txtStampDuty.Text);
            txtConsiderationStamp.Text = Convert.ToString(GrossCo + (GrossCo * 0.0001 / 100));
            hfTotalConserationAmount.Value = txtConsiderationStamp.Text;
        }
        if (hfMaturityType.Value == "Staggered")
        {
            TextBox txtFaceValueDeal = sender as TextBox;
            RepeaterItem item = (RepeaterItem)txtFaceValueDeal.NamingContainer;
            TextBox txtCouponRate = (TextBox)item.FindControl("txtCouponRate");
            TextBox txtRate = (TextBox)item.FindControl("txtRate");
            TextBox txtPrincipalAmount = (TextBox)item.FindControl("txtPrincipalAmount");
            TextBox txtLastIP = (TextBox)item.FindControl("txtLastIP");
            TextBox txtAccured = (TextBox)item.FindControl("txtAccured");
            TextBox txtGrossConder = (TextBox)item.FindControl("txtGrossConder");
            TextBox txtStampDuty = (TextBox)item.FindControl("txtStampDuty");
            TextBox txtConsiderationStamp = (TextBox)item.FindControl("txtConsiderationStamp");
            TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");
            TextBox txtFaceValueBond = (TextBox)item.FindControl("txtFaceValueBond");
            TextBox txtSattlementdate = (TextBox)item.FindControl("txtSattlementdate");

            float Rate = float.Parse(txtRate.Text);
            float FacevalueBond = float.Parse(txtFaceValueBond.Text);
            float FaceValue = float.Parse(txtFaceValueDeal.Text);
            hfFacrValueForDeal.Value = FaceValue.ToString();
            float Deal = float.Parse(hfFacrValueForDeal.Value);
            float coupon = float.Parse(txtCouponRate.Text);
            DateTime IPDate = DateTime.ParseExact(hfIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime Sattle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            if (hfPaymentType.Value == "Monthly")
            {
                if (IPDate < Sattle)
                {
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                    TimeSpan FirstDay = (InstallDate - Salltle);
                    DataTable dtc = dl.CheckMaturityTypeValue(hfProductsId.Value, hfIPDates.Value);
                    if (dtc.Rows.Count > 0)
                    {
                        string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                        float percent = float.Parse(Percentage.ToString());

                        float fday = (float)FirstDay.TotalDays;
                        float FirstMonth = (((Deal * coupon * fday) / 36500) + (FaceValue * percent / 100));
                        float Principal = (FaceValue * percent / 100);
                        hfFirstMonthly.Value = FirstMonth.ToString();
                        float face = (Deal - (FaceValue * percent / 100));
                        hfLastDates.Value = InstallDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        DateTime lastDate = InstallDate;
                        float intfirst = ((Deal * coupon * fday) / 36500);
                        hfIntFirst.Value = intfirst.ToString();
                        float per = percent;
                        hfPercentFirst.Value = per.ToString();
                        int UnitCount = Convert.ToInt32(hfMonth.Value);
                        float interest = 0;
                        float Pers = 0;
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            
                            DateTime InsDate = InstallDate.AddMonths(i);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if (dtm.Rows.Count > 0)
                            {
                                //float fas = float.Parse(hfFaceee.Value);
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float monthlyinterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                                float principal = ((FaceValue * perce / 100));
                                hfMonthlyInterest.Value = monthlyinterest.ToString();
                                lastDate = InsDate;
                                float Faces = (face - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                float total = (interest + ((face * coupon * days) / 36500));
                                face = Faces;
                                interest = total;
                                hfTotalInt.Value = interest.ToString();
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();
                             
                            }
                            else
                            {

                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float monthlyinterest = (((face * coupon * days) / 36500));
                                hfMonthlyInterest.Value = monthlyinterest.ToString();
                                lastDate = InsDate;
                                float total = (interest + (face * coupon * days) / 36500);
                                interest = total;
                                hfTotalInt.Value = interest.ToString();
                               
                            }

                        }

                        DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float intLast = float.Parse(hfTotalInt.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        
                        if (dtn.Rows.Count > 0)
                        {

                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotapercent = (per + lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotapercent);
                            float LastMonthInt = float.Parse(hfRemainingDay.Value);
                            float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent/100));
                            float principal = (FaceValue * Percs / 100);
                            hfLastMonthly.Value = LastMonth.ToString();
                            float LastInterest = (intfirst + intLast + ((facelast * coupon * LastMonthInt) / 36500));
                            hfTotalFullInt.Value = LastInterest.ToString();
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastMonthInt = float.Parse(hfRemainingDay.Value);
                            float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * remainingpercent /100));
                            hfLastMonthly.Value = LastMonth.ToString();
                            float LastInterest = (intfirst + intLast + ((facelast * coupon * LastMonthInt) / 36500));
                            hfTotalFullInt.Value = LastInterest.ToString();
                        }
                    }
                    else
                    {
                        float fday = (float)FirstDay.TotalDays;
                        float FirstMonth = ((Deal * coupon * fday) / 36500);
                        hfFirstMonthly.Value = FirstMonth.ToString();
                        DateTime lastDate = InstallDate;
                        float intfirst = ((Deal * coupon * fday) / 36500);
                        float interest = 0;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfMonth.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {

                            DateTime InsDate = InstallDate.AddMonths(i);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if (dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);

                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float monthlyinterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce / 100));
                                float principal = (FaceValue * perce / 100);
                                hfMonthlyInterest.Value = monthlyinterest.ToString();
                                lastDate = InsDate;
                                float Faces = (Deal - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                float total = (interest + ((Deal * coupon * days) / 36500));
                                Deal = Faces;
                                interest = total;
                                hfTotalInt.Value = interest.ToString();
                                float totalpercent = (Pers + perce);
                                Pers = totalpercent;
                                hfTotalPercent.Value = totalpercent.ToString();
                            }
                            else
                            {

                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float monthlyinterest = (((Deal * coupon * days) / 36500));
                                hfMonthlyInterest.Value = monthlyinterest.ToString();
                                lastDate = InsDate;
                                float total = (interest + (Deal * coupon * days) / 36500);
                                interest = total;
                                hfTotalInt.Value = interest.ToString();
                            }

                        }

                        DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                        float intLast = float.Parse(hfTotalInt.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        if (dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotapercent = (lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotapercent);
                            float LastMonthInt = float.Parse(hfRemainingDay.Value);
                            float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                            float principal = (FaceValue * Percs / 100);
                            hfLastMonthly.Value = LastMonth.ToString();
                            float LastInterest = (intfirst + intLast + ((facelast * coupon * LastMonthInt) / 36500));
                            hfTotalFullInt.Value = LastInterest.ToString();
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastMonthInt = float.Parse(hfRemainingDay.Value);
                            float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * remainingpercent /100));
                            hfLastMonthly.Value = LastMonth.ToString();
                            float LastInterest = (intfirst + intLast + ((facelast * coupon * LastMonthInt) / 36500));
                            hfTotalFullInt.Value = LastInterest.ToString();
                        }
                    }
                    txtQuantity.Text = (FaceValue / FacevalueBond).ToString();
                    txtPrincipalAmount.Text = Convert.ToDecimal(Rate * FaceValue / 100).ToString();
                    txtAccured.Text = Convert.ToString(hfTotalFullInt.Value);
                    float Accured = float.Parse(txtAccured.Text);
                    txtGrossConder.Text = Convert.ToString((Rate * FaceValue / 100) + Accured);
                    float GrossCo = float.Parse(txtGrossConder.Text);
                    txtStampDuty.Text = Convert.ToInt32(GrossCo * 0.0001 / 100).ToString();
                    txtConsiderationStamp.Text = Convert.ToString(GrossCo + (GrossCo * 0.0001 / 100));
                    hfTotalConserationAmount.Value = txtConsiderationStamp.Text;
                }
            }

            if (hfPaymentType.Value == "Yearly")
            {
                DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                TimeSpan FirstDay = (InstallDate - Salltle);
                float fday = (float)FirstDay.TotalDays;
                DataTable dt = dl.CheckMaturityTypeValue(hfProductsId.Value, hfIPDates.Value);
                if (dt.Rows.Count > 0)
                {
                    string Percentage = dt.Rows[0]["MaturityTypePercentage"].ToString();
                    float Percent = float.Parse(Percentage);
                    float FirstYear = (((Deal * coupon * fday) / 36500) + (FaceValue * Percent / 100));
                    float Principal = (FaceValue * Percent / 100);
                    hfFirstYearly.Value = FirstYear.ToString();
                    DateTime lastDate = InstallDate;
                    float face = (FaceValue - (FaceValue * Percent / 100));
                    float intfirst = ((Deal * coupon * fday) / 36500);
                    hfIntFirst.Value = intfirst.ToString();
                    float per = Percent;
                    float Pers = 0;
                    float interest = 0;
                    int UnitCount = Convert.ToInt32(hfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {

                        DateTime InsDate = InstallDate.AddMonths(i * 12);
                        DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dtm.Rows.Count > 0)
                        {

                            string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                            float perce = float.Parse(Perc);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float yearlyInterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                            float principal = (FaceValue * perce / 100);
                            hfYearlyInterest.Value = yearlyInterest.ToString();
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float Faces = (face - (FaceValue * perce / 100));
                            hfFaces.Value = Faces.ToString();
                            float total = (interest + ((face * coupon * days) / 36500));
                            interest = total;
                            face = Faces;
                            hfTotalInt.Value = interest.ToString();
                            float totalpercent = (Pers + perce);
                            Pers = totalpercent;
                            hfTotalPercent.Value = totalpercent.ToString();
                        }
                        else
                        {

                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float yearlyInterest = (((face * coupon * days) / 36500));
                            hfYearlyInterest.Value = yearlyInterest.ToString();
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float total = (interest + ((face * coupon * days) / 36500));
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                        }

                    }

                    DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objtime = (Maturity - Last);
                    float dayss = (float)objtime.TotalDays;
                    float facelast = float.Parse(hfFaces.Value);
                    float intLast = float.Parse(hfTotalInt.Value);
                    float lastpercent = float.Parse(hfTotalPercent.Value);
                    DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                    if (dtn.Rows.Count > 0)
                    {

                        string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                        float Percs = float.Parse(Perc);
                        float Fulltotapercent = (per + lastpercent + Percs);
                        float remainingpercent = (100 - Fulltotapercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                        float principal = (FaceValue * Percs / 100);
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();

                    }
                    else
                    {
                        float remainingpercent = (100 - lastpercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();

                    }

                }
                else
                {

                    float FirstYear = ((Deal * coupon * fday) / 36500);
                    hfFirstYearly.Value = FirstYear.ToString();
                    float intfirst = ((Deal * coupon * fday) / 36500);
                    DateTime lastDate = InstallDate;
                    float interest = 0;
                    float Pers = 0;
                    int UnitCount = Convert.ToInt32(hfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = InstallDate.AddMonths(i * 12);
                        DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dtm.Rows.Count > 0)
                        {
                            string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                            float perce = float.Parse(Perc);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float yearlyInterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce / 100));
                            hfYearlyInterest.Value = yearlyInterest.ToString();
                            float principal = (FaceValue * perce / 100);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float Faces = (Deal - (FaceValue * perce / 100));
                            hfFaces.Value = Faces.ToString();
                            float total = (interest + ((Deal * coupon * days) / 36500));
                            Deal = Faces;
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                            float totalpercent = (Pers + perce);
                            Pers = totalpercent;
                            hfTotalPercent.Value = totalpercent.ToString();
                        }
                        else
                        {
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float yearlyInterest = (((Deal * coupon * days) / 36500));
                            hfYearlyInterest.Value = yearlyInterest.ToString();
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                             float total = (interest + ((Deal * coupon * days) / 36500));
                            interest = total;
                            hfTotalInt.Value = interest.ToString();

                        }


                    }
                    DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objtime = (Maturity - Last);
                    float dayss = (float)objtime.TotalDays;
                    float facelast = float.Parse(hfFaces.Value);
                    float intLast = float.Parse(hfTotalInt.Value);
                    float lastpercent = float.Parse(hfTotalPercent.Value);
                    DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                    if (dtn.Rows.Count > 0)
                    {
                        string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                        float Percs = float.Parse(Perc);
                        float Fulltotapercent = (lastpercent + Percs);
                        float remainingpercent = (100 - Fulltotapercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                        float principal = (FaceValue * Percs / 100);
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();

                    }
                    else
                    {
                        float remainingpercent = (100 - lastpercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();

                    }

                }
                txtQuantity.Text = (FaceValue / FacevalueBond).ToString();
                txtPrincipalAmount.Text = Convert.ToDecimal(Rate * FaceValue / 100).ToString();
                txtAccured.Text = Convert.ToString(hfTotalFullInt.Value);
                float Accured = float.Parse(txtAccured.Text);
                txtGrossConder.Text = Convert.ToString((Rate * FaceValue / 100) + Accured);
                float GrossCo = float.Parse(txtGrossConder.Text);
                txtStampDuty.Text = Convert.ToInt32(GrossCo * 0.0001 / 100).ToString();
                txtConsiderationStamp.Text = Convert.ToString(GrossCo + (GrossCo * 0.0001 / 100));
                hfTotalConserationAmount.Value = txtConsiderationStamp.Text;

            }

            if (hfPaymentType.Value == "Quarterly")
            {
                DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                TimeSpan FirstDay = (InstallDate - Salltle);
                float fday = (float)FirstDay.TotalDays;
                DataTable dtc = dl.CheckMaturityTypeValue(hfProductsId.Value, hfIPDates.Value);
                if (dtc.Rows.Count > 0)
                {
                    string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                    float percent = float.Parse(Percentage.ToString());
                    float FirstQuarterly = (((Deal * coupon * fday) / 36500) + (FaceValue * percent / 100));
                    hfFirstQuarterly.Value = FirstQuarterly.ToString();
                    float Principal = (FaceValue * percent / 100);
                    float face = (Deal - (FaceValue * percent / 100));
                    float intfirst = ((Deal * coupon * fday) / 36500);
                    float interest = 0;
                    float per = percent;
                    float Pers = 0;
                    DateTime lastDate = InstallDate;
                    int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = InstallDate.AddMonths(i * 3);
                        DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dtm.Rows.Count > 0)
                        {
                            string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                            float perce = float.Parse(Perc);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float QuertarlyInterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                            hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                            float principal = (FaceValue * perce / 100);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float Faces = (face - (FaceValue * perce / 100));
                            hfFaces.Value = Faces.ToString();
                            float total = (interest + ((face * coupon * days) / 36500));
                            face = Faces;
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                            float totalpercent = (Pers + perce);
                            Pers = totalpercent;
                            hfTotalPercent.Value = totalpercent.ToString();
                        }
                        else
                        {
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float QuertarlyInterest = (((face * coupon * days) / 36500));
                            hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float total = (interest + ((face * coupon * days) / 36500));
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                        }

                    }
                    DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objtime = (Maturity - Last);
                    float dayss = (float)objtime.TotalDays;
                    float intLast = float.Parse(hfTotalInt.Value);
                    float lastpercent = float.Parse(hfTotalPercent.Value);
                    DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                    float facelast = float.Parse(hfFaces.Value);
                    if (dtn.Rows.Count > 0)
                    {
                        string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                        float Percs = float.Parse(Perc);
                        float Fulltotapercent = (per + lastpercent + Percs);
                        float remainingpercent = (100 - Fulltotapercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                        float principal = (FaceValue * Percs / 100);
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();

                    }
                    else
                    {
                        float remainingpercent = (100 - lastpercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500));
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                        hfTotalFullInt.Value = LastInterest.ToString();
                    }

                }
                else
                {
                    float FirstQuarterly = ((Deal * coupon * fday) / 36500);
                    hfFirstQuarterly.Value = FirstQuarterly.ToString();
                    float intfirst = ((Deal * coupon * fday) / 36500);
                    DateTime lastDate = InstallDate;
                    float interest = 0;
                    float Pers = 0;
                    int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = InstallDate.AddMonths(i * 3);
                        DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dtm.Rows.Count > 0)
                        {
                            string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                            float perce = float.Parse(Perc);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float QuertarlyInterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce / 100));
                            hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                            float principal = (FaceValue * perce / 100);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float Faces = (Deal - (FaceValue * perce / 100));
                            hfFaces.Value = Faces.ToString();
                            float total = (interest + ((Deal * coupon * days) / 36500));
                            Deal = Faces;
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                            float totalpercent = (Pers + perce);
                            Pers = totalpercent;
                            hfTotalPercent.Value = totalpercent.ToString();
                        }
                        else
                        {
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float QuertarlyInterest = (((Deal * coupon * days) / 36500));
                            hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float total = (interest + ((Deal * coupon * days) / 36500));
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                        }

                    }

                    DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objtime = (Maturity - Last);
                    float dayss = (float)objtime.TotalDays;
                    DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                    float intLast = float.Parse(hfTotalInt.Value);
                    float facelast = float.Parse(hfFaces.Value);
                    float lastpercent = float.Parse(hfTotalPercent.Value);
                    if (dtn.Rows.Count > 0)
                    {
                        string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                        float Percs = float.Parse(Perc);
                        float Fulltotapercent = (lastpercent + Percs);
                        float remainingpercent = (100 - Fulltotapercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                        float principal = (FaceValue * Percs / 100);
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();
                    }
                    else
                    {
                        float remainingpercent = (100 - lastpercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500));
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                        hfTotalFullInt.Value = LastInterest.ToString();
                    }
                }
                txtQuantity.Text = (FaceValue / FacevalueBond).ToString();
                txtPrincipalAmount.Text = Convert.ToDecimal(Rate * FaceValue / 100).ToString();
                txtAccured.Text = Convert.ToString(hfTotalFullInt.Value);
                float Accured = float.Parse(txtAccured.Text);
                txtGrossConder.Text = Convert.ToString((Rate * FaceValue / 100) + Accured);
                float GrossCo = float.Parse(txtGrossConder.Text);
                txtStampDuty.Text = Convert.ToInt32(GrossCo * 0.0001 / 100).ToString();
                txtConsiderationStamp.Text = Convert.ToString(GrossCo + (GrossCo * 0.0001 / 100));
                hfTotalConserationAmount.Value = txtConsiderationStamp.Text;

            }

            if (hfPaymentType.Value == "Half Yearly")
            {
                DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                TimeSpan FirstDay = (InstallDate - Salltle);
                float fday = (float)FirstDay.TotalDays;
                DataTable dtc = dl.CheckMaturityTypeValue(hfProductsId.Value, hfIPDates.Value);
                if (dtc.Rows.Count > 0)
                {
                    string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                    float percent = float.Parse(Percentage.ToString());
                    float FirstHalfY = (((Deal * coupon * fday) / 36500) + (FaceValue * percent / 100));
                    hfFirstHalf.Value = FirstHalfY.ToString();
                    float Principal = (FaceValue * percent / 100);
                    DateTime lastDate = InstallDate;
                    float intfirst = ((Deal * coupon * fday) / 36500);
                    float face = (Deal - (FaceValue * percent / 100));
                    float per = percent;
                    float Pers = 0;
                    float interest = 0;
                    int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = InstallDate.AddMonths(i * 6);
                        DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dtm.Rows.Count > 0)
                        {
                            string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                            float perce = float.Parse(Perc);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float halfInterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                            hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                            float principal = (FaceValue * perce / 100);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float Faces = (face - (FaceValue * perce / 100));
                            hfFaces.Value = Faces.ToString();
                            float total = (interest + ((face * coupon * days) / 36500));
                            face = Faces;
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                            float totalpercent = (Pers + perce);
                            Pers = totalpercent;
                            hfTotalPercent.Value = totalpercent.ToString();

                        }
                        else
                        {
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float halfInterest = (((face * coupon * days) / 36500));
                            hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float total = (interest + ((face * coupon * days) / 36500));
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                        }

                    }
                    DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objtime = (Maturity - Last);
                    float dayss = (float)objtime.TotalDays;
                    DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                    float intLast = float.Parse(hfTotalInt.Value);
                    float facelast = float.Parse(hfFaces.Value);
                    float lastpercent = float.Parse(hfTotalPercent.Value);
                    if (dtn.Rows.Count > 0)
                    {
                        string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                        float Percs = float.Parse(Perc);
                        float Fulltotapercent = (per + lastpercent + Percs);
                        float remainingpercent = (100 - Fulltotapercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                        float principal = (FaceValue * Percs / 100);
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();
                    }
                    else
                    {
                        float remainingpercent = (100 - lastpercent);
                        float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();
                    }

                }
                else
                {
                    float FirstHalfY = ((Deal * coupon * fday) / 36500);
                    hfFirstHalf.Value = FirstHalfY.ToString();
                    DateTime lastDate = InstallDate;
                    float intfirst = ((Deal * coupon * fday) / 36500);
                    float interest = 0;
                    float Pers = 0;
                    int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                    for (int i = 1; i < UnitCount + 1; i++)
                    {
                        DateTime InsDate = InstallDate.AddMonths(i * 6);
                        DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                        if (dtm.Rows.Count > 0)
                        {
                            string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                            float perce = float.Parse(Perc);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float halfInterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce / 100));
                            float principal = (FaceValue * perce / 100);
                            hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float Faces = (Deal - (FaceValue * perce / 100));
                            hfFaces.Value = Faces.ToString();
                            float total = (interest + ((Deal * coupon * days) / 36500));
                            Deal = Faces;
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                            float totalpercent = (Pers + perce);
                            Pers = totalpercent;
                            hfTotalPercent.Value = totalpercent.ToString();
                        }
                        else
                        {
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float halfInterest = (((Deal * coupon * days) / 36500));
                            hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            float total = (interest + ((Deal * coupon * days) / 36500));
                            interest = total;
                            hfTotalInt.Value = interest.ToString();
                        }

                    }
                    DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan objtime = (Maturity - Last);
                    float dayss = (float)objtime.TotalDays;
                    DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                    float intLast = float.Parse(hfTotalInt.Value);
                    float facelast = float.Parse(hfFaces.Value);
                    float lastpercent = float.Parse(hfTotalPercent.Value);
                    if (dtn.Rows.Count > 0)
                    {
                        string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                        float Percs = float.Parse(Perc);
                        float Fulltotapercent = (lastpercent + Percs);
                        float remainingpercent = (100 - Fulltotapercent);
                        float LastYearly = (((Deal * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                        float principal = (FaceValue * Percs / 100);
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();
                    }
                    else
                    {
                        float remainingpercent = (100 - lastpercent);
                        float LastYearly = (((Deal * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                        float LastInterest = (intfirst + intLast + ((facelast * coupon * dayss) / 36500));
                        hfTotalFullInt.Value = LastInterest.ToString();
                    }

                }
                txtQuantity.Text = (FaceValue / FacevalueBond).ToString();
                txtPrincipalAmount.Text = Convert.ToDecimal(Rate * FaceValue / 100).ToString();
                txtAccured.Text = Convert.ToString(hfTotalFullInt.Value);
                float Accured = float.Parse(txtAccured.Text);
                txtGrossConder.Text = Convert.ToString((Rate * FaceValue / 100) + Accured);
                float GrossCo = float.Parse(txtGrossConder.Text);
                txtStampDuty.Text = Convert.ToInt32(GrossCo * 0.0001 / 100).ToString();
                txtConsiderationStamp.Text = Convert.ToString(GrossCo + (GrossCo * 0.0001 / 100));
                hfTotalConserationAmount.Value = txtConsiderationStamp.Text;
            }

        }
    }
       

    private void PaymentType()
    {
        foreach (RepeaterItem item in rptBondCalculator.Items)
        {
            TextBox txtNumber = (TextBox)item.FindControl("txtNumberDays");
            TextBox ddlPaymentType = (TextBox)item.FindControl("ddlPaymentType");
            hfPaymentType.Value = ddlPaymentType.Text;
            if (ddlPaymentType.Text == "Monthly")
            {
                float Year = float.Parse(hfTotalYear.Value);
                float Month = float.Parse(hfTotalMonth.Value);
                float Day = float.Parse(hfTotalDay.Value);
                txtNumber.Text = hfDayValue.Value;

                var totalMonths = ((Year * 12) + Month);
                hfMonth.Value = totalMonths.ToString();
                hfRemainingDay.Value = Day.ToString();
            }
            if (ddlPaymentType.Text == "Yearly")
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
                txtNumber.Text = hfDayValue.Value;
            }
            if (ddlPaymentType.Text == "Quarterly")
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
                txtNumber.Text = hfDayValue.Value;
            }
            if (ddlPaymentType.Text == "Half Yearly")
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
                txtNumber.Text = hfDayValue.Value;
            }

        }
    }


    protected void txtSattlementdate_TextChanged(object sender, EventArgs e)
    {

        TextBox txtSattlementdate = sender as TextBox;

        RepeaterItem item = (RepeaterItem)txtSattlementdate.NamingContainer;

        TextBox txtLastIP = (TextBox)item.FindControl("txtLastIP");
        TextBox ddlPaymentType = (TextBox)item.FindControl("ddlPaymentType");
        DateTime Sattles = DateTime.ParseExact(txtSattlementdate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        DateTime IPDat = DateTime.ParseExact(txtLastIP.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        DateTime IPDate = DateTime.ParseExact(txtLastIP.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        DateTime Sattle = DateTime.ParseExact(txtSattlementdate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        hfSattlementDate.Value = txtSattlementdate.Text;
        hfIPDate.Value = txtLastIP.Text;

        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);

        if (ddlPaymentType.Text == "Monthly")
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


            }
            else
            {
                if (hfEOM.Value == "1")
                {
                    DataTable dt = dl.get_LastMonthlyDate(Sattles, IPDat);
                    string Date = dt.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;

                    DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
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
                }
                else
                {
                    DataTable dt = dl.get_MonthlyDate(Sattles, IPDat);
                    string Date = dt.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;

                    DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
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
                }
            }
        }
        if (ddlPaymentType.Text == "Yearly")
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


            }
            else
            {

                DataTable dt = dl.get_YearlyDate(Sattle, IPDate);
                if (dt.Rows.Count > 0)
                {
                    string Date = dt.Rows[0]["mth_start"].ToString();
                    hfQuar.Value = Date;
                }


                DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
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
            }
        }

        if (ddlPaymentType.Text == "Quarterly")
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


            }
            else
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
                    }
                }
            }
        }

        if (ddlPaymentType.Text == "Half Yearly")
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


            }
            else
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
                    }
                }
                else
                {
                    DataTable dt = dl.get_HalfYearlyDate(Sattles, IPDat);
                    if (dt.Rows.Count > 0)
                    {
                        string Date = dt.Rows[0]["mth_start"].ToString();
                        hfQuar.Value = Date;


                        DateTime IPDates = DateTime.ParseExact(hfQuar.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        hfIPDates.Value = IPDates.ToString("dd/MM/yyyy").Replace("-", "/");
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
                    }
                }
            }
        }

    }

    private void createPerticularsTables()
    {
        DataTable dt = new DataTable();
        DataColumn columnAutoID = new DataColumn("AutoID", typeof(int));
        columnAutoID.AutoIncrement = true;
        columnAutoID.AutoIncrementSeed = 1;
        dt.Columns.Add(columnAutoID);
        dt.Columns.Add(new DataColumn("InterestDate", typeof(string)));
        //  dt.Columns.Add(new DataColumn("SLItemName", typeof(string)));

        dt.Columns.Add(new DataColumn("CouponRate", typeof(string)));
        dt.Columns.Add(new DataColumn("InterestValue", typeof(string)));
        dt.Columns.Add(new DataColumn("PrincipalAmount", typeof(string)));
        dt.Columns.Add(new DataColumn("Percentage", typeof(string)));
        dt.Columns.Add(new DataColumn("MonthDayValue", typeof(string)));

        dt.Rows.Clear();
        Session["dtPerticularss"] = dt;
        BindPerticularss(dt);
    }

    private void AddPerticularItems(string InterestDate, string CouponRate, string InterestValue,string PrincipalAmount,string Percentage, string MonthDayValue)
    {
        DataTable dtPerticulars = new DataTable();
        if (Session["dtPerticularss"] == null)
        {
            createPerticularsTables();
        }
        dtPerticulars = (DataTable)Session["dtPerticularss"];
        DataRow row = dtPerticulars.NewRow();

        row["InterestDate"] = InterestDate;
        row["CouponRate"] = CouponRate;
        row["InterestValue"] = InterestValue;
        row["PrincipalAmount"] = PrincipalAmount;
        row["Percentage"] = Percentage;
        row["MonthDayValue"] = MonthDayValue;

        dtPerticulars.Rows.Add(row);
        Session["dtPerticularss"] = dtPerticulars;
        BindPerticularss(dtPerticulars);

    }

    private void BindPerticularss(DataTable dtPerticulars)
    {

        rptStaggeredSheet.DataSource = dtPerticulars;
        rptStaggeredSheet.DataBind();

    }
    private void createPerticularsTable()
    {
        DataTable dt = new DataTable();
        DataColumn columnAutoID = new DataColumn("AutoID", typeof(int));
        columnAutoID.AutoIncrement = true;
        columnAutoID.AutoIncrementSeed = 1;
        dt.Columns.Add(columnAutoID);
        dt.Columns.Add(new DataColumn("InterestDate", typeof(string)));
        //  dt.Columns.Add(new DataColumn("SLItemName", typeof(string)));

        dt.Columns.Add(new DataColumn("CouponRate", typeof(string)));
        dt.Columns.Add(new DataColumn("InterestValue", typeof(string)));
        dt.Columns.Add(new DataColumn("MonthDayValue", typeof(string)));

        dt.Rows.Clear();
        Session["dtPerticulars"] = dt;
        BindPerticulars(dt);

    }

    private void AddPerticularItem(string InterestDate, string CouponRate, string InterestValue, string MonthDayValue)
    {
        DataTable dtPerticulars = new DataTable();
        if (Session["dtPerticulars"] == null)
        {
            createPerticularsTable();
        }
        dtPerticulars = (DataTable)Session["dtPerticulars"];
        DataRow row = dtPerticulars.NewRow();

        row["InterestDate"] = InterestDate;
        row["CouponRate"] = CouponRate;
        row["InterestValue"] = InterestValue;
        row["MonthDayValue"] = MonthDayValue;

        dtPerticulars.Rows.Add(row);
        Session["dtPerticulars"] = dtPerticulars;
        BindPerticulars(dtPerticulars);

    }
    private void BindPerticulars(DataTable dtPerticulars)
    {

        rptCash.DataSource = dtPerticulars;
        rptCash.DataBind();

    }

    protected void lnkInterestSheet_Click(object sender, EventArgs e)
    {
        if (hfSattlementDate.Value == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Sattlement Date Must Be Enter', type: 'error',});", true);
            return;
        }
        createPerticularsTable();
        dl.add_CashFlowView(null, GetUserLoggedIn(), hfProductsId.Value, hfPaymentType.Value, hfSattlementDate.Value, hfIPDate.Value, hfFacrValueForDeal.Value, hfTotalConserationAmount.Value, hfQuantity.Value, hfPrincipalAmount.Value, hfTotalAssuredInterest.Value, hfGrossConsideration.Value,hfRatePrice.Value);
        int IId = dl.add_CashFlows(null, GetUserLoggedIn(), hfProductsId.Value, hfPaymentType.Value, hfFacrValueForDeal.Value);
        float Deal = float.Parse(hfFacrValueForDeal.Value);
        float coupon = float.Parse(hfCouponRate.Value);
        float Rate = float.Parse(hfRatePrice.Value);
        float FaceValue = float.Parse(hfFacrValueForDeal.Value);
        DateTime IPDate = DateTime.ParseExact(hfIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        DateTime Sattle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);


        if (ViewState["Id"] == null)
        {
            if (hfMaturityType.Value == "Bullet")
            {
                if (hfPaymentType.Value == "Monthly")
                {
                    if (IPDate > Sattle)
                    {
                        DateTime Salltle = Sattle;
                        DateTime InstallDate = IPDate;
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        float FirstMonth = ((Deal * coupon * fday) / 36500);
                        hfFirstMonthly.Value = FirstMonth.ToString();
                        AddPerticularItem(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstMonthly.Value, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstMonthly.Value, null);

                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfMonth.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float monthlyinterest = (((Deal * coupon * days) / 36500));
                            hfMonthlyInterest.Value = monthlyinterest.ToString();
                            AddPerticularItem(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfMonthlyInterest.Value, days.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMonthlyInterest.Value, null);
                            lastDate = InsDate;
                        }

                        float LastMonthInt = float.Parse(hfRemainingDay.Value);
                        float LastMonth = (((Deal * coupon * LastMonthInt) / 36500) + (Rate * FaceValue / 100));
                        hfLastMonthly.Value = LastMonth.ToString();
                        AddPerticularItem(hfMaturityDate.Value, hfCouponRate.Value, hfLastMonthly.Value, LastMonthInt.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), LastMonthInt.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastMonth.ToString(), null);
                    }
                    else
                    {
                        DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        float FirstMonth = ((Deal * coupon * fday) / 36500);
                        hfFirstMonthly.Value = FirstMonth.ToString();
                        AddPerticularItem(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstMonthly.Value, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstMonthly.Value, null);
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfMonth.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float monthlyinterest = (((Deal * coupon * days) / 36500));
                            hfMonthlyInterest.Value = monthlyinterest.ToString();
                            AddPerticularItem(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfMonthlyInterest.Value, days.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMonthlyInterest.Value, null);
                            lastDate = InsDate;
                        }
                        float LastMonthInt = float.Parse(hfRemainingDay.Value);
                        float LastMonth = (((Deal * coupon * LastMonthInt) / 36500) + (Rate * FaceValue / 100));
                        hfLastMonthly.Value = LastMonth.ToString();
                        AddPerticularItem(hfMaturityDate.Value, hfCouponRate.Value, hfLastMonthly.Value, LastMonthInt.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), LastMonthInt.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, hfLastMonthly.Value, null);
                    }

                }
                if (hfPaymentType.Value == "Yearly")
                {
                    if (IPDate > Sattle)
                    {
                        DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime InstallDate = DateTime.ParseExact(hfIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        float FirstYear = ((Deal * coupon * fday) / 36500);
                        hfFirstYearly.Value = FirstYear.ToString();

                        AddPerticularItem(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstYearly.Value, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstYearly.Value, null);
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {

                            DateTime InsDate = InstallDate.AddMonths(i * 12);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float yearlyInterest = (((Deal * coupon * days) / 36500));
                            hfYearlyInterest.Value = yearlyInterest.ToString();
                            AddPerticularItem(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfYearlyInterest.Value, days.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfYearlyInterest.Value, null);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500) + (Rate * FaceValue / 100));
                        AddPerticularItem(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(), dayss.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                    }
                    else
                    {
                        DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        float FirstYear = ((Deal * coupon * fday) / 36500);
                        hfFirstYearly.Value = FirstYear.ToString();
                        AddPerticularItem(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstYearly.Value, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstYearly.Value, null);
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {

                            DateTime InsDate = InstallDate.AddMonths(i * 12);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float yearlyInterest = (((Deal * coupon * days) / 36500));
                            hfYearlyInterest.Value = yearlyInterest.ToString();
                            AddPerticularItem(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfYearlyInterest.Value, days.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfYearlyInterest.Value, null);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500) + (Rate * FaceValue / 100));
                        AddPerticularItem(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(), dayss.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                    }


                }
                if (hfPaymentType.Value == "Quarterly")
                {
                    if (IPDate > Sattle)
                    {
                        DateTime InstallDate = DateTime.ParseExact(hfIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        float FirstQuarterly = ((Deal * coupon * fday) / 36500);
                        hfFirstQuarterly.Value = FirstQuarterly.ToString();
                        AddPerticularItem(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstQuarterly.Value, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstQuarterly.Value, null);
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 3);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float QuertarlyInterest = (((Deal * coupon * days) / 36500));
                            hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                            AddPerticularItem(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfQuarterlyInterest.Value, days.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfQuarterlyInterest.Value, null);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500) + (Rate * FaceValue / 100));
                        AddPerticularItem(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(), dayss.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.ToString(), hfMaturityDate.Value, LastYearly.ToString(), null);
                    }
                    else
                    {
                        DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        float FirstQuarterly = ((Deal * coupon * fday) / 36500);
                        hfFirstQuarterly.Value = FirstQuarterly.ToString();
                        AddPerticularItem(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstQuarterly.Value, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstQuarterly.Value, null);
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 3);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float QuertarlyInterest = (((Deal * coupon * days) / 36500));
                            hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                            AddPerticularItem(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfQuarterlyInterest.Value, days.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfQuarterlyInterest.Value, null);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500) + (Rate * FaceValue / 100));
                        AddPerticularItem(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(), dayss.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                    }


                }
                if (hfPaymentType.Value == "Half Yearly")
                {
                    if (IPDate > Sattle)
                    {
                        DateTime InstallDate = DateTime.ParseExact(hfIPDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        float FirstHalfY = ((Deal * coupon * fday) / 36500);
                        hfFirstHalf.Value = FirstHalfY.ToString();
                        AddPerticularItem(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstHalf.Value, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstHalf.Value, null);
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 6);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float halfInterest = (((Deal * coupon * days) / 36500));
                            hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                            AddPerticularItem(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfHalfYearlyInterest.Value, days.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfHalfYearlyInterest.Value, null);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500) + (Rate * FaceValue / 100));
                        AddPerticularItem(hfMaturityDate.Value, dayss.ToString(), hfCouponRate.Value, LastYearly.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                    }
                    else
                    {
                        DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        float fday = (float)FirstDay.TotalDays;
                        float FirstHalfY = ((Deal * coupon * fday) / 36500);
                        hfFirstHalf.Value = FirstHalfY.ToString();
                        AddPerticularItem(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstHalf.Value, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstHalf.Value, null);
                        DateTime lastDate = InstallDate;
                        int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 6);
                            TimeSpan objTimeSpan = InsDate - lastDate;
                            float days = (float)objTimeSpan.TotalDays;
                            float halfInterest = (((Deal * coupon * days) / 36500));
                            hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                            AddPerticularItem(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfHalfYearlyInterest.Value, days.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfHalfYearlyInterest.Value, null);
                            lastDate = InsDate;
                            hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float LastYearly = (((Deal * coupon * dayss) / 36500) + (Rate * FaceValue / 100));
                        AddPerticularItem(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(), dayss.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                    }

                }
            }
            if (hfMaturityType.Value == "Staggered")
            {
                if (hfPaymentType.Value == "Monthly")
                {
                    if (IPDate < Sattle)
                    {
                        DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    
                        TimeSpan FirstDay = (InstallDate - Salltle);
                        DataTable dtc = dl.CheckMaturityTypeValue(hfProductsId.Value, hfIPDates.Value);
                        if (dtc.Rows.Count > 0)
                        {
                            string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                            float percent = float.Parse(Percentage.ToString());

                            float fday = (float)FirstDay.TotalDays;
                            float FirstMonth = (((Deal * coupon * fday) / 36500) + (FaceValue * percent / 100));
                            float Principal = (FaceValue * percent / 100);
                            hfFirstMonthly.Value = FirstMonth.ToString();
                            AddPerticularItems(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstMonthly.Value,Principal.ToString(),percent.ToString(), fday.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstMonthly.Value, null);
                            float face = (Deal - (FaceValue * percent / 100));
                            hfLastDates.Value = InstallDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            DateTime lastDate = InstallDate;
                            float per = percent;
                            float Pers = 0;
                            int UnitCount = Convert.ToInt32(hfMonth.Value);
                            for (int i = 1; i < UnitCount + 1; i++)
                            {
                                DateTime InsDate = InstallDate.AddMonths(i);
                                DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                                if (dtm.Rows.Count > 0)
                                {
                                    //float fas = float.Parse(hfFaceee.Value);
                                    string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                    float perce = float.Parse(Perc);
                                    TimeSpan objTimeSpan = InsDate - lastDate;
                                    float days = (float)objTimeSpan.TotalDays;
                                    float monthlyinterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                                    float principal = ((FaceValue * perce / 100));
                                    hfMonthlyInterest.Value = monthlyinterest.ToString();
                                    AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfMonthlyInterest.Value,principal.ToString(),perce.ToString(), days.ToString());
                                    dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMonthlyInterest.Value, null);
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
                                    hfMonthlyInterest.Value = monthlyinterest.ToString();
                                    AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfMonthlyInterest.Value,null,null, days.ToString());
                                    dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMonthlyInterest.Value, null);
                                    lastDate = InsDate;
                                }

                            }

                            DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                            float facelast = float.Parse(hfFaces.Value);
                            float lastpercent = float.Parse(hfTotalPercent.Value);
                            if (dtn.Rows.Count > 0)
                            {
                                string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                                float Percs = float.Parse(Perc);
                                float Fulltotapercent = (per + lastpercent + Percs);
                                float remainingpercent = (100 - Fulltotapercent);
                                float LastMonthInt = float.Parse(hfRemainingDay.Value);
                                float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * Percs /100) + (FaceValue * remainingpercent /100));
                                float principal = (FaceValue * Percs / 100);
                                hfLastMonthly.Value = LastMonth.ToString();
                                AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, hfLastMonthly.Value,principal.ToString(),Percs.ToString(), LastMonthInt.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), LastMonthInt.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, hfLastMonthly.Value, null);
                            }
                            else
                            {
                                float remainingpercent = (100 - lastpercent);
                                float LastMonthInt = float.Parse(hfRemainingDay.Value);
                                float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * remainingpercent /100));
                                hfLastMonthly.Value = LastMonth.ToString();
                                AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, hfLastMonthly.Value,null,null, LastMonthInt.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), LastMonthInt.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, hfLastMonthly.Value, null);
                            }


                        }
                        else
                        {
                            float fday = (float)FirstDay.TotalDays;
                            float FirstMonth = ((Deal * coupon * fday) / 36500);
                            hfFirstMonthly.Value = FirstMonth.ToString();
                            AddPerticularItems(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstMonthly.Value,null,null, fday.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstMonthly.Value, null);
                            hfLastDates.Value = InstallDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            DateTime lastDate = InstallDate;
                            float Pers = 0;
                            int UnitCount = Convert.ToInt32(hfMonth.Value);
                            for (int i = 1; i < UnitCount + 1; i++)
                            {
                                
                                DateTime InsDate = InstallDate.AddMonths(i);
                                DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                                if (dtm.Rows.Count > 0)
                                {
                                    string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                    float perce = float.Parse(Perc);
                                    TimeSpan objTimeSpan = InsDate - lastDate;
                                    float days = (float)objTimeSpan.TotalDays;
                                    float monthlyinterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce / 100));
                                    float principal = (FaceValue * perce / 100);
                                    hfMonthlyInterest.Value = monthlyinterest.ToString();
                                    AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfMonthlyInterest.Value,principal.ToString(),perce.ToString(), days.ToString());
                                    dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMonthlyInterest.Value, null);
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
                                    hfMonthlyInterest.Value = monthlyinterest.ToString();
                                    AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfMonthlyInterest.Value,null,null, days.ToString());
                                    dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfMonthlyInterest.Value, null);
                                    lastDate = InsDate;


                                }

                            }

                            DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                            float facelast = float.Parse(hfFaces.Value);
                            float lastpercent = float.Parse(hfTotalPercent.Value);
                            if (dtn.Rows.Count > 0)
                            {
                                string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                                float Percs = float.Parse(Perc);
                                float Fulltotalpercent = (lastpercent + Percs);
                                float remainingpercent = (100 -  Fulltotalpercent);
                                float LastMonthInt = float.Parse(hfRemainingDay.Value);
                                float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                                float principal = (FaceValue * Percs / 100);
                                hfLastMonthly.Value = LastMonth.ToString();
                                AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, hfLastMonthly.Value,principal.ToString(),Percs.ToString(), LastMonthInt.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), LastMonthInt.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, hfLastMonthly.Value, null);
                            }
                            else
                            {
                                float remainingpercent = (100 - lastpercent);
                                float LastMonthInt = float.Parse(hfRemainingDay.Value);
                                float LastMonth = (((facelast * coupon * LastMonthInt) / 36500) + (FaceValue * remainingpercent /100));
                                hfLastMonthly.Value = LastMonth.ToString();
                                AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, hfLastMonthly.Value,null,null, LastMonthInt.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), LastMonthInt.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, hfLastMonthly.Value, null);
                            }
                        }

                    }
                }

                if(hfPaymentType.Value == "Yearly")
                {
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    DataTable dt = dl.CheckMaturityTypeValue(hfProductsId.Value, hfIPDates.Value);
                    if (dt.Rows.Count > 0)
                    {
                        string Percentage = dt.Rows[0]["MaturityTypePercentage"].ToString();
                        float Percent = float.Parse(Percentage);
                        float FirstYear = (((Deal * coupon * fday) / 36500) + (FaceValue * Percent /100));
                        float Principal = (FaceValue * Percent / 100);
                        hfFirstYearly.Value = FirstYear.ToString();
                        AddPerticularItems(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstYearly.Value,Principal.ToString(),Percent.ToString(), fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstYearly.Value, null);
                        DateTime lastDate = InstallDate;
                        
                        float face = (FaceValue - (FaceValue * Percent / 100));
                        float per = Percent;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {

                            DateTime InsDate = InstallDate.AddMonths(i * 12);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {

                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);

                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float yearlyInterest = (((face * coupon * days) / 36500) + (FaceValue * perce / 100));
                                float principal = (FaceValue * perce / 100);
                                hfYearlyInterest.Value = yearlyInterest.ToString();
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfYearlyInterest.Value,principal.ToString(),perce.ToString(), days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfYearlyInterest.Value, null);
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
                                float yearlyInterest = (((face * coupon * days) / 36500));
                                hfYearlyInterest.Value = yearlyInterest.ToString();
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfYearlyInterest.Value,null,null, days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfYearlyInterest.Value, null);
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }

                        }

                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                        if(dtn.Rows.Count > 0 )
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (per + lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotalpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                            float principal = (FaceValue * Percs / 100);
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),principal.ToString(),Percs.ToString(), dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),null,null, dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }

                    }
                    else
                    {

                        float FirstYear = ((Deal * coupon * fday) / 36500);
                        hfFirstYearly.Value = FirstYear.ToString();
                        AddPerticularItems(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstYearly.Value,null,null, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstYearly.Value, null);
                        DateTime lastDate = InstallDate;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 12);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float yearlyInterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce /100));
                                hfYearlyInterest.Value = yearlyInterest.ToString();
                                float principal = (FaceValue * perce / 100);
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfYearlyInterest.Value,principal.ToString(),perce.ToString(), days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfYearlyInterest.Value, null);
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
                                hfYearlyInterest.Value = yearlyInterest.ToString();
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfYearlyInterest.Value,null,null, days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfYearlyInterest.Value, null);
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }


                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                        if (dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (lastpercent + Percs);
                            float remaingpercent = (100 - Fulltotalpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remaingpercent /100));
                            float principal = (FaceValue * Percs / 100);
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),principal.ToString(),Percs.ToString(), dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),null,null, dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }

                    }

                }

                if(hfPaymentType.Value == "Quarterly")
                {
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    DataTable dtc = dl.CheckMaturityTypeValue(hfProductsId.Value, hfIPDates.Value);
                    if(dtc.Rows.Count > 0)
                    {
                        string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                        float percent = float.Parse(Percentage.ToString());
                        float FirstQuarterly = (((Deal * coupon * fday) / 36500) + (FaceValue * percent /100));
                        hfFirstQuarterly.Value = FirstQuarterly.ToString();
                        float Principal = (FaceValue * percent / 100);
                        AddPerticularItems(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstQuarterly.Value,Principal.ToString(),percent.ToString(), fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstQuarterly.Value, null);
                        float face = (Deal - (FaceValue * percent / 100));
                        DateTime lastDate = InstallDate;
                        float per = percent;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 3);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float QuertarlyInterest = (((face * coupon * days) / 36500) + (FaceValue * perce /100));
                                hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                                float principal = (FaceValue * perce / 100);
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfQuarterlyInterest.Value,principal.ToString(),perce.ToString(), days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfQuarterlyInterest.Value, null);
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                                float Faces = (face - (FaceValue * perce / 100));
                                hfFaces.Value = Faces.ToString();
                                face = Faces;
                                float totalpercent = (Pers + perce);
                                hfTotalPercent.Value = totalpercent.ToString(); 
                            }
                            else
                            {
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float QuertarlyInterest = (((face * coupon * days) / 36500));
                                hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfQuarterlyInterest.Value,null,null, days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfQuarterlyInterest.Value, null);
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }

                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        float lastpercent = float.Parse(hfTotalPercent.Value);  
                        if (dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (per + lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotalpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                            float principal = (FaceValue * Percs / 100);
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),principal.ToString(),Percs.ToString(), dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),null,null, dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }

                    }
                    else
                    {
                        float FirstQuarterly = ((Deal * coupon * fday) / 36500);
                        hfFirstQuarterly.Value = FirstQuarterly.ToString();
                        AddPerticularItems(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstQuarterly.Value,null,null, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstQuarterly.Value, null);
                        DateTime lastDate = InstallDate;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfQuerterly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 3);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float QuertarlyInterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce /100));
                                hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                                float principal = (FaceValue * perce / 100);
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfQuarterlyInterest.Value,principal.ToString(),perce.ToString(), days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfQuarterlyInterest.Value, null);
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
                                hfQuarterlyInterest.Value = QuertarlyInterest.ToString();
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfQuarterlyInterest.Value,null,null, days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfQuarterlyInterest.Value, null);
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }

                        }

                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        if (dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotalpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                            float principal = (FaceValue * Percs / 100);
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),principal.ToString(),Percs.ToString(), dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),null,null, dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }
                    }

                }
                if(hfPaymentType.Value == "Half Yearly")
                {
                    DateTime InstallDate = DateTime.ParseExact(hfIPDates.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime Salltle = DateTime.ParseExact(hfSattlementDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    TimeSpan FirstDay = (InstallDate - Salltle);
                    float fday = (float)FirstDay.TotalDays;
                    DataTable dtc = dl.CheckMaturityTypeValue(hfProductsId.Value, hfIPDates.Value);
                    if(dtc.Rows.Count > 0)
                    {
                        string Percentage = dtc.Rows[0]["MaturityTypePercentage"].ToString();
                        float percent = float.Parse(Percentage.ToString());
                        float FirstHalfY = (((Deal * coupon * fday) / 36500) + (FaceValue * percent /100));
                        hfFirstHalf.Value = FirstHalfY.ToString();
                        float Principal = (FaceValue * percent / 100);
                        AddPerticularItems(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstHalf.Value,Principal.ToString(),percent.ToString(), fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstHalf.Value, null);
                        DateTime lastDate = InstallDate;
                        float face = (Deal - (FaceValue * percent / 100));
                        float per = percent;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 6);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float halfInterest = (((face * coupon * days) / 36500) + (FaceValue * perce /100));
                                hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                                float principal = (FaceValue * perce / 100);
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfHalfYearlyInterest.Value,principal.ToString(),perce.ToString(), days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfHalfYearlyInterest.Value, null);
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
                                hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfHalfYearlyInterest.Value,null,null, days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfHalfYearlyInterest.Value, null);
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }

                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        if(dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (per + lastpercent + Percs);
                            float remainingpercent = (100 - Fulltotalpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                            float principal = (FaceValue * Percs / 100);
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),principal.ToString(),Percs.ToString(), dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((facelast * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),null,null, dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }

                    }
                    else
                    {
                        float FirstHalfY = ((Deal * coupon * fday) / 36500);
                        hfFirstHalf.Value = FirstHalfY.ToString();
                        AddPerticularItems(InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfFirstHalf.Value,null,null, fday.ToString());
                        dl.add_CashFlowViewDetails(null, IId.ToString(), fday.ToString(), GetUserLoggedIn(), hfProductsId.Value, InstallDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfFirstHalf.Value, null);
                        DateTime lastDate = InstallDate;
                        float Pers = 0;
                        int UnitCount = Convert.ToInt32(hfHalfYearly.Value);
                        for (int i = 1; i < UnitCount + 1; i++)
                        {
                            DateTime InsDate = InstallDate.AddMonths(i * 6);
                            DataTable dtm = dl.CheckMaturityTypeValue(hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"));
                            if(dtm.Rows.Count > 0)
                            {
                                string Perc = dtm.Rows[0]["MaturityTypePercentage"].ToString();
                                float perce = float.Parse(Perc);
                                TimeSpan objTimeSpan = InsDate - lastDate;
                                float days = (float)objTimeSpan.TotalDays;
                                float halfInterest = (((Deal * coupon * days) / 36500) + (FaceValue * perce /100));
                                float principal = (FaceValue * perce / 100);
                                hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfHalfYearlyInterest.Value,principal.ToString(),perce.ToString(), days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfHalfYearlyInterest.Value, null);
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
                                hfHalfYearlyInterest.Value = Convert.ToDecimal(halfInterest).ToString();
                                AddPerticularItems(InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfCouponRate.Value, hfHalfYearlyInterest.Value,null,null, days.ToString());
                                dl.add_CashFlowViewDetails(null, IId.ToString(), days.ToString(), GetUserLoggedIn(), hfProductsId.Value, InsDate.ToString("dd/MM/yyyy").Replace("-", "/"), hfHalfYearlyInterest.Value, null);
                                lastDate = InsDate;
                                hfLastDate.Value = lastDate.ToString("dd/MM/yyyy").Replace("-", "/");
                            }

                        }
                        DateTime Maturity = DateTime.ParseExact(hfMaturityDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime Last = DateTime.ParseExact(hfLastDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        TimeSpan objtime = (Maturity - Last);
                        float dayss = (float)objtime.TotalDays;
                        float lastpercent = float.Parse(hfTotalPercent.Value);
                        DataTable dtn = dl.CheckMaturityTypeValue(hfProductsId.Value, hfMaturityDate.Value);
                        float facelast = float.Parse(hfFaces.Value);
                        if(dtn.Rows.Count > 0)
                        {
                            string Perc = dtn.Rows[0]["MaturityTypePercentage"].ToString();
                            float Percs = float.Parse(Perc);
                            float Fulltotalpercent = (lastpercent +  Percs);
                            float remainingpercent = (100 - Fulltotalpercent);
                            float LastYearly = (((Deal * coupon * dayss) / 36500) + (FaceValue * Percs / 100) + (FaceValue * remainingpercent /100));
                            float principal = (FaceValue * Percs / 100);
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),principal.ToString(),Percs.ToString(), dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }
                        else
                        {
                            float remainingpercent = (100 - lastpercent);
                            float LastYearly = (((Deal * coupon * dayss) / 36500) + (FaceValue * remainingpercent /100));
                            AddPerticularItems(hfMaturityDate.Value, hfCouponRate.Value, LastYearly.ToString(),null,null, dayss.ToString());
                            dl.add_CashFlowViewDetails(null, IId.ToString(), dayss.ToString(), GetUserLoggedIn(), hfProductsId.Value, hfMaturityDate.Value, LastYearly.ToString(), null);
                        }

                    }

                }
            }
            
            BindInterestView();
        }
    }

    protected void rptChart_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //Panel pnlTimelineShow = (e.Item.FindControl("pnlTimelineShow") as Panel);
            //Panel pnlTimeLineFill = (e.Item.FindControl("pnlTimeLineFill") as Panel);
            //HiddenField hfInterest = (e.Item.FindControl("hfInterest") as HiddenField);
            //    if (hfInterest.Value == "Approved")
            //    {
            //        pnlTimeLineFill.Visible = true;
            //        pnlTimelineShow.Visible = false;
            //    }
            //    if (hfInterest.Value == "Pending")
            //    {
            //        pnlTimeLineFill.Visible = false;
            //        pnlTimelineShow.Visible = true;
            //    }



        }
    }


    protected void rptChartFace_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hfCashFlowId = (e.Item.FindControl("hfCashFlowId") as HiddenField);
            Repeater rptChart = (e.Item.FindControl("rptChart") as Repeater);
            rptChart.DataSource = dl.get_CashFlowViewDetails(null, hfCashFlowId.Value, GetUserLoggedIn(), hfProductsId.Value, null);
            rptChart.DataBind();

        }
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
    }



}
