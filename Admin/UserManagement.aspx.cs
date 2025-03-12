using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserManagement : System.Web.UI.Page
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
        grdData.DataSource = dl.getPanelUsers(null, null);
        grdData.DataBind();
    }
    private void Clear()
    {
        txtFullName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtMobile.Text = string.Empty;
        txtPassword.Text = string.Empty;    
        txtUserName.Text = string.Empty;
        chkRM.Checked = false;
        ViewState["Id"] = null;
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
    public bool IsValidMail(string emailaddress)
    {
        try
        {
            MailAddress m = new MailAddress(emailaddress);
            return true;
        }
        catch (FormatException)
        {
            return false;
        }
    }
    protected void lnkAdd_Click(object sender, EventArgs e)
    {
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
        if (txtFullName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'FullName Required..!!!', type: 'error',});", true);
            return;
        }
        if(txtEmail.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Email Required..!!!', type: 'error',});", true);
            return;
        }
        if(!IsValidMail(txtEmail.Text)) 
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Email Enter..!!!', type: 'error',});", true);
            return;
        }
        if(txtMobile.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Mobile Required..!!!', type: 'error',});", true);
            return;
        }
        if(txtPassword.Text =="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Password Required..!!!', type: 'error',});", true);
            return;
        }
        if(txtUserName.Text=="")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'UserName Required..!!!', type: 'error',});", true);
            return;
        }
        string RM = null;
        if(chkRM.Checked)
        {
            RM = "1";
        }
        else
        {
            RM= "0";
        }
        if (ViewState["Id"] == null)
        {

            if (dl.AddPanelUser(null, txtFullName.Text, txtEmail.Text, txtMobile.Text, txtUserName.Text, txtPassword.Text,RM,FilePath, "User", GetUserLoggedIn()))
                {
                    Clear();
                    BindData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Added Successfully', type: 'Success',});", true);

            }

        }
        else
        {

            if (dl.AddPanelUser(ViewState["Id"].ToString(),txtFullName.Text,txtEmail.Text,txtMobile.Text, txtUserName.Text,txtPassword.Text,RM,hfImageFilePath.Value, "User", GetUserLoggedIn()))
            {

                Clear();
                BindData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'Success',});", true);

            }
        }
    }

    protected void chkIsActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkIsActive = (CheckBox)sender;
        if (dl.updatePanelUserActiveStatus(chkIsActive.Checked, chkIsActive.ToolTip))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Data Updated Successfully', type: 'Success',});", true);
        }
    }



    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        if (dl.deletePanelUser(lnkDelete.CommandArgument, null))
        {
            BindData();

        }
    }

    private void getPermision()
    {
        DataTable dtsubpermission = dl.getPanelUserMenuSubPermission(GetUserLoggedIn(), ViewState["MainMenuId"].ToString(), ViewState["SubmemnuId"].ToString());
        pnlAdd.Visible = Convert.ToBoolean(dtsubpermission.Rows[0]["CanAdd"]);
        pnlView.Visible = true;

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
            grdData.Columns[8].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[8].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanUpdate"]);
            grdData.Columns[9].Visible = Convert.ToBoolean(dtsubpermission1.Rows[0]["CanDelete"]);

        }

    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton lnkEdit = (LinkButton)sender;
        DataTable dt = dl.getPanelUsers(lnkEdit.CommandArgument, null);
        if (dt.Rows.Count > 0)
        {
            txtFullName.Text = dt.Rows[0]["FullName"].ToString();
            txtEmail.Text = dt.Rows[0]["Email"].ToString();
            txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
            txtPassword.Text = dt.Rows[0]["Password"].ToString();
            txtUserName.Text = dt.Rows[0]["UserName"].ToString();
            chkRM.Checked = Convert.ToBoolean(dt.Rows[0]["RM"].ToString());
            hfImageFilePath.Value = dt.Rows[0]["Image"].ToString();
            ViewState["Id"] = lnkEdit.CommandArgument;
        }
    }
}