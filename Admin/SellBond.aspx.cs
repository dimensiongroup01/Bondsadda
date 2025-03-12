using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SellBond : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string url = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            DataTable dtsub = dl.getPanelMenuSubByurl(url);
            ViewState["SubmemnuId"] = dtsub.Rows[0]["SubMenuId"].ToString();
            ViewState["MainMenuId"] = dtsub.Rows[0]["MainMenuId"].ToString();
            getPermision();
            BindData();
        }
    }
    private void BindData()
    {
        grdData.DataSource = dl.get_SellBond(null, null,null,null,null, null,null, null);
        grdData.DataBind();
    }

    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfCustomer = e.Row.FindControl("hfCustomer") as HiddenField;
            HiddenField hfSellBondId = e.Row.FindControl("hfSellBondId") as HiddenField;
            GridView grdData = e.Row.FindControl("grdData") as GridView;
            LinkButton lnkApproved = e.Row.FindControl("lnkApproved") as LinkButton;
            LinkButton lnkReject = e.Row.FindControl("lnkReject") as LinkButton;
            DataTable dt = dl.get_SellBond(hfSellBondId.Value, hfCustomer.Value,null,null,null,null,null,null);
            {
                if(dt.Rows.Count > 0)
                {
                    string BondStatus = dt.Rows[0]["BondStatus"].ToString();
                    hfBond.Value = BondStatus;
                    if(hfBond.Value == "Approved" || hfBond.Value =="Rejected")
                    {
                        lnkApproved.Visible = false;
                        lnkReject.Visible = false;
                    }
                    else
                    {
                        lnkApproved.Visible = true;
                        lnkReject.Visible = true;
                    }                    
                }
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
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());

        // pnlView.Visible = true;

    }
    protected void lnkApproved_Click(object sender, EventArgs e)
    {
        LinkButton lnkApproved = (LinkButton)sender;
        GridViewRow gvr = ((LinkButton)sender).NamingContainer as GridViewRow;
        HiddenField hfCustomer = (HiddenField)gvr.FindControl("hfCustomer");
        HiddenField hfSellBondId = (HiddenField)gvr.FindControl("hfSellBondId");
        DataTable dt = dl.get_SellBondStatus(hfSellBondId.Value, hfCustomer.Value,null,null,null,null, null, null);
        if (dt.Rows.Count > 0)
        {
            string SellBondId = dt.Rows[0]["SellbondId"].ToString();
            hfSellBonId.Value = SellBondId;
            string Category = dt.Rows[0]["CategoryId"].ToString();
            hfCategory.Value = Category;
            string ISINNumber = dt.Rows[0]["SISINNumber"].ToString();
            hfISINNumber.Value = ISINNumber;
            //string Security = dt.Rows[0]["Security"].ToString();
            //hfSecurity.Value = Security;
            string CouponRate = dt.Rows[0]["SCouponRate"].ToString();
            hfCouponRate.Value = CouponRate;
            //string RatingAgencies = dt.Rows[0]["SRatingAgencies"].ToString();
            //hfRatingAgencies.Value = RatingAgencies;
            string PutCallDate = dt.Rows[0]["SPutCallDate"].ToString();
            hfPutCallDate.Value = PutCallDate;
            string MaturityDate = dt.Rows[0]["SMaturityDate"].ToString();
            hfMaturityDate.Value = MaturityDate;
            string IPDate = dt.Rows[0]["SIPDate"].ToString();
            hfIPDate.Value = IPDate;
            string PriceRate = dt.Rows[0]["SPriceRate"].ToString();
            hfPriceRate.Value = PriceRate;
            string YTCYieldSemi = dt.Rows[0]["SYTCYieldSemi"].ToString();
            hfYTCYieldSemi.Value = YTCYieldSemi;
            string YTM = dt.Rows[0]["SYTM"].ToString();
            hfYTM.Value = YTM;
            //string CreditRating = dt.Rows[0]["SCreditRating"].ToString();
            //hfCreditRating.Value = CreditRating;
            //string DataStatus = dt.Rows[0]["DataStatus"].ToString();
            //hfDataStatus.Value = DataStatus;
            string ProductName = dt.Rows[0]["SProductName"].ToString();
            hfProductName.Value = ProductName;
            string PaymentTypeId = dt.Rows[0]["PaymentTypeId"].ToString() ;
            hfPaymentTypeId.Value = PaymentTypeId;
            string FacevalueForBond = dt.Rows[0]["SFacevalueForBond"].ToString();
            hfFacevalueForBond.Value = FacevalueForBond;
            string CallDate = dt.Rows[0]["SCallDate"].ToString();
            hfCallDate.Value = CallDate;
            string Guaranteed = dt.Rows[0]["SGuaranteedBy"].ToString();
            hfGuaranteedBy.Value = Guaranteed;
            
            //hfProductImage.Value = dt.Rows[0]["SProductImage"].ToString();
            //hfProductFile.Value = dt.Rows[0]["SProductFile"].ToString();
        }
        //int IId = dl.add_Products(null, hfCategory.Value, hfISINNumber.Value,null, hfProductName.Value, hfCouponRate.Value,null ,hfPutCallDate.Value,hfCallDate.Value,hfGuaranteedBy.Value, hfMaturityDate.Value, hfPaymentTypeId.Value, hfIPDate.Value, hfPriceRate.Value, hfYTCYieldSemi.Value, hfYTM.Value, hfFacevalueForBond.Value, hfProductImage.Value, hfProductFile.Value,null,null, GetUserLoggedIn());
        //if(IId !=0)
        //{
        //    //dl.add_CreditRatingTags(null, IId.ToString(), hfCreditRating.Value, GetUserLoggedIn());
        //    //dl.add_RatingAgenciesTags(null, IId.ToString(), hfRatingAgencies.Value, GetUserLoggedIn());
        //    dl.update_SellBondStatus(hfSellBondId.Value);
        //    BindData();
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Sell Bond Approved.', type: 'success',});", true);
        //    return;
        //}

    }

    protected void lnkReject_Click(object sender, EventArgs e)
    {
        LinkButton lnkApproved = (LinkButton)sender;
        GridViewRow gvr = ((LinkButton)sender).NamingContainer as GridViewRow;
        HiddenField hfCustomer = (HiddenField)gvr.FindControl("hfCustomer");
        HiddenField hfSellBondId = (HiddenField)gvr.FindControl("hfSellBondId");
        if(dl.update_SellBondStatusReject(hfSellBondId.Value))
        {
            BindData();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: 'Sell Bond Rejected.', type: 'success',});", true);
            return;
        }
    }
}