using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_MasterPage : System.Web.UI.MasterPage
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
                Response.Redirect("~/UserLogin.aspx");
            }

        }
    }

    private void getUserDetails()
    {
        DataTable dtme = dl.getCustomer(GetUserLoggedIn(), null);
        if (dtme.Rows.Count != 0)
        {
            divMemberCode.InnerHtml = "Welcome! " + dtme.Rows[0]["CFullName"].ToString();
           // divRole.InnerHtml = "Hi, " + dtme.Rows[0]["Role"].ToString();
           // hfUserRole.Value = dtme.Rows[0]["Role"].ToString();
            //getUserMenu();
        }
        else
        {
            lnkLogout_Click(null, null);
            Response.Redirect("~/UserLogin.aspx");
        }

    }
    private string GetUserLoggedIn()
    {

        HttpCookie cookieuser = Request.Cookies["DGBAS"];
        if (cookieuser == null)
        {
            return null;
        }
        else
        {
            return cookieuser.Value.ToString();
        }

    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        //Create a new cookie, passing the name into the constructor
        HttpCookie cookie = new HttpCookie("DGBAS");
        //Set the cookies value
        cookie.Value = null;
        //Set the cookie to expire in 1 minute
        DateTime dtNow = DateTime.Now;
        TimeSpan tsMinute = new TimeSpan(-2, 0, 0, 0);
        cookie.Expires = dtNow + tsMinute;
        //Add the cookie
        Response.Cookies.Add(cookie);

        Response.Redirect("~/UserLogin.aspx");

    }
}
