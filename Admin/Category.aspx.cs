using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Category : System.Web.UI.Page
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
            TagsName();
        }
    }
    private void BindData()
    {
        grdData.DataSource = dl.get_Category(null,null);
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
        txtCategoryName.Text = string.Empty;
        txtSequency.Text = string.Empty;
        ddlTags.SelectedIndex = -1;
        ViewState["Id"] = null;
    }
    protected void lnkAdd_Click(object sender, EventArgs e)
    {

        if (txtCategoryName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'CategoryName must be Added..!!!', type: 'error',});", true);
            return;
        }
        if(txtSequency.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Sequence must be Added..!!!', type: 'error',});", true);
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

            string filePath = null;
        if (FileUpload2.HasFiles)
        {
            string folderPath = Server.MapPath("~/VImage/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }
            filePath = "~/VImage/" + new Random().Next(1, 100000).ToString() + Path.GetFileName(FileUpload2.FileName);
            FileUpload2.SaveAs(Server.MapPath(filePath));
            hfIconFilePath.Value = filePath;

        }

        if (ViewState["Id"] == null)
        {
            int IId = dl.add_Category(null, txtCategoryName.Text, FilePath, filePath,null,txtSequency.Text, GetUserLoggedIn());
            if (IId != 0)
            {
                foreach (ListItem lpn in ddlTags.Items)
                {
                    if (lpn.Selected)
                    {
                        dl.add_CategoryTags(null, IId.ToString(), lpn.Value, GetUserLoggedIn());
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

            if(dl.update_Category(ViewState["Id"].ToString(),txtCategoryName.Text,hfImageFilePath.Value,hfIconFilePath.Value,null,txtSequency.Text, GetUserLoggedIn()))
            {
                dl.delete_CategoryTags(null, ViewState["Id"].ToString(), GetUserLoggedIn());
                foreach (ListItem lpi in ddlTags.Items)
                {
                    if (lpi.Selected)
                    {
                        dl.add_CategoryTags(null, ViewState["Id"].ToString(), lpi.Value, GetUserLoggedIn());
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
        if(dl.update_Category_Active_Status(chkIsActive.ToolTip,chkIsActive.Checked,GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;
        DataTable dt = dl.get_Category(lnkEdit.CommandArgument, null);
        if (dt.Rows.Count >0)
        {
            txtCategoryName.Text = dt.Rows[0]["CategoryHead"].ToString();
            hfImageFilePath.Value = dt.Rows[0]["CategoryImage"].ToString();
            hfIconFilePath.Value = dt.Rows[0]["CategoryIcon"].ToString();
            txtSequency.Text = dt.Rows[0]["CategorySequence"].ToString();
            ViewState["Id"] = lnkEdit.CommandArgument;
            DataTable dtc = dl.get_CategoryTags(null,lnkEdit.CommandArgument, null,null);
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
        if(dl.delete_Category(lnkDelete.CommandArgument,GetUserLoggedIn()))
        {
            dl.delete_CategoryTags(null,lnkDelete.CommandArgument,GetUserLoggedIn());
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
            HiddenField hfCategoryId = e.Row.FindControl("hfCategoryId") as HiddenField;
            GridView grdItems = e.Row.FindControl("grdItems") as GridView;
            grdItems.DataSource = dl.get_CategoryTags(null, hfCategoryId.Value, null, true);
            grdItems.DataBind();

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnkEdit = (e.Row.FindControl("lnkEdit") as LinkButton);
           // LinkButton lnkdelete = (e.Row.FindControl("lnkdelete") as LinkButton);
            CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
            lnkEdit.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
          //  lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
            chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[6].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[6].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
           // grdData.Columns[7].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);

        }
    }
}