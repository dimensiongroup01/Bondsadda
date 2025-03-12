using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BlogNewsDetails : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BlogTags();
            BindBondType();
        }
        if (Request.QueryString["oId"] != null)
        {
            //string decryptedText = EncryptionHelper.Decrypt(Request.QueryString["oId"].ToString());
            getData(Request.QueryString["oId"].ToString());

        }
    }
    private void BlogTags()
    {
        rptCreditRating.DataSource = dl.get_BlogTagsData(null, true);
        rptCreditRating.DataBind();

    }

    private void BindBondType()
    {
        rptTags.DataSource = dl.get_BlogNewsCategory(null,null, true);
        rptTags.DataBind();
    }
    protected void btnCredit_Click(object sender, EventArgs e)
    {
        Button lnkCredit = (Button)sender;
        string Credit = lnkCredit.CommandArgument.ToString();
        //string encryptedText = EncryptionHelper.Encrypt(lnkCredit.CommandArgument);

        Response.Redirect("BlogNewsData?oId=" + lnkCredit.CommandArgument);

    }
    private void getData(string Data)
    {
        DataTable dt = new DAL().get_BlogNews(Data,null, true);
        if (dt.Rows.Count > 0)
        {
            this.Page.Title = dt.Rows[0]["BlogTitle"].ToString();

        }
        rptBlogDetails.DataSource = dt;
        rptBlogDetails.DataBind();
        //rptNewsSide.DataSource = dl.get_BlogNews(Data, null, true);
        //rptNewsSide.DataBind();
        //rptTags.DataSource = dl.get_BlogNews(null,null, null);
        //rptTags.DataBind();
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
    
    protected void lnkdetail_Click(object sender, EventArgs e)
    {
        LinkButton lnkdetail = (LinkButton)sender;
       // string encryptedText = EncryptionHelper.Encrypt(lnkdetail.CommandArgument);

        Response.Redirect("BlogNewsData?oId=" + lnkdetail.CommandArgument);
    }
}