using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewInvestmentNow : System.Web.UI.Page
{
    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if(GetUserLoggedIn() != null)
            {
                UserDetails();
                BindData();
            }
        }
    }

    private void UserDetails()
    {
        DataTable dt = dl.getPanelUsers(GetUserLoggedIn(), null);
        if (dt.Rows.Count > 0)
        {
            string RM = dt.Rows[0]["RM"].ToString();
            hfRM.Value = RM;
        }
    }
    private void BindData()
    {

        if (hfRM.Value == "True")
        {
            grdData.DataSource = dl.get_Investment(null,null,null, GetUserLoggedIn(), null);
            grdData.DataBind();
            init_DataTable();
        }
        if (hfRM.Value == "False")
        {
            grdData.DataSource = dl.get_Investment(null, null,null,null,null);
            grdData.DataBind();
            init_DataTable();
        }
        
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