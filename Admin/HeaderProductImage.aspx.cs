using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_HeaderProductImage : System.Web.UI.Page
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
            CategoryName();
        }
    }

    private void BindData()
    {
        grdData.DataSource = dl.get_HProductImage(null,null,null, null);
        grdData.DataBind();
    }
    private void ProductName()
    {
        ddlProduct.DataSource = dl.get_ProductsImageName(ddlCategory.SelectedValue);
        ddlProduct.DataTextField = "ProductName";
        ddlProduct.DataValueField = "ProductName";
        ddlProduct.DataBind();
        ddlProduct.Items.Insert(0, new ListItem("Choose One", ""));
    }
    private void CategoryName()
    {
        ddlCategory.DataSource = dl.get_Category(null,  true);
        ddlCategory.DataTextField = "CategoryHead";
        ddlCategory.DataValueField = "CategoryId";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("Choose One", ""));
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
        ddlCategory.SelectedIndex = 0;
        ddlProduct.SelectedIndex = 0;
        ViewState["Id"] = null;
    }
    protected void lnkAdd_Click(object sender, EventArgs e)
    {

        if (ddlCategory.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'CategoryName must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (ddlProduct.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Product Name must be Added..!!!', type: 'error',});", true);
            return;
        }
        //if (txtFontIcon.Text == "")
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Category Font Icon must be Added..!!!', type: 'error',});", true);
        //    return;
        //}
        string FilePath = null;
        if (FileUpload1.HasFiles)
        {
            string folderPath = Server.MapPath("~/VImage/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }
            FilePath = "~/VImage/" + new Random().Next(1, 100000).ToString() + Path.GetFileName(FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath(FilePath));
            hfImageFilePath.Value = FilePath;

        }

        if (ViewState["Id"] == null)
        {
            if (dl.add_HProductImage(null, ddlProduct.SelectedValue, ddlCategory.SelectedValue, FilePath, GetUserLoggedIn()))
            {
                clear();
                BindData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                return;
            }
        }
        else
        {

            if (dl.add_HProductImage(ViewState["Id"].ToString(), ddlProduct.SelectedValue, ddlCategory.SelectedValue, hfImageFilePath.Value, GetUserLoggedIn()))
            {
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
        if (dl.update_HProductImage_Active_Status(chkIsActive.ToolTip, chkIsActive.Checked, GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;
        DataTable dt = dl.get_HProductImage(lnkEdit.CommandArgument,null,null, null);
        if (dt.Rows.Count > 0)
        {

            ddlCategory.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
            ProductName();
            ddlProduct.SelectedValue = dt.Rows[0]["ProductName"].ToString();
            hfImageFilePath.Value = dt.Rows[0]["HProductImagePath"].ToString();
            ViewState["Id"] = lnkEdit.CommandArgument;
            
        }
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        if (dl.delete_HProductImage(lnkDelete.CommandArgument, GetUserLoggedIn()))
        {
            BindData();
        }
    }

    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        pnlAdd.Visible = Convert.ToBoolean(dtsubpermission.Rows[0]["CanAdd"]);
        // pnlView.Visible = true;

    }
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnkEdit = (e.Row.FindControl("lnkEdit") as LinkButton);
            LinkButton lnkdelete = (e.Row.FindControl("lnkdelete") as LinkButton);
            CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
            lnkEdit.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
            chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[4].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[4].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[5].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);

        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ProductName();
    }
}