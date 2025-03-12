using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_BlogNews : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string url = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            DataTable dtsub = dl.getPanelMenuSubByurl(url);
            ViewState["SubmemnuId"] = dtsub.Rows[0]["SubMenuId"].ToString();
            ViewState["MainMenuId"] = dtsub.Rows[0]["MainMenuId"].ToString();
            getPermision();
            BindData();
            BlogCategoryName();
            Tags();
        }
    }
    private void BindData()
    {
        grdData.DataSource = dl.get_BlogNews(null, null, null);
        grdData.DataBind();
    }
    private void BlogCategoryName()
    {
        ddlSubCategory.DataSource = dl.get_BlogCategory(null, null);
        ddlSubCategory.DataTextField = "BlogCategoryHead";
        ddlSubCategory.DataValueField = "BlogCategoryId";
        ddlSubCategory.DataBind();
        ddlSubCategory.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void Tags()
    {
        ddlTags.DataSource = dl.get_Tags(null, null);
        ddlTags.DataTextField = "TagsHead";
        ddlTags.DataValueField = "TagsId";
        ddlTags.DataBind();
        //ddlTags.Items.Insert(0, new ListItem("Choose one", "-1"));
    }

    private void Clear()
    {
        ddlSubCategory.SelectedIndex= 0;
        txtBlogDate.Text = string.Empty;
        txtAuthorBy.Text = string.Empty;
        txtBlogTitle.Text = string.Empty;
        txtBlogSubTitle.Text = string.Empty;
        txtMetaDescription.Text = string.Empty;
        txtDescription.Text = string.Empty;
        ddlTags.SelectedIndex = -1;
        ViewState["Id"] = null;
    }

    protected void lnkAdd_Click(object sender, EventArgs e)
    {
        if(ddlSubCategory.SelectedIndex ==0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Category Required ...!!!', type: 'error',});", true);
            return;
        }
        if(txtBlogDate.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Blog Date Required ...!!!', type: 'error',});", true);
            return;
        }
        if(txtAuthorBy.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Author By Required ...!!!', type: 'error',});", true);
            return;
        }
        if(txtBlogTitle.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Blog Title Required ...!!!', type: 'error',});", true);
            return;
        }
        if(txtBlogSubTitle.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Blog SubTitle Required ...!!!', type: 'error',});", true);
            return;
        }
        if(txtMetaDescription.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'MetaDescription Required ...!!!', type: 'error',});", true);
            return;
        }
        if(txtDescription.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Description Required ...!!!', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"]==null)
        {
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
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Image Required ...!!!', type: 'error',});", true);
                return;
            }
            int IId = dl.add_BlogNews(null, ddlSubCategory.SelectedValue, filePath, txtBlogDate.Text, txtAuthorBy.Text, txtBlogTitle.Text, txtBlogSubTitle.Text, txtMetaDescription.Text, txtDescription.Text, GetUserLoggedIn());
            if(IId !=0)
            {
                foreach (ListItem lpn in ddlTags.Items)
                {
                    if (lpn.Selected)
                    {
                        dl.add_BlogTags(null, IId.ToString(), lpn.Value, GetUserLoggedIn());
                    }
                }
                Clear();
                BindData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'success',});", true);
                return;
            }
        }
        else
        {
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
            if (dl.update_BlogNews(ViewState["Id"].ToString(), ddlSubCategory.SelectedValue, hfImageFilePath.Value, txtBlogDate.Text, txtAuthorBy.Text, txtBlogTitle.Text, txtBlogSubTitle.Text, txtMetaDescription.Text, txtDescription.Text, GetUserLoggedIn()))
            {
                dl.delete_BlogTags(null, ViewState["Id"].ToString(), GetUserLoggedIn());
                foreach (ListItem lpi in ddlTags.Items)
                {
                    if (lpi.Selected)
                    {
                        dl.add_BlogTags(null, ViewState["Id"].ToString(), lpi.Value, GetUserLoggedIn());
                    }
                }
                Clear();
                BindData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
                return;
            }
        }
    }
    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if (dl.update_BlogNews_Active_Status(chkIsActive.ToolTip, chkIsActive.Checked, GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;
        DataTable dt = dl.get_BlogNews(lnkEdit.CommandArgument, null, null);
        if (dt.Rows.Count > 0)
        {
            ddlSubCategory.SelectedValue = dt.Rows[0]["BlogCategoryId"].ToString();
            txtBlogDate.Text = dt.Rows[0]["BlogDate"].ToString();
            hfImageFilePath.Value = dt.Rows[0]["BlogImage"].ToString();
            txtAuthorBy.Text = dt.Rows[0]["AuthorBy"].ToString();
            txtBlogTitle.Text = dt.Rows[0]["BlogTitle"].ToString();
            txtBlogSubTitle.Text = dt.Rows[0]["BlogSubTitle"].ToString();
            txtMetaDescription.Text = dt.Rows[0]["MetaDescription"].ToString();
            txtDescription.Text = dt.Rows[0]["Description"].ToString();
            ViewState["Id"] = lnkEdit.CommandArgument;
            DataTable dtc = dl.get_BlogTags(null, lnkEdit.CommandArgument, null, null);
            {
                foreach (DataRow row in dtc.Rows)
                {
                    ddlTags.Items.FindByValue(row["TagsId"].ToString()).Selected = true;

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
    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        if (dl.delete_BlogNews(lnkDelete.CommandArgument, GetUserLoggedIn()))
        {
            dl.delete_BlogTags(null,lnkDelete.CommandArgument, GetUserLoggedIn());
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
            CheckBox chkTopBlog = (e.Row.FindControl("chkTopBlog") as CheckBox);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
            lnkEdit.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
            chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            chkTopBlog.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[9].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[10].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[10].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[11].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfBlogId = e.Row.FindControl("hfBlogId") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            grdItems.DataSource = dl.get_BlogTags(null, hfBlogId.Value, null, true);
            grdItems.DataBind();

        }
    }

    protected void chkTopBlog_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkTopBlog = (CheckBox)sender;
        if(dl.update_BlogNews_CheckTopBlog_Status(chkTopBlog.ToolTip,chkTopBlog.Checked,GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Blog Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }
}