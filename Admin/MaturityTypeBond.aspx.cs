using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MaturityTypeBond : System.Web.UI.Page
{

    DAL dl = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            vcreatecount.Visible = false;
            BindData();
            TagsName();
            CategoryName();
            CreditRating();
            Tags();
            PaymentType();
        }
    }
    private void BindData()
    {
        grdData.DataSource = dl.get_MaturityTypeProducts(null, null, null, null);
        grdData.DataBind();
    }

    private void TagsName()
    {
        ddlRatingAgencies.DataSource = dl.get_RatingAgenciesDetail(null, true);
        ddlRatingAgencies.DataTextField = "RatingAgencies";
        ddlRatingAgencies.DataValueField = "RatingAgenciesId";
        ddlRatingAgencies.DataBind();
        //ddlTags.Items.Insert(0, new ListItem("Choose Some", ""));
    }

    private void CategoryName()
    {
        ddlSubCategory.DataSource = dl.get_Category(null, null);
        ddlSubCategory.DataTextField = "CategoryHead";
        ddlSubCategory.DataValueField = "CategoryId";
        ddlSubCategory.DataBind();
        ddlSubCategory.Items.Insert(0, new ListItem("Choose one", "-1"));
    }

    private void PaymentType()
    {
        ddlFrequency.DataSource = dl.get_PaymentType(null, null);
        ddlFrequency.DataTextField = "PaymentTypeHead";
        ddlFrequency.DataValueField = "PaymentTypeId";
        ddlFrequency.DataBind();
        ddlFrequency.Items.Insert(0, new ListItem("Choose one", "-1"));
    }

    private void CreditRating()
    {
        ddlCreditRating.DataSource = dl.get_CreditRating(null, null);
        ddlCreditRating.DataTextField = "CreditRating";
        ddlCreditRating.DataValueField = "CreditRatingId";
        ddlCreditRating.DataBind();
        //ddlCreditRating.Items.Insert(0, new ListItem("Choose one", "-1"));
    }

    private void Tags()
    {
        ddlTags.DataSource = dl.get_Tags(null, null);
        ddlTags.DataTextField = "TagsHead";
        ddlTags.DataValueField = "TagsId";
        ddlTags.DataBind();
        //ddlTags.Items.Insert(0, new ListItem("Choose one", "-1"));
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
        ddlSubCategory.SelectedIndex = 0;
        txtProductName.Text = string.Empty;
        txtISIN.Text = string.Empty;
        txtCouponRate.Text = string.Empty;
        ddlCreditRating.SelectedIndex = -1;
        ddlRatingAgencies.SelectedIndex = -1;
        ddlStatus.SelectedIndex = 0;
        txtPutCallDate.Text = string.Empty;
        txtMaturitydate.Text = string.Empty;
        txtIPDate.Text = string.Empty;
        txtPrice.Text = string.Empty;
        txtYTCYIELD.Text = string.Empty;
        txtYTM.Text = string.Empty;
        txtFaceValue.Text = string.Empty;
        ddlTags.SelectedIndex = -1;
        ViewState["Id"] = null;
    }

    protected void lnkAdd_Click(object sender, EventArgs e)
    {
        if (ddlSubCategory.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'CategoryName must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (txtISIN.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'ISIN No. must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (txtProductName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Security must be Added..!!!', type: 'error',});", true);
            return;
        }

        if (txtCouponRate.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Coupon Rate must be Added..!!!', type: 'error',});", true);
            return;
        }
        //if (ddlCreditRating.SelectedValue == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Credit Rating must be Choose..!!!', type: 'error',});", true);
        //    return;
        //}
        if (ddlStatus.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Status must be Choose..!!!', type: 'error',});", true);
            return;
        }
        if (txtPutCallDate.Text == "")
        {
            txtPutCallDate.Text = "NA";
        }
        if (txtCallDate.Text == "")
        {
            txtCallDate.Text = "NA";
        }

        if (ddlGuaranteed.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Guaranteed By must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (txtMaturitydate.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Maturity Date must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (ddlFrequency.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'PaymentType/Frequency must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (txtIPDate.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'IP Date must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (txtPrice.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Price must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (txtYTCYIELD.Text == "")
        {
            txtYTCYIELD.Text = "NA";
        }
        if (txtYTM.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'YTM must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (txtFaceValue.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Face Value Per Bond must be Added..!!!', type: 'error',});", true);
            return;
        }
        string filePath = null;
        if (FileUpload1.HasFiles)
        {
            string folderPath = Server.MapPath("~/VImage/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }
            filePath = "~/VImage/" + new Random().Next(1, 100000).ToString() + Path.GetFileName(FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath(filePath));
            hfImageFilePath.Value = filePath;

        }
        string FilePath = null;
        if (FileUpload2.HasFiles)
        {
            string folderPath = Server.MapPath("~/VImage/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }
            FilePath = "~/VImage/" + new Random().Next(1, 100000).ToString() + Path.GetFileName(FileUpload2.FileName);
            FileUpload2.SaveAs(Server.MapPath(FilePath));
            hfIconFilePath.Value = FilePath;

        }

        if (ViewState["Id"] == null)
        {
            int IId = dl.add_MaturityTypeProducts(null, ddlSubCategory.SelectedValue, txtISIN.Text,null, txtProductName.Text, txtCouponRate.Text, ddlStatus.SelectedValue, txtPutCallDate.Text, txtMaturitydate.Text, ddlFrequency.SelectedValue, txtIPDate.Text, txtPrice.Text, txtYTCYIELD.Text, txtYTM.Text, txtFaceValue.Text, filePath, FilePath,ddlMaturityType.SelectedValue,txtDateCount.Text,txtCallDate.Text,ddlGuaranteed.SelectedValue, GetUserLoggedIn());
            if (IId != 0)
            {
                //foreach (ListItem lpl in ddlRatingAgencies.Items)
                //{
                //    if (lpl.Selected)
                //    {
                //        dl.add_RatingAgenciesTags(null, IId.ToString(), lpl.Value, GetUserLoggedIn());
                //    }
                //}
                //foreach (ListItem lpn in ddlCreditRating.Items)
                //{
                //    if (lpn.Selected)
                //    {
                //        dl.add_CreditRatingTags(null, IId.ToString(), lpn.Value, GetUserLoggedIn());
                //    }
                //}
                //foreach (ListItem lpm in ddlTags.Items)
                //{
                //    if (lpm.Selected)
                //    {
                //        dl.add_ProductsTags(null, IId.ToString(), lpm.Value, GetUserLoggedIn());
                //    }
                //}

                foreach (RepeaterItem rpt in rptTextBox.Items)
                {
                    DropDownList ddlMaturityTypeDate = (DropDownList)rpt.FindControl("ddlMaturityTypeDate");
                    TextBox txtPercentage = (TextBox)rpt.FindControl("txtPercentage");
                    TextBox txtRemark = (TextBox)rpt.FindControl("txtRemark");

                    // Assuming you have a method to save to the database
                    dl.add_MaturityTypeValue(null, IId.ToString(), ddlMaturityTypeDate.SelectedValue,txtPercentage.Text, txtRemark.Text, GetUserLoggedIn());
                    
                }
                clear();
                BindData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                return;
            }
        }
        //else
        //{
        //    dl.update_Products(ViewState["Id"].ToString(), ddlSubCategory.SelectedValue, txtISIN.Text, txtProductName.Text, txtSecurity.Text, txtCouponRate.Text, ddlStatus.SelectedValue, txtPutCallDate.Text, txtMaturitydate.Text, ddlFrequency.SelectedValue, txtIPDate.Text, txtPrice.Text, txtYTCYIELD.Text, txtYTM.Text, txtFaceValue.Text, filePath, FilePath, GetUserLoggedIn());

        //    dl.delete_RatingAgenciesTags(null, ViewState["Id"].ToString(), GetUserLoggedIn());
        //    dl.delete_CreditRatingTags(null, ViewState["Id"].ToString(), GetUserLoggedIn());
        //    dl.delete_ProductsTags(null, ViewState["Id"].ToString(), GetUserLoggedIn());
        //    foreach (ListItem lpp in ddlRatingAgencies.Items)
        //    {
        //        if (lpp.Selected)
        //        {
        //            dl.add_RatingAgenciesTags(null, ViewState["Id"].ToString(), lpp.Value, GetUserLoggedIn());
        //        }
        //    }
        //    foreach (ListItem lpp in ddlCreditRating.Items)
        //    {
        //        if (lpp.Selected)
        //        {
        //            dl.add_CreditRatingTags(null, ViewState["Id"].ToString(), lpp.Value, GetUserLoggedIn());
        //        }
        //    }
        //    foreach (ListItem lpl in ddlCreditRating.Items)
        //    {
        //        if (lpl.Selected)
        //        {
        //            dl.add_CreditRatingTags(null, ViewState["Id"].ToString(), lpl.Value, GetUserLoggedIn());
        //        }
        //    }
        //    clear();
        //    BindData();
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
        //    return;

        //}
    }

    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if (dl.update_Products_Active_Status(chkIsActive.ToolTip, chkIsActive.Checked, GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;
        DataTable dt = dl.get_Products(lnkEdit.CommandArgument, null, null, null);
        if (dt.Rows.Count > 0)
        {
            ddlSubCategory.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
            txtISIN.Text = dt.Rows[0]["ISINNumber"].ToString();
            txtProductName.Text = dt.Rows[0]["Security"].ToString();
            txtCouponRate.Text = dt.Rows[0]["CouponRate"].ToString();
            ddlStatus.SelectedValue = dt.Rows[0]["DataStatus"].ToString();
            txtPutCallDate.Text = dt.Rows[0]["PutCallDate"].ToString();
            txtMaturitydate.Text = dt.Rows[0]["MaturityDate"].ToString();
            ddlFrequency.SelectedValue = dt.Rows[0]["PaymentTypeId"].ToString();
            txtIPDate.Text = dt.Rows[0]["IPDate"].ToString();
            txtPrice.Text = dt.Rows[0]["Price"].ToString();
            txtYTCYIELD.Text = dt.Rows[0]["YTCYieldSemi"].ToString();
            txtYTM.Text = dt.Rows[0]["YTM"].ToString();
            txtFaceValue.Text = dt.Rows[0]["FacevalueForBond"].ToString();
            hfImageFilePath.Value = dt.Rows[0]["ProductImage"].ToString();
            hfIconFilePath.Value = dt.Rows[0]["ProductFile"].ToString();
            ViewState["Id"] = lnkEdit.CommandArgument;
            DataTable dtm = dl.get_RatingAgenciesTags(null, lnkEdit.CommandArgument, null, null);
            if (dtm.Rows.Count > 0)
            {
                foreach (DataRow row in dtm.Rows)
                {
                    ddlRatingAgencies.Items.FindByValue(row["RatingAgenciesId"].ToString()).Selected = true;

                }
            }
            DataTable dtc = dl.get_CreditRatingTags(null, lnkEdit.CommandArgument, null, null);
            if (dtc.Rows.Count > 0)
            {
                foreach (DataRow row in dtc.Rows)
                {
                    ddlCreditRating.Items.FindByValue(row["CreditRatingId"].ToString()).Selected = true;

                }
            }
            DataTable dtn = dl.get_ProductsTags(null, lnkEdit.CommandArgument, null, null);
            if (dtn.Rows.Count > 0)
            {
                foreach (DataRow row in dtc.Rows)
                {
                    ddlTags.Items.FindByValue(row["TagsId"].ToString()).Selected = true;

                }
            }

        }
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        if (dl.delete_MaturityTypeProducts(lnkDelete.CommandArgument, GetUserLoggedIn()))
        {

            dl.delete_MaturityTypeValue(null, lnkDelete.CommandArgument, GetUserLoggedIn());
            BindData();
        }
    }
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfProductId = e.Row.FindControl("hfProductId") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            grdItems.DataSource = dl.get_RatingAgenciesTags(null, hfProductId.Value, null, true);
            grdItems.DataBind();

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfProductsId = e.Row.FindControl("hfProductsId") as HiddenField;
            GridView grdItemsData = e.Row.FindControl("grdItemsData") as GridView;
            grdItemsData.DataSource = dl.get_CreditRatingTags(null, hfProductsId.Value, null, true);
            grdItemsData.DataBind();
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfProductssId = e.Row.FindControl("hfProductssId") as HiddenField;
            GridView grdItemsDataTags = e.Row.FindControl("grdItemsDataTags") as GridView;
            grdItemsDataTags.DataSource = dl.get_ProductsTags(null, hfProductssId.Value, null, true);
            grdItemsDataTags.DataBind();
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfProductsStag = e.Row.FindControl("hfProductsStag") as HiddenField;
            GridView grdStaggeredData = e.Row.FindControl("grdStaggeredData") as GridView;
            grdStaggeredData.DataSource = dl.get_MaturityTypeValue(null, hfProductsStag.Value, true);
            grdStaggeredData.DataBind();
        }

    }
    private void CheckEOMDate()
    {
        DataTable dt = dl.CheckInputDateEOM(txtIPDate.Text);
        if(dt.Rows.Count > 0)
        {
            string EM = dt.Rows[0]["EM"].ToString();
            hfEM.Value = EM;
        }
    }
    protected void txtDateCount_TextChanged(object sender, EventArgs e)
    {
        BindComponentes();

        
        foreach(RepeaterItem rpt in rptTextBox.Items)
        {
            DropDownList ddlMaturityTypeDate = (DropDownList)rpt.FindControl("ddlMaturityTypeDate");
            if (hfEM.Value == "1")
            {
                if (ddlFrequency.SelectedValue == "1")
                {
                    ddlMaturityTypeDate.DataSource = dl.get_LastMonthlyDateList(txtMaturitydate.Text, txtIPDate.Text);
                    ddlMaturityTypeDate.DataTextField = "mth_start";
                    ddlMaturityTypeDate.DataValueField = "mth_start";
                    ddlMaturityTypeDate.DataBind();
                    ddlMaturityTypeDate.Items.Insert(0, new ListItem("Choose one", "-1"));
                }
                if (ddlFrequency.SelectedValue == "5")
                {
                    ddlMaturityTypeDate.DataSource = dl.get_YearlyDateList(txtMaturitydate.Text, txtIPDate.Text);
                    ddlMaturityTypeDate.DataTextField = "mth_start";
                    ddlMaturityTypeDate.DataValueField = "mth_start";
                    ddlMaturityTypeDate.DataBind();
                    ddlMaturityTypeDate.Items.Insert(0, new ListItem("Choose one", "-1"));
                }
                if (ddlFrequency.SelectedValue == "3")
                {
                    ddlMaturityTypeDate.DataSource = dl.get_LastQuarterlyDateList(txtMaturitydate.Text, txtIPDate.Text);
                    ddlMaturityTypeDate.DataTextField = "mth_start";
                    ddlMaturityTypeDate.DataValueField = "mth_start";
                    ddlMaturityTypeDate.DataBind();
                    ddlMaturityTypeDate.Items.Insert(0, new ListItem("Choose one", "-1"));
                }
                if (ddlFrequency.SelectedValue == "4")
                {
                    ddlMaturityTypeDate.DataSource = dl.get_LastHalfYearlyDateList(txtMaturitydate.Text, txtIPDate.Text);
                    ddlMaturityTypeDate.DataTextField = "mth_start";
                    ddlMaturityTypeDate.DataValueField = "mth_start";
                    ddlMaturityTypeDate.DataBind();
                    ddlMaturityTypeDate.Items.Insert(0, new ListItem("Choose one", "-1"));
                }
            }
            if (hfEM.Value == "0")
            {
                if (ddlFrequency.SelectedValue == "1")
                {
                    ddlMaturityTypeDate.DataSource = dl.get_MonthlyDateList(txtMaturitydate.Text, txtIPDate.Text);
                    ddlMaturityTypeDate.DataTextField = "mth_start";
                    ddlMaturityTypeDate.DataValueField = "mth_start";
                    ddlMaturityTypeDate.DataBind();
                    ddlMaturityTypeDate.Items.Insert(0, new ListItem("Choose one", "-1"));
                }
                if (ddlFrequency.SelectedValue == "5")
                {
                    ddlMaturityTypeDate.DataSource = dl.get_YearlyDateList(txtMaturitydate.Text, txtIPDate.Text);
                    ddlMaturityTypeDate.DataTextField = "mth_start";
                    ddlMaturityTypeDate.DataValueField = "mth_start";
                    ddlMaturityTypeDate.DataBind();
                    ddlMaturityTypeDate.Items.Insert(0, new ListItem("Choose one", "-1"));
                }
                if (ddlFrequency.SelectedValue == "3")
                {
                    ddlMaturityTypeDate.DataSource = dl.get_QuarterlyDateList(txtMaturitydate.Text, txtIPDate.Text);
                    ddlMaturityTypeDate.DataTextField = "mth_start";
                    ddlMaturityTypeDate.DataValueField = "mth_start";
                    ddlMaturityTypeDate.DataBind();
                    ddlMaturityTypeDate.Items.Insert(0, new ListItem("Choose one", "-1"));
                }
                if (ddlFrequency.SelectedValue == "4")
                {
                    ddlMaturityTypeDate.DataSource = dl.get_HalfYearlyDateList(txtMaturitydate.Text, txtIPDate.Text);
                    ddlMaturityTypeDate.DataTextField = "mth_start";
                    ddlMaturityTypeDate.DataValueField = "mth_start";
                    ddlMaturityTypeDate.DataBind();
                    ddlMaturityTypeDate.Items.Insert(0, new ListItem("Choose one", "-1"));
                }
            }
        }

      

    }


    protected void ddlMaturityType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlMaturityType.SelectedValue == "Bullet")
        {
            vcreatecount.Visible = false;
        }
        if (ddlMaturityType.SelectedValue == "Staggered")
        {
            vcreatecount.Visible = true;
        }
    }
    protected void BindComponentes()
    {
        DataTable dt = new DataTable();

        for (int i = 0; i < Convert.ToInt32(txtDateCount.Text); i++)
        {

            DataRow dr = null;
            dt.Columns.Add(new DataColumn("Column1"+i, typeof(string)));
            dt.Columns.Add(new DataColumn("Column2"+i, typeof(string)));
            dt.Columns.Add(new DataColumn("Column3"+i, typeof(double)));
            dt.Columns.Add(new DataColumn("Column4" + i, typeof(double)));
            //create new row
            dr = dt.NewRow();

            //add the row to DataTable
            dt.Rows.Add(dr);
        }

        rptTextBox.DataSource = dt;
        rptTextBox.DataBind();
    }

    protected void txtIPDate_TextChanged(object sender, EventArgs e)
    {
        CheckEOMDate();
    }
}