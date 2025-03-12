using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DealConfirmationList : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindData();
            Bindcustomer();
        }
    }

    private void BindData()
    {
        string customerid = null;
        if(ddlCustomer.SelectedValue != "")
        {
            customerid = ddlCustomer.SelectedValue;
        }
        grdData.DataSource = dl.get_DealConfirmation(null, null, customerid, null);
        grdData.DataBind();
    }
    private void Bindcustomer()
    {
        ddlCustomer.DataSource = dl.getCustomer(null, true);
        ddlCustomer.DataTextField = "CFullName";
        ddlCustomer.DataValueField = "CustomerId";
        ddlCustomer.DataBind();
        ddlCustomer.Items.Insert(0, new ListItem("Choose Customer", ""));
    }
    protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }
}