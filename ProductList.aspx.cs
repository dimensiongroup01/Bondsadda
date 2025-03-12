using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using Ninject.Activation;
using Hl7.Fhir.Model;

public partial class ProductList : System.Web.UI.Page
{
    DAL dl = new DAL();

    string q;
    string m;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadBrands();
            OfferData();
            loadCategories();
            loadColors();
            pnlrpt.Visible = true;
            pnlTags.Visible = false;
            pnlpagrpt.Visible = true;
            pnlpagtags.Visible = false;
            if (Request.QueryString["MainCategoryId"] !=null)
            {
                pnlrpt.Visible = true;
                pnlTags.Visible = false;
                LatestProduct(m);
            }
            if (Request.QueryString["brandId"] != null)
            {
                pnlrpt.Visible = true;
                pnlTags.Visible = false;
                selectBrands(Request.QueryString["brandId"].ToString());
            }
            if (Request.QueryString["POfferId"] != null)
            {
                pnlrpt.Visible = true;
                pnlTags.Visible = false;
                selectPOffer(Request.QueryString["POfferId"].ToString());
            }
            if (Request.QueryString["imid"] != null)
            {
                pnlrpt.Visible = true;
                pnlTags.Visible = false;
                LatestProduct(q);


            }
            showProducts("1");
            if (Request.QueryString["tpi"] !=null)
            {
                pnlrpt.Visible = false;
                pnlTags.Visible = true;
                pnlpagtags.Visible = true;
                pnlpagrpt.Visible = false;
                Lates(Request.QueryString["tpi"].ToString());
                TagsProduct(Request.QueryString["tpi"].ToString());
            }

        }
    }
    private void TagsProduct(string data)
    {
        showproducttags("1");
    }

    public void showproducttags(string PageIndex)
    {
        if (Request.QueryString["tpi"].ToString() != null)
        {

            DataTable dt = dl.showProductsTagsdata(PageIndex, showCount.SelectedValue, null, null, null, null, null, null, null, null, null, null, null, Request.QueryString["tpi"].ToString());
            if (dt.Rows.Count > 0)
            {
                rpttags.DataSource = dt;
                rpttags.DataBind();
            }
            if (dt.Rows.Count != 0)
            {
                lblFirstIndex1.Text = dt.Rows[0]["RowNumber"].ToString();
                lblLastIndex1.Text = dt.Rows[dt.Rows.Count - 1]["RowNumber"].ToString();

                lblRecordCount1.Text = dt.Rows[0]["RecordCount"].ToString();
                //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
                GetGridDataBasedonPageIndextags(Convert.ToInt32(dt.Rows[0]["RecordCount"].ToString()), Convert.ToInt32(PageIndex));
            }
            else
            {
                lblFirstIndex1.Text = "0";
                lblLastIndex1.Text = "0";

                lblRecordCount1.Text = "0";
                //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
                GetGridDataBasedonPageIndex(0, 0);

            }

            if (dt.Rows.Count != 0)
            {
                lblFirstIndextags.Text = dt.Rows[0]["RowNumber"].ToString();
                lblLastIndextags.Text = dt.Rows[dt.Rows.Count - 1]["RowNumber"].ToString();

                lblRecordCounttags.Text = dt.Rows[0]["RecordCount"].ToString();
                //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
                GetGridDataBasedonPageIndextags(Convert.ToInt32(dt.Rows[0]["RecordCount"].ToString()), Convert.ToInt32(PageIndex));
            }
            else
            {
                lblFirstIndextags.Text = "0";
                lblLastIndextags.Text = "0";

                lblRecordCounttags.Text = "0";
                //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
                GetGridDataBasedonPageIndextags(0, 0);
                //ddlSortBy.Focus();
            }
        }
    }
    private void Lates(string data)
    {
        DataTable dt = dl.get_Products_RecentTags(null, null, null, null, null, null, null,data);
        rptlstProduct.DataSource = dt;
        rptlstProduct.DataBind();

        rptLProdDesktop.DataSource = dt;
        rptLProdDesktop.DataBind();
    }
    private void loadBrands()
    {
        DataTable dtC = dl.getCompany(null, true);
        rptBrands.DataSource = dtC;
        rptBrands.DataBind();

        rptFilterBrandMob.DataSource = dtC;
        rptFilterBrandMob.DataBind();

    }
    private void selectBrands(string brandId)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        foreach (RepeaterItem itm in rptBrands.Items)
        {
            CheckBox chkFilterBrand = (CheckBox)itm.FindControl("chkFilterBrand");
            if(chkFilterBrand.ToolTip == brandId)
            {
                chkFilterBrand.Checked = true;
            }
        }
        showProducts("1");
    }

    private void selectPOffer(string POfferId)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        foreach (RepeaterItem itm in rptOffer1.Items )
        {
            CheckBox chkFilterOffer = (CheckBox)itm.FindControl("chkFilterOffer");
            if (chkFilterOffer.ToolTip == POfferId)
            {
                chkFilterOffer.Checked = true;
            }
        }
        //showProducts("1");
    }

    private void OfferData()
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        DataTable dt = dl.getProductOffer(null, null, null, true);

        rptOffer1.DataSource = dt;
        rptOffer1.DataBind();

        chkFilterOfferMob.DataSource = dt;
        chkFilterOfferMob.DataBind();

    }
    private void loadCategories()
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        DataTable dtCM = dl.getCategoryMain(null, true, null, null);
        rptFilterCategory.DataSource = dtCM;
        rptFilterCategory.DataBind();

        rptFltrCatMob.DataSource = dtCM;
        rptFltrCatMob.DataBind();
    }

    private void loadColors()
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        DataTable dtC = dl.getFilterColors(null, null, null);
        rptFilterColor.DataSource = dtC;
        rptFilterColor.DataBind();

        rptFilterColorMob.DataSource = dtC;
        rptFilterColorMob.DataBind();
    }


    public void showProducts(string PageIndex)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        string mCategoryId = null, CategoryId = null, POfferId=null, filterOffer=null, CompanyId = null, filterBrand = null, filterColor = null, MinPrice = null, MaxPrice = null,TagsId = null; 
        string SortDirection = "ASC", SortCol = "ProductId";

       if(pricefilter.Text!="")
       {
       string pricefilters = pricefilter.Text;
        string[] p = pricefilters.Split(';');
        MinPrice = p[0].ToString();
        MaxPrice = p[1].ToString();
       }
        if (Request.QueryString["imid"] != null)
        {
            mCategoryId = Request.QueryString["imid"].ToString();
            LatestProduct(q);
        }
        if (Request.QueryString["MainCategoryId"] !=null)
        {
            mCategoryId = Request.QueryString["MainCategoryId"].ToString();
            LatestProduct(m);
        }
        else
        {
            if (hfCatId.Value != "")
            {
                mCategoryId = null;
                CategoryId = hfCatId.Value;
            }
        }

        //if (Request.QueryString["tpi"] != null)
        //{
        //    TagsId = Request.QueryString["tpi"].ToString();
        //}

        //if (Request.QueryString["brandId"] != null)
        //{
        //    CompanyId = Request.QueryString["brandId"].ToString();
        //    LatestProduct(q);
        //}
        //if (hfCatId.Value != "")
        //{
        //    CompanyId = null;
        //    CategoryId = hfCatId.Value;
        //}

        for (int i = 0; i < rptOffer1.Items.Count; i++)
        {
            CheckBox chkFilterOffer = (CheckBox)rptOffer1.Items[i].FindControl("chkFilterOffer");
            if (chkFilterOffer.Checked)
            {
                if (filterOffer == null)
                {
                    filterOffer = chkFilterOffer.ToolTip;
                }
                else
                {
                    filterOffer += ("," + chkFilterOffer.ToolTip);
                }
            }
        }
        for (int i = 0; i < chkFilterOfferMob.Items.Count; i++)
        {
            CheckBox chkFilterOffer = (CheckBox)chkFilterOfferMob.Items[i].FindControl("chkFilterOffer");
            if (chkFilterOffer.Checked)
            {
                if (filterOffer == null)
                {
                    filterOffer = chkFilterOffer.ToolTip;
                }
                else
                {
                    filterOffer += ("," + chkFilterOffer.ToolTip);
                }
            }
        }

        for (int i = 0; i < rptBrands.Items.Count; i++)
        {
            CheckBox chkFilterBrand = (CheckBox)rptBrands.Items[i].FindControl("chkFilterBrand");
            if (chkFilterBrand.Checked)
            {
                if (filterBrand == null)
                {
                    filterBrand = chkFilterBrand.ToolTip;
                }
                else
                {
                    filterBrand += ("," + chkFilterBrand.ToolTip);
                }
            }
        }
        for (int i = 0; i < rptFilterBrandMob.Items.Count; i++)
        {
            CheckBox chkFilterBrand = (CheckBox)rptFilterBrandMob.Items[i].FindControl("chkFilterBrand");
            if (chkFilterBrand.Checked)
            {
                if (filterBrand == null)
                {
                    filterBrand = chkFilterBrand.ToolTip;
                }
                else
                {
                    filterBrand += ("," + chkFilterBrand.ToolTip);
                }
            }
        }
        for (int i = 0; i < rptFilterColor.Items.Count; i++)
        {
            CheckBox chkFilterColor = (CheckBox)rptFilterColor.Items[i].FindControl("chkFilterColor");
            if (chkFilterColor.Checked)
            {
                if (filterColor == null)
                {
                    filterColor = chkFilterColor.ToolTip;
                }
                else
                {
                    filterColor += ("," + chkFilterColor.ToolTip);
                }
            }
        }
        for (int i = 0; i < rptFilterColorMob.Items.Count; i++)
        {
            CheckBox chkFilterColor = (CheckBox)rptFilterColorMob.Items[i].FindControl("chkFilterColor");
            if (chkFilterColor.Checked)
            {
                if (filterColor == null)
                {
                    filterColor = chkFilterColor.ToolTip;
                }
                else
                {
                    filterColor += ("," + chkFilterColor.ToolTip);
                }
            }
        }
        {

        }
        if (hfMinAmt.Value != "")
        {
            MinPrice = hfMinAmt.Value;
        }

        if (hfMaxAmt.Value != "")
        {
            MaxPrice = hfMaxAmt.Value;
        }
        if (ddlSortBy.SelectedValue == "Latest")
        {
            SortDirection = "DESC";
            SortCol = "ProductId";
        }
        else if (ddlSortBy.SelectedValue == "NameAtoZ")
        {
            SortDirection = "ASC";
            SortCol = "ProductTitle";
        }
        else if (ddlSortBy.SelectedValue == "NameZtoA")
        {
            SortDirection = "DESC";
            SortCol = "ProductTitle";
        }
        else if (ddlSortBy.SelectedValue == "PriceLowToHigh")
        {
            SortDirection = "ASC";
            SortCol = "Price";
        }
        else if (ddlSortBy.SelectedValue == "PriceHighToLow")
        {
            SortDirection = "DESC";
            SortCol = "Price";
        }

     
        DataTable dt = dl.showProductsTags(PageIndex, showCount.SelectedValue, mCategoryId, CategoryId, POfferId, filterOffer, CompanyId, filterBrand, filterColor, MinPrice, MaxPrice, SortDirection, SortCol,TagsId);
        if(dt.Rows.Count > 0)
        {
            rpt.DataSource = dt;
            rpt.DataBind();
        }


        rpt3.DataSource = dt;
        rpt3.DataBind();

        rpt5.DataSource = dt;
        rpt5.DataBind();

        if (dt.Rows.Count != 0)
        {
            lblFirstIndex1.Text = dt.Rows[0]["RowNumber"].ToString();
            lblLastIndex1.Text = dt.Rows[dt.Rows.Count - 1]["RowNumber"].ToString();

            lblRecordCount1.Text = dt.Rows[0]["RecordCount"].ToString();
            //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
            GetGridDataBasedonPageIndex(Convert.ToInt32(dt.Rows[0]["RecordCount"].ToString()), Convert.ToInt32(PageIndex));
        }
        else
        {
            lblFirstIndex1.Text = "0";
            lblLastIndex1.Text = "0";

            lblRecordCount1.Text = "0";
            //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
            GetGridDataBasedonPageIndex(0, 0);

        }

        if (dt.Rows.Count != 0)
        {
            lblFirstIndex.Text = dt.Rows[0]["RowNumber"].ToString();
            lblLastIndex.Text = dt.Rows[dt.Rows.Count - 1]["RowNumber"].ToString();

            lblRecordCount.Text = dt.Rows[0]["RecordCount"].ToString();
            //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
            GetGridDataBasedonPageIndex(Convert.ToInt32(dt.Rows[0]["RecordCount"].ToString()), Convert.ToInt32(PageIndex));
        }
        else
        {
            lblFirstIndex.Text = "0";
            lblLastIndex.Text = "0";

            lblRecordCount.Text = "0";
            //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
            GetGridDataBasedonPageIndex(0, 0);
            ddlSortBy.Focus();
        }
    }

    private void GetGridDataBasedonPageIndex(int recordCount, int currentPage)
    {
        double dblPageCount = (double)((decimal)recordCount / decimal.Parse(showCount.SelectedValue));
        int pageCount = (int)Math.Ceiling(dblPageCount);
        List<ListItem> pages = new List<ListItem>();
        if (pageCount > 0)
        {
            pages.Add(new ListItem("<<", "1", currentPage > 1));
            if (currentPage != 1)
            {
                pages.Add(new ListItem("Previous", (currentPage - 1).ToString()));
            }
            if (pageCount < 4)
            {
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            else if (currentPage < 4)
            {
                for (int i = 1; i <= 4; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem("...", (currentPage).ToString(), false));
            }
            else if (currentPage > pageCount - 4)
            {
                pages.Add(new ListItem("...", (currentPage).ToString(), false));
                for (int i = currentPage - 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            else
            {
                pages.Add(new ListItem("...", (currentPage).ToString(), false));
                for (int i = currentPage - 2; i <= currentPage + 2; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem("...", (currentPage).ToString(), false));
            }
            if (currentPage != pageCount)
            {
                pages.Add(new ListItem("next", (currentPage + 1).ToString()));
            }
            pages.Add(new ListItem(">>", pageCount.ToString(), currentPage < pageCount));
        }
        rptPager.DataSource = pages;
        rptPager.DataBind();
    }

    private void GetGridDataBasedonPageIndextags(int recordCount, int currentPage)
    {
        double dblPageCount = (double)((decimal)recordCount / decimal.Parse(showCount.SelectedValue));
        int pageCount = (int)Math.Ceiling(dblPageCount);
        List<ListItem> pages = new List<ListItem>();
        if (pageCount > 0)
        {
            pages.Add(new ListItem("<<", "1", currentPage > 1));
            if (currentPage != 1)
            {
                pages.Add(new ListItem("Previous", (currentPage - 1).ToString()));
            }
            if (pageCount < 4)
            {
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            else if (currentPage < 4)
            {
                for (int i = 1; i <= 4; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem("...", (currentPage).ToString(), false));
            }
            else if (currentPage > pageCount - 4)
            {
                pages.Add(new ListItem("...", (currentPage).ToString(), false));
                for (int i = currentPage - 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            else
            {
                pages.Add(new ListItem("...", (currentPage).ToString(), false));
                for (int i = currentPage - 2; i <= currentPage + 2; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem("...", (currentPage).ToString(), false));
            }
            if (currentPage != pageCount)
            {
                pages.Add(new ListItem("next", (currentPage + 1).ToString()));
            }
            pages.Add(new ListItem(">>", pageCount.ToString(), currentPage < pageCount));
        }
        rptPagerTags.DataSource = pages;
        rptPagerTags.DataBind();
    }

    public void LatestProduct(string mcId)
    {

        if(mcId !=null)
        {
            DataTable dt = dl.get_Products_Recent(null, null, mcId, null, null, null, null);
            rptlstProduct.DataSource = dt;
            rptlstProduct.DataBind();

            rptLProdDesktop.DataSource = dt;
            rptLProdDesktop.DataBind();
        }

    }

    
    protected void rpt3_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hfMCategoryId = e.Item.FindControl("hfMCategoryId") as HiddenField;
            Repeater rptSpecifications = e.Item.FindControl("rptSpecifications") as Repeater;

            rptSpecifications.DataSource = dl.getProductSpecification(null, hfMCategoryId.Value, null, null);
            rptSpecifications.DataBind();
        }
    }


    protected void rpt5_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hfMCategoryId = e.Item.FindControl("hfMCategoryId") as HiddenField;
            Repeater rptSpecifications = e.Item.FindControl("rptSpecifications") as Repeater;

            rptSpecifications.DataSource = dl.getProductSpecification(null, hfMCategoryId.Value, null, null);
            rptSpecifications.DataBind();
        }
    }

    protected void Filter_Click(object sender, EventArgs e)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        showProducts("1");
    }

    public void loadFilters(string a)
    {
        rptFilter.DataSource = dl.getSpecificationHeads(a);
        rptFilter.DataBind();
    }

    protected void rptFilter_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hfCategoryId = e.Item.FindControl("hfCategoryId") as HiddenField;
            HiddenField hfSpecHead = e.Item.FindControl("hfSpecHead") as HiddenField;
            Repeater rptFilterValues = e.Item.FindControl("rptFilterValues") as Repeater;
            rptFilterValues.DataSource = dl.getFilterSpecifications(hfCategoryId.Value, hfSpecHead.Value);
            rptFilterValues.DataBind();
        }
    }


    protected void rptFilterCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hfMCategoryId = e.Item.FindControl("hfMCategoryId") as HiddenField;
            Repeater rptFilterSubCat = e.Item.FindControl("rptFilterSubCat") as Repeater;
            rptFilterSubCat.DataSource = dl.getCategory(hfMCategoryId.Value, null, true, null, null);
            rptFilterSubCat.DataBind();
        }
    }

    protected void Page_Changed(object sender, EventArgs e)
    {
        pnlpagrpt.Visible = true;
        pnlpagtags.Visible = false;
        string pageIndex = (sender as LinkButton).CommandArgument;
        showProducts(pageIndex);
    }

    protected void showCount_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        System.Threading.Thread.Sleep(5000);
       // lblStatus.Text = "Product ShowUpdated";
        q = Request.QueryString["imid"].ToString();
        m = Request.QueryString["MainCategoryId"].ToString();
        showProducts("1");
       
       
        
    }

    protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        showProducts("1");
    }
    protected void lkFIlterCategory_Click(object sender, EventArgs e)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        hfCatId.Value = (sender as LinkButton).CommandArgument;
        showProducts("1");
    }

    protected void chkFilterBrand_CheckedChanged(object sender, EventArgs e)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        showProducts("1");
    }

    protected void chkFilterColor_CheckedChanged(object sender, EventArgs e)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        showProducts("1");
    }

    
    //protected void chkFilterSoldOut_CheckedChanged(object sender, EventArgs e)
    //{

    //}
    //protected void chkFilterAvailable_CheckedChanged(object sender, EventArgs e)
    //{
    //    showProducts("1");
    //}

   
    protected void PriceFilterBy_Click(object sender, EventArgs e)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        showProducts("1");
      //  pricefilter.Visible = true;

        //string pricefilters = "";
        //pricefilters = pricefilter.Text;
        //string[] p = pricefilters.Split(';');
        //string minval = p[0].ToString();
        //string maxval = p[1].ToString();

        //DataTable dt = dl.showProducts(null, null, null, null, null, null, null, minval, maxval, null, null);
        //rpt.DataSource = dt;
        //rpt.DataBind();

        //rpt3.DataSource = dt;
        //rpt3.DataBind();

        //rpt5.DataSource = dt;
        //rpt5.DataBind();
        //if (dt.Rows.Count != 0)
        //{
        //    lblFirstIndex.Text = dt.Rows[0]["RowNumber"].ToString();
        //    lblLastIndex.Text = dt.Rows[dt.Rows.Count - 1]["RowNumber"].ToString();

        //    lblRecordCount.Text = dt.Rows[0]["RecordCount"].ToString();
        //    //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
        //   // GetGridDataBasedonPageIndex(Convert.ToInt32(dt.Rows[0]["RecordCount"].ToString()), Convert.ToInt32(PageIndex));
        //}
        //else
        //{
        //    lblFirstIndex.Text = "0";
        //    lblLastIndex.Text = "0";

        //    lblRecordCount.Text = "0";
        //    //   lblPageCount.Text = dt.Rows[0]["PageCount"].ToString();
        //    //GetGridDataBasedonPageIndex(0, 0);

        //}
    }
    protected void rpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
    protected void chkFilterOffer_CheckedChanged(object sender, EventArgs e)
    {
        pnlrpt.Visible = true;
        pnlTags.Visible = false;
        showProducts("1");
    }

    protected void lnkPageTags_Click(object sender, EventArgs e)
    {
        string pageIndex = (sender as LinkButton).CommandArgument;
        showproducttags(pageIndex);
    }
}