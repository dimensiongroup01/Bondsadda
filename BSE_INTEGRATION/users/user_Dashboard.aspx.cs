using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BSE_INTEGRATION_users_user_Dashboard : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // For demo purposes, just bind dummy data for everyone
            gvBonds.DataSource = GetDummyBonds();
            gvBonds.DataBind();

        } 
    }

    protected void gvBonds_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // No actual functionality implemented, just placeholder
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = gvBonds.Rows[index];
        string bondName = row.Cells[0].Text;
        //string bondName = row.Cells[0].Text;

        if (e.CommandName == "Settle")
        {
            // Placeholder: Show a message or log
        }
        else if (e.CommandName == "Preview")
        {
            // Placeholder: Show a message or log
        }
    }

    private List<Bond> GetDummyBonds()
    {
        return new List<Bond>
        {
            new Bond { ID = "1", Name = "Bond A", Status = "Pending", Value = 10000, Allocation = 40 },
            new Bond { ID = "2", Name = "Bond B", Status = "Settled", Value = 15000, Allocation = 35 },
            new Bond { ID = "3", Name = "Bond C", Status = "Pending", Value = 5000, Allocation = 25 }
            
        };
    }

    // Dummy bond class for binding
    public class Bond
    { 
        public string ID { get; set; }
        public string Yield { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }
        public decimal Value { get; set; }
        public int Allocation { get; set; }
    }
}

