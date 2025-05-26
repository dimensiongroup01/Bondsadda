using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BSE_INTEGRATION_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthToken"] == null)
        {
            Response.Redirect("Login.aspx");
            return; // ensure no further execution
        }
        string dealerId = Session["dealerId"] as string;

        if (!string.IsNullOrEmpty(dealerId))
        {
            lblDealerID.Text = "Your Dealer ID: " + dealerId;
        }
        else
        {
            lblDealerID.Text = "Your Dealer ID: Unknown Dealer";
        }

    }
 

             protected void btnLogout_Click(object sender, EventArgs e)
            {
                Session.Clear();
                Response.Redirect("Login.aspx");


            }

}