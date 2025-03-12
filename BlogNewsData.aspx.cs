using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BlogNewsData : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString["oId"] != null)
            {
                //string decryptedText = EncryptionHelper.Decrypt(Request.QueryString["oId"].ToString());
                getData(Request.QueryString["oId"].ToString());
            }
            if (Request.QueryString["ooId"] !=null)
            {
                //string decryptedText = EncryptionHelper.Decrypt(Request.QueryString["oId"].ToString());
                getBlogTags(Request.QueryString["oIId"].ToString());
            }
            BindData();
            BlogTags();
            BindBondsType();
        }
    }
    private void BlogTags()
    {
        rptCreditRating.DataSource = dl.get_BlogTagsData(null, true);
        rptCreditRating.DataBind();
         
    }
    private void BindBondsType()
    {
        DataTable dt = dl.get_BlogNewsCategory(null,null, true);
        rptTags.DataSource = dt;
        rptTags.DataBind();
    }
    private void getData(string Data)
    {
        rptNews.DataSource = dl.get_BlogNews(null,Data,true);
        rptNews.DataBind();
        hfDataa.Value = Data;
    }
    private void getBlogTags(string Data)
    {
        rptNews.DataSource = dl.get_BlogNewsTags(null, null, null, Data, true);
        rptNews.DataBind();
    }
    private void BindData()
    {
        DataTable dt = dl.get_BlogNews(null, null, true);
        if (hfDataa.Value == "")
        {

            rptNews.DataSource = dt;
            rptNews.DataBind();
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
    private void clear()
    {
        txtEmail.Text = string.Empty;
    }
    protected void btnSubscribe_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Email Required', type: 'error',});", true);
            return;
        }
        if (!IsValidMail(txtEmail.Text))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Valid Email Must Be Enter', type: 'error',});", true);
            return;
        }
        if (ViewState["Id"] == null)
        {
            if (dl.AddSubscribe(null, txtEmail.Text))
            {
                clear();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Subscribe Successfully', type: 'success',});", true);
                return;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'Already Subscribe', type: 'success',});", true);
                return;
            }
        }
    }



    protected void chkData_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void btnCredit_Click(object sender, EventArgs e)
    {
        Button lnkCredit = (Button)sender;
        string Credit = lnkCredit.CommandArgument.ToString();
        rptNews.DataSource = dl.get_BlogNewsTags(null,null, null, Credit, true);
        rptNews.DataBind();
    }

    protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }

    protected void lnkviewdetails_Click(object sender, EventArgs e)
    {
        LinkButton lnkdetail = (LinkButton)sender;
        //string encryptedText = EncryptionHelper.Encrypt(lnkdetail.CommandArgument);
        
        Response.Redirect("BlogNewsDetails?oId=" + lnkdetail.CommandArgument);
    }

    protected void lnkdetail_Click(object sender, EventArgs e)
    {
        LinkButton lnkdetail = (LinkButton)sender;
        //string encryptedText = EncryptionHelper.Encrypt(lnkdetail.CommandArgument);

        Response.Redirect("BlogNewsData?oId=" + lnkdetail.CommandArgument);
    }
}