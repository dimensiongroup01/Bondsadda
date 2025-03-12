using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AskQuestion : System.Web.UI.Page
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
            BindBondsName();
        }
    }
    private void CategoryName()
    {
        ddlCategory.DataSource = dl.get_FAQCategory(null, null);
        ddlCategory.DataTextField = "FAQCategoryHead";
        ddlCategory.DataValueField = "FAQCategoryId";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("Choose one", "-1"));
    }
    private void BindData()
    {
        grdData.DataSource = dl.get_AskQuestion(null,null,null,null);
        grdData.DataBind();
    }

    private void BindBondsName()
    {
        ddlBondsName.DataSource = dl.get_Products(null,null,null,null);
        ddlBondsName.DataTextField = "Security";
        ddlBondsName.DataValueField = "ProductsId";
        ddlBondsName.DataBind();
        //ddlBondsName.Items.Insert(0, new ListItem("Choose One", "-1"));
        
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
    protected void lnkAdd_Click(object sender, EventArgs e)
    {
        if(ddlCategory.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Category Head must be Added..!!!', type: 'error',});", true);
            return;
        }
        if(txtQuestion.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Question must be Added..!!!', type: 'error',});", true);
            return;
        }
        if(txtAnswer.Text  == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Answer must be Added..!!!', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"] == null)
        {
            int IId = dl.add_AskQuestion(null, null,ddlCategory.SelectedValue, txtQuestion.Text, txtAnswer.Text, GetUserLoggedIn());
            if (IId != 0)
            {
                foreach (ListItem lpl in ddlBondsName.Items)
                {
                    if (lpl.Selected)
                    {
                        dl.add_FAQProducts(null, lpl.Value,ddlCategory.SelectedValue, IId.ToString(), GetUserLoggedIn());
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
            dl.update_AskQuestion(ViewState["Id"].ToString(), null,ddlCategory.SelectedValue, txtQuestion.Text, txtAnswer.Text, GetUserLoggedIn());
            dl.delete_FAQProducts(null, ViewState["Id"].ToString(), GetUserLoggedIn());
            foreach (ListItem lpp in ddlBondsName.Items)
            {
                if (lpp.Selected)
                {
                    dl.add_FAQProducts(null, lpp.Value,ddlCategory.SelectedValue, ViewState["Id"].ToString(), GetUserLoggedIn());
                }
            }
            Clear();
            BindData();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'success',});", true);
            return;

        }

    }
    private void Clear()
    {
        txtAnswer.Text = string.Empty;
        txtQuestion.Text = string.Empty;
        ddlBondsName.SelectedIndex = 0;
        ddlCategory.SelectedIndex = -1;
        ViewState["Id"] = null;
    }
    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if(dl.update_AskQuestion_Active_Status(chkIsActive.ToolTip,chkIsActive.Checked,GetUserLoggedIn()))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Update Successfully', type: 'success',});", true);
            return;
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;
        DataTable dt = dl.get_AskQuestion(lnkEdit.CommandArgument,null,null, null);
        if(dt.Rows.Count > 0)
        {
            ddlCategory.SelectedValue = dt.Rows[0]["FAQCategoryId"].ToString();
            txtQuestion.Text = dt.Rows[0]["Question"].ToString();
            txtAnswer.Text = dt.Rows[0]["Answer"].ToString();
            ViewState["Id"] = lnkEdit.CommandArgument;
            
            DataTable dtm = dl.get_FAQProducts(null,null,null,lnkEdit.CommandArgument,null);
            if (dtm.Rows.Count > 0)
            {
                foreach (DataRow row in dtm.Rows)
                {
                    ddlBondsName.Items.FindByValue(row["ProductsId"].ToString()).Selected = true;

                }
            }

        }
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        if(dl.delete_AskQuestion(lnkDelete.CommandArgument,GetUserLoggedIn()))
        {
            BindData();
        }
    }


    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnkEdit = (e.Row.FindControl("lnkEdit") as LinkButton);
            LinkButton lnkdelete = (e.Row.FindControl("lnkDelete") as LinkButton);
            CheckBox chkIsActive = (e.Row.FindControl("chkIsActive") as CheckBox);
            DataTable dtsubpermission1 = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
            lnkEdit.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            lnkdelete.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);
            chkIsActive.Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[5].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[5].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[6].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfAskQuestion = e.Row.FindControl("hfAskQuestion") as HiddenField;
            GridView grdItemsData = e.Row.FindControl("grdItemsData") as GridView;
            grdItemsData.DataSource = dl.get_FAQProducts(null,null,null, hfAskQuestion.Value, true);
            grdItemsData.DataBind();

        }
    }
    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        pnlAdd.Visible = Convert.ToBoolean(dtsubpermission.Rows[0]["CanAdd"]);
        pnlView.Visible = true;

    }

}