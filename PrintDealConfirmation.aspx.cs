using DocumentFormat.OpenXml.Bibliography;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintDealConfirmation : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["oId"].ToString() != null)
            {
                DealConfirmationPrint(Request.QueryString["oId"].ToString());
            }
            UserDetails();
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

    private void UserDetails()
    {
        DataTable dt = dl.getCustomer(GetUserLoggedIn(), true);
        if (dt.Rows.Count > 0)
        {
            lblCustomer.Text = dt.Rows[0]["CFullName"].ToString();
            lblCustomerName.Text = dt.Rows[0]["CFullName"].ToString();
        }
    }
    private void DealConfirmationPrint(string Data)
    {
        DataTable dt = dl.get_DealConfirmation(Data, null, GetUserLoggedIn(), true);
        if(dt.Rows.Count > 0)
        {
            lblDealDate.Text = dt.Rows[0]["DDealDate"].ToString();
            lblSattlementDate.Text = dt.Rows[0]["DSattlementDate"].ToString();
            lblSecurity.Text = dt.Rows[0]["Security"].ToString();
            lblISINNumber.Text = dt.Rows[0]["ISINNumber"].ToString();
            lblCouponRate.Text = dt.Rows[0]["CouponRate"].ToString();
            lblMaturityDate.Text = dt.Rows[0]["MaturityDate"].ToString();
            lblIPDate.Text = dt.Rows[0]["IPDate"].ToString();
            lblMaturitytype.Text = dt.Rows[0]["MaturityType"].ToString();
            lblPutDate.Text = dt.Rows[0]["PutCallDate"].ToString();
            lblCallDate.Text = dt.Rows[0]["CallDate"].ToString();
            lblLastIPDate.Text = dt.Rows[0]["DLastIPDate"].ToString();

            lblNoOfDays.Text = dt.Rows[0]["DNoOfDays"].ToString();
            lblFacevaluebond.Text = dt.Rows[0]["FaceValueForBond"].ToString();
            lblQuantity.Text = dt.Rows[0]["DQuantity"].ToString();
            lblRate.Text = dt.Rows[0]["DRate"].ToString();
            lblYTM.Text = dt.Rows[0]["YTM"].ToString();
            lblFaceValueofdeal.Text = dt.Rows[0]["DDealValue"].ToString();
            lblPrincipalAmount.Text = dt.Rows[0]["DPrincipalAmount"].ToString();
            lblAccuredInterest.Text = dt.Rows[0]["DAccuredInterest"].ToString();
            lblTotalConsideration.Text = dt.Rows[0]["DGrossConsideration"].ToString();
            lblStampduty.Text = dt.Rows[0]["DStampDuty"].ToString();
            lblConsiderationwithduty.Text = dt.Rows[0]["DConsiderationStamp"].ToString();
        }
    }
}