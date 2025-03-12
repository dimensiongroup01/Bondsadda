using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Product : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindData();
            TagsName();
            CategoryName();
            PaymentType();
        }
    }
    private void BindData()
    {
        grdData.DataSource = dl.get_Product(null, null,null);
        grdData.DataBind();
    }
    private void TagsName()
    {
        ddlTags.DataSource = dl.get_Tags(null, true);
        ddlTags.DataTextField = "TagsHead";
        ddlTags.DataValueField = "TagsId";
        ddlTags.DataBind();
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
        ddlPayment.DataSource = dl.get_PaymentType(null, null);
        ddlPayment.DataTextField = "PaymentTypeHead";
        ddlPayment.DataValueField = "PaymentTypeId";
        ddlPayment.DataBind();
        ddlPayment.Items.Insert(0, new ListItem("Choose one", "-1"));
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
        txtYield.Text = string.Empty;
        txtPrice.Text = string.Empty;
        txtMaturitydate.Text = string.Empty;
        txtCouponRate.Text = string.Empty;
        ddlPayment.SelectedIndex= 0;
        ddlTags.SelectedIndex = -1;
        ViewState["Id"] = null;
    }

    protected void lnkAdd_Click(object sender, EventArgs e)
    {
        if(ddlSubCategory.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'CategoryName must be Added..!!!', type: 'error',});", true);
            return;
        }
        if(txtProductName.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'ProductName must be Added..!!!', type: 'error',});", true);
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
        if(txtYield.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Yield must be Added..!!!', type: 'error',});", true);
            return;
        }
        if(ddlPayment.SelectedIndex==0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Payment Type must be Added..!!!', type: 'error',});", true);
            return;
        }
        if(txtMaturitydate.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Date must be Added..!!!', type: 'error',});", true);
            return;
        }
        if(txtPrice.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'MinInvestment must be Added..!!!', type: 'error',});", true);
            return;
        }
        if(txtCouponRate.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'CouponRate must be Added..!!!', type: 'error',});", true);
            return;
        }

        if (ViewState["Id"]==null)
        {
            int IId = dl.add_Product(null, ddlSubCategory.SelectedValue, txtProductName.Text, filePath, txtYield.Text, ddlPayment.SelectedValue, txtMaturitydate.Text, txtPrice.Text, txtCouponRate.Text,txtDescription.Text, GetUserLoggedIn());
            if(IId !=0)
            {
                foreach(ListItem lpl in ddlTags.Items)
                {
                    if(lpl.Selected)
                    {
                        dl.add_ProductTags(null, IId.ToString(), lpl.Value, GetUserLoggedIn());
                    }
                }
                clear();
                BindData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                return;
            }
        }
        else
        {
            if (dl.update_Product(ViewState["Id"].ToString(),ddlSubCategory.SelectedValue,txtProductName.Text,hfImageFilePath.Value,txtYield.Text,ddlPayment.SelectedValue,txtMaturitydate.Text,txtPrice.Text,txtCouponRate.Text,txtDescription.Text, GetUserLoggedIn()))
            {
                dl.delete_ProductTags(null, ViewState["Id"].ToString(), GetUserLoggedIn());
                foreach(ListItem lpp in ddlTags.Items)
                {
                    if(lpp.Selected)
                    {
                        dl.add_ProductTags(null, ViewState["Id"].ToString(),lpp.Value, GetUserLoggedIn());
                    }
                }
                clear();
                BindData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
                return;
            }
        }
    }

    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;    
        if(dl.update_Product_Active_Status(chkIsActive.ToolTip,chkIsActive.Checked,GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;
        DataTable dt = dl.get_Product(lnkEdit.CommandArgument, null, null);
        if(dt.Rows.Count>0)
        {
            ddlSubCategory.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
            txtProductName.Text = dt.Rows[0]["ProductName"].ToString();
            hfImageFilePath.Value = dt.Rows[0]["ProductImage"].ToString();
            txtYield.Text = dt.Rows[0]["Yield"].ToString();
            ddlPayment.SelectedValue = dt.Rows[0]["PaymentTypeId"].ToString();
            txtMaturitydate.Text = dt.Rows[0]["MaturityDate"].ToString();
            txtPrice.Text = dt.Rows[0]["MinInvestment"].ToString();
            txtCouponRate.Text = dt.Rows[0]["CouponRate"].ToString();
            txtDescription.Text = dt.Rows[0]["Description"].ToString();
            ViewState["Id"] = lnkEdit.CommandArgument;
            DataTable dtm = dl.get_ProductTags(null,lnkEdit.CommandArgument,null, null);
            if(dtm.Rows.Count>0)
            {
                foreach (DataRow row in dtm.Rows)
                {
                    ddlTags.Items.FindByValue(row["TagsId"].ToString()).Selected = true;

                }
            }

        }
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;  
        if(dl.delete_Product(lnkDelete.CommandArgument,GetUserLoggedIn()))
        {
            dl.delete_ProductTags(null, lnkDelete.CommandArgument, GetUserLoggedIn());
            BindData();
        }
    }
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfProductId = e.Row.FindControl("hfProductId") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            grdItems.DataSource = dl.get_ProductTags(null, hfProductId.Value, null, true);
            grdItems.DataBind();

        }
    }
}