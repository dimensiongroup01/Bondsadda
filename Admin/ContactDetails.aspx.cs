using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ContactDetails : System.Web.UI.Page
{

    DAL dl = new DAL(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindData();
        }
    }
    private void BindData()
    {
        grdData.DataSource = dl.getContactDetails(null,null);
        grdData.DataBind();
    }
}