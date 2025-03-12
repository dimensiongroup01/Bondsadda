using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewBookedSold : System.Web.UI.Page
{
    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_Data();
        }
    }
    private void load_Data()
    {
        grdData.DataSource = dl.getPanelUsers("", null);
        grdData.DataBind();
    }

    protected void lnkFilter_Click(object sender, EventArgs e)
    {

    }
}