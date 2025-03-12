using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SubscriberDetails : System.Web.UI.Page
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
        grdData.DataSource = dl.getSubscribe(null,null);
        grdData.DataBind();
        init_DataTable();
    }

    private void init_DataTable()
    {
        if (grdData.Rows.Count != 0)
        {
            grdData.HeaderRow.TableSection = TableRowSection.TableHeader;
            grdData.UseAccessibleHeader = true;
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup11", "setTimeout(function(){init_DataTable();},2000);", true);
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
    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}