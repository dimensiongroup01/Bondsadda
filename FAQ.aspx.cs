using System;
using System.Web.UI;

public partial class FAQ : System.Web.UI.Page
{
    DAL dl = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        rptFAQ.DataSource = dl.get_AskQuestion(null, null, null, null);
        rptFAQ.DataBind();
    }
}
