using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Drawing2D;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ImportStaggeredProduct : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string url = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            DataTable dtsub = dl.getPanelChildMenuSubByurl(url);
            ViewState["ChildSubmemnuId"] = dtsub.Rows[0]["ChildSubMenuId"].ToString();
            ViewState["SubmemnuId"] = dtsub.Rows[0]["SubMenuId"].ToString();
            ViewState["MainMenuId"] = dtsub.Rows[0]["MainMenuId"].ToString();
            getPermision();
        }
    }

    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelChildUserMenuSubPermission(GetUserLoggedIn(), ViewState["SubmemnuId"].ToString(), ViewState["ChildSubmemnuId"].ToString());
        pnlAdd.Visible = Convert.ToBoolean(dtsubpermission.Rows[0]["CanAdd"]);


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
    public String Get_CategoryId(string CategoryName)
    {
        if (CategoryName != "")
        {
            DataTable dtc = dl.get_CategoryName(CategoryName.Trim(), true);
            if (dtc.Rows.Count != 0)
            {
                return dtc.Rows[0]["CategoryId"].ToString();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Category Name MisMatch..!!!', type: 'error',});", true);
                return  null;
                //dl.add_Category(null, CategoryName,null,null,null,null,null);

                
            }
        }
        else
        {
            return null;
        }
    }

    public String get_CreditRatingId(string CriditRating)
    {
        if (CriditRating != "")
        {

            DataTable dtc = dl.get_CreditRatingName(CriditRating.Trim(), true);
            if (dtc.Rows.Count != 0)
            {
                StringBuilder sbUserName = new StringBuilder();
                foreach (DataRow dr in dtc.Rows)
                {
                    string name = dr["CreditRatingId"].ToString();
                    sbUserName.Append(name).Append(",");
                }
                return sbUserName.ToString();
            }
            else
            {
                dl.add_CreditRating(null, CriditRating, GetUserLoggedIn());
                return get_CreditRatingId(CriditRating);

            }
        }
        else
        {
            return null;
        }
    }

    public String get_RatingAgenciesId(string RatingAgencies)
    {
        if (RatingAgencies != "")
        {
            DataTable dtc = dl.get_RatingAgenciesDetailName(RatingAgencies.Trim(), true);
            if (dtc.Rows.Count != 0)
            {
                StringBuilder sbUserNames = new StringBuilder();
                foreach (DataRow dr in dtc.Rows)
                {
                    string agencies = dr["RatingAgenciesId"].ToString();
                    sbUserNames.Append(agencies).Append(",");
                }

                return sbUserNames.ToString();
            }
            else
            {
                dl.add_RatingAgenciesDetail(null, RatingAgencies, GetUserLoggedIn());
                return get_RatingAgenciesId(RatingAgencies);
            }
        }
        else
        {
            return null;
        }
    }

    public String get_PaymentTypeId(string PaymentType)
    {
        if (PaymentType != "")
        {
            DataTable dtc = dl.get_PaymentTypeName(PaymentType.Trim(), true);
            if (dtc.Rows.Count != 0)
            {
                return dtc.Rows[0]["PaymentTypeId"].ToString();
            }
            else
            {
                //dl.add_Category(null, CategoryName,null,null,null,null,null);
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Payment Type Name MisMatch..!!!', type: 'error',});", true);
                return null;
            }
        }
        else
        {
            return null;
        }
    }
    protected void btnImport_Click(object sender, EventArgs e)
    {
        if (hfExcelPath.Value == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid excel file must be added..!!!', type: 'error',});", true);
            return;
        }
        else
        {
            Import_To_Grid(hfExcelPath.Value, hfExtension.Value, "Yes");

        }
    }
    private void Import_To_Grid(string FilePath, string Extension, string isHDR)
    {
        FilePath = Server.MapPath(@"" + FilePath + "");
        int itemCount = 0;
        DataTable dt = ExcelUtility.Read(FilePath);
        if (dt != null && dt.Rows.Count != 0)
        {
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                if (dr[0].ToString().Trim() != "")
                {
                    string MCategoryId = Get_CategoryId(dr[0].ToString());
                    string MCreditRating = get_CreditRatingId(dr[5].ToString());
                    string MRatingAgencies = get_RatingAgenciesId(dr[6].ToString());
                    string MPaymentType = get_PaymentTypeId(dr[12].ToString());
                    string DateCount = dr[20].ToString();
                    double Mat = double.Parse(dr[11].ToString());
                    DateTime Maturity = Convert.ToDateTime(DateTime.FromOADate(Mat));
                    double IP = double.Parse(dr[13].ToString());
                    DateTime IPDate = Convert.ToDateTime(DateTime.FromOADate(IP));
                    string putdata = null, calldata = null;
                    if (dr[8].ToString() == "NA")
                    {
                        putdata = "NA";
                    }
                    else
                    {
                        double put = double.Parse(dr[8].ToString());
                        DateTime putdate = Convert.ToDateTime(DateTime.FromOADate(put));
                        putdata = putdate.ToString("dd/MM/yyyy");
                    }
                    if (dr[9].ToString() == "NA")
                    {
                        calldata = "NA";
                    }
                    else
                    {
                        double call = double.Parse(dr[9].ToString());
                        DateTime calldate = Convert.ToDateTime(DateTime.FromOADate(call));
                        calldata = calldate.ToString("dd/MM/yyyy");
                    }
                    i++;
                    if (MCategoryId != null && MCategoryId != "" && MPaymentType != "" && MPaymentType != null)
                    {
                        int IId = dl.add_ProductsStaggeredName(null, MCategoryId, dr[1].ToString(),dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), dr[7].ToString(), dr[8].ToString(), dr[9].ToString(), dr[10].ToString(), Maturity.ToString("dd/MM/yyyy").Replace("-","/"), MPaymentType, IPDate.ToString("dd/MM/yyyy").Replace("-","/"), dr[14].ToString(), dr[15].ToString(), dr[16].ToString(), dr[17].ToString(), dr[18].ToString(), dr[19].ToString(), GetUserLoggedIn());
                        if (IId != 0)
                        {
                            string[] multiCredit = MCreditRating.Split(',');
                            foreach (String multiple in multiCredit)
                            {
                                if (multiple != "" && multiple != null)
                                {
                                    dl.add_CreditRatingTags(null, IId.ToString(), multiple, GetUserLoggedIn());
                                }
                            }
                            string[] multiRating = MRatingAgencies.Split(',');
                            foreach (String multiples in multiRating)
                            {
                                if (multiples != "" && multiples != null)
                                {
                                    dl.add_RatingAgenciesTags(null, IId.ToString(), multiples, GetUserLoggedIn());
                                }

                            }
                            string[] datevalue = DateCount.Split(',');
                            foreach(String multiple in datevalue)
                            {
                                string DateValues = multiple.Substring(0, 10);
                                //DateTime date = DateTime.ParseExact(DateValues, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                                //DateTime date = Convert.ToDateTime(DateValues);
                                string DatePercentage = multiple.Substring(10);
                                int IIM = dl.add_MaturityTypeValueStaggered(null, IId.ToString(), DateValues, GetUserLoggedIn());
                                if(IIM != 0)
                                {
                                    dl.update_MaturityTypeValuePercentage(IIM.ToString(), DatePercentage, GetUserLoggedIn());
                                }
                            }
                            itemCount++;
                        }
                    }
                }
            }
            string msg = itemCount.ToString() + " Records imported.";
            alertMsg.InnerHtml = "<div ><strong>Staggered Product!</strong> " + msg + "</div>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'check_circle', text: '" + msg + "', type: 'success',});", true);
            hfExcelPath.Value = "";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'No Data to be imported..!!!', type: 'error',});", true);
            return;
        }

    }
}