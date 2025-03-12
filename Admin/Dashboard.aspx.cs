using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Dashboard : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Count();
        }
    }

    private void Count()
    {
        DataTable dtA = dl.get_ProductsBullet(null, null, null,null);
        int AdtA = dtA.Rows.Count;
        divBullet.InnerText = dtA.Rows.Count.ToString();
        DataTable dtB = dl.get_ProductsStaggered(null, null, null, null);
        int AdtB = dtB.Rows.Count;
        divStaggered.InnerText = dtB.Rows.Count.ToString();
        DataTable dtC = dl.getCustomer(null, null);
        int AdtC = dtC.Rows.Count;
        divCustomer.InnerText = dtC.Rows.Count.ToString();
        DataTable dtD = dl.get_PartnerDetails(null, null);
        int AdtD = dtD.Rows.Count;
        divPartners.InnerText = dtD.Rows.Count.ToString();
        DataTable dtE = dl.get_SellBond(null, null, null, null, null, null, null, null);
        int AdtE = dtE.Rows.Count;
        divSellBond.InnerText = dtE.Rows.Count.ToString();
        DataTable dtF = dl.getPanelUsers(null, null);
        int AdtF = dtF.Rows.Count;
        divUser.InnerText = dtF.Rows.Count.ToString();
        DataTable dtG = dl.get_BlogNews(null, null,null);
        int AdtG = dtG.Rows.Count;
        divBlog.InnerText = dtG.Rows.Count.ToString();
        DataTable dtH = dl.getSubscribe(null, null);
        int AdtH = dtH.Rows.Count;
        divSubscriber.InnerText = dtH.Rows.Count.ToString();
        DataTable dtI = dl.get_ProductsCumulative(null, null, null, null);
        int AdtI = dtI.Rows.Count;
        divcumulative.InnerText = dtI.Rows.Count.ToString();
    }
}