using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MasterPage : System.Web.UI.MasterPage
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (GetUserLoggedIn() != null)
            {

                getUserDetails();
            }
            else
            {
                Response.Redirect("~/AdminLogin.aspx");
            }

        }
    }

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminLogin.aspx");
    }
    private void getUserDetails()
    {
        DataTable dtme = dl.getPanelUsers(GetUserLoggedIn(), null);
        if (dtme.Rows.Count != 0)
        {
            divMemberCode.InnerHtml = "Welcome! " + dtme.Rows[0]["FullName"].ToString();
            divRole.InnerHtml = "Hi, " + dtme.Rows[0]["Role"].ToString();
            hfUserRole.Value = dtme.Rows[0]["Role"].ToString();
            getUserMenu();
        }
        else
        {
            lnkLogout_Click(null, null);
            Response.Redirect("~/loginnow.aspx");
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

    private void getUserMenu()
    {
        string userId = null;
        bool? CanAccess = null;
        if (hfUserRole.Value == "User")
        {
            userId = GetUserLoggedIn();
            CanAccess = true;
        }
        rptMainMenu.DataSource = dl.getPanelMemberMenuMain(userId, CanAccess);
        rptMainMenu.DataBind();
    }

    protected void rptMainMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string userId = null;
            bool? CanAccess = null;
            if (hfUserRole.Value == "User")
            {
                userId = GetUserLoggedIn();
                CanAccess = true;
            }

            string MainMenuId = (e.Item.FindControl("hfMainMenuId") as HiddenField).Value;
            Repeater rptSubMenu = e.Item.FindControl("rptSubMenu") as Repeater;
           
            rptSubMenu.DataSource = dl.getPanelMemberMenuSub(MainMenuId, userId, CanAccess);
            rptSubMenu.DataBind();
        }
    }
    protected void lnkLogout_Click1(object sender, EventArgs e)
    {
        //Create a new cookie, passing the name into the constructor
        HttpCookie cookie = new HttpCookie("DGBA");
        //Set the cookies value
        cookie.Value = null;
        //Set the cookie to expire in 1 minute
        DateTime dtNow = DateTime.Now;
        TimeSpan tsMinute = new TimeSpan(-2, 0, 0, 0);
        cookie.Expires = dtNow + tsMinute;
        //Add the cookie
        Response.Cookies.Add(cookie);

        Response.Redirect("~/AdminLogin.aspx");

    }

    protected void rptSubMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string userId = null;
            bool? CanAccess = null;
            if (hfUserRole.Value == "User")
            {
                userId = GetUserLoggedIn();
                CanAccess = true;
            }
            Panel withouchild = (e.Item.FindControl("withoutchild") as Panel);
            Panel pnlWithChild = (e.Item.FindControl("pnlWithChild") as Panel);
            string SubMenuId = (e.Item.FindControl("hfSubMenuId") as HiddenField).Value;
            HiddenField hfSubMenuUrl = (e.Item.FindControl("hfSubMenuUrl") as HiddenField);
            Repeater rptChildSubMenu = e.Item.FindControl("rptChildSubMenu") as Repeater;
         
            if (hfSubMenuUrl.Value != "")
            {
                withouchild.Visible = true;
                pnlWithChild.Visible = false;
            }
            if (hfSubMenuUrl.Value == "")
            {
                withouchild.Visible = false;
                pnlWithChild.Visible = true;
                rptChildSubMenu.DataSource = dl.getPanelChildMemberMenuSub(SubMenuId, userId, CanAccess);
                rptChildSubMenu.DataBind();
            }


        }
    }
}
