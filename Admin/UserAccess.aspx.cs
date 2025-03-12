using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserAccess : System.Web.UI.Page
{

    DAL dl = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            UserDetails();
        }
    }
    private void UserDetails()
    {
        ddlUser.DataSource = dl.getPanelUsers(null, true);
        ddlUser.DataTextField = "FullName";
        ddlUser.DataValueField = "UserId";
        ddlUser.DataBind();
        ddlUser.Items.Insert(0, new ListItem("Choose One", "-1"));
    }
    private void bindGrid()
    {
        if (ddlUser.SelectedIndex != 0)
        {
            rptMainMenu.DataSource = dl.getPanelUserMenuMainPermission(ddlUser.SelectedValue);
            rptMainMenu.DataBind();
            lnkCheckAll.Visible = true;
            lnkUnCheckAll.Visible = true;
        }
        else
        {
            rptMainMenu.DataSource = null;
            rptMainMenu.DataBind();
            lnkCheckAll.Visible = false;
            lnkUnCheckAll.Visible = false;
        }
    }


    protected void ddlUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindGrid();
    }


    protected void rptMainMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string MainMenuId = (e.Item.FindControl("hfMainMenuId") as HiddenField).Value;
            Repeater rptSubMenu = e.Item.FindControl("rptSubMenu") as Repeater;
            rptSubMenu.DataSource = dl.getPanelUserMenuSubPermission(ddlUser.SelectedValue, MainMenuId, null);
            rptSubMenu.DataBind();
        }
    }

    protected void chkCanAccessMainMenu_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkCanAccessMainMenu = (CheckBox)sender;
        dl.AddPanelMenuMainPermission(chkCanAccessMainMenu.ToolTip, ddlUser.SelectedValue, chkCanAccessMainMenu.Checked);
    }

    protected void chkCanAccessSubMenu_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkCanAccess = (CheckBox)sender;
        dl.AddPanelMenuSubAccessPermission(chkCanAccess.ToolTip, ddlUser.SelectedValue, chkCanAccess.Checked);
    }

    protected void canAdd_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkCanAdd = (CheckBox)sender;
        dl.AddPanelMenuSubAddPermission(chkCanAdd.ToolTip, ddlUser.SelectedValue, chkCanAdd.Checked);
    }

    protected void canUpdate_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkCanUpdate = (CheckBox)sender;
        dl.AddPanelMenuSubUpdatePermission(chkCanUpdate.ToolTip, ddlUser.SelectedValue, chkCanUpdate.Checked);
    }

    protected void canDelete_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkCanDelete = (CheckBox)sender;
        dl.AddPanelMenuSubDeletePermission(chkCanDelete.ToolTip, ddlUser.SelectedValue, chkCanDelete.Checked);
    }


    private void updatePermission(bool Allow)
    {
        foreach (RepeaterItem item in rptMainMenu.Items)
        {
            CheckBox chkCanAccessMainMenu = (CheckBox)item.FindControl("chkCanAccessMainMenu");
            chkCanAccessMainMenu.Checked = Allow;
            dl.AddPanelMenuMainPermission(chkCanAccessMainMenu.ToolTip, ddlUser.SelectedValue, chkCanAccessMainMenu.Checked);

            Repeater rptSubMenu = (Repeater)item.FindControl("rptSubMenu");
            foreach (RepeaterItem itemSub in rptSubMenu.Items)
            {
                CheckBox chkCanAccessSubMenu = (CheckBox)itemSub.FindControl("chkCanAccessSubMenu");
                chkCanAccessSubMenu.Checked = Allow;
                dl.AddPanelMenuSubAccessPermission(chkCanAccessSubMenu.ToolTip, ddlUser.SelectedValue, chkCanAccessSubMenu.Checked);

                CheckBox chkCanAccessSubMenu1 = (CheckBox)itemSub.FindControl("chkCanAccessSubMenu1");
                chkCanAccessSubMenu1.Checked = Allow;
                dl.AddPanelChildMenuSubAccessPermission(chkCanAccessSubMenu1.ToolTip, ddlUser.SelectedValue, chkCanAccessSubMenu1.Checked);

                CheckBox canAdd = (CheckBox)itemSub.FindControl("canAdd");
                canAdd.Checked = Allow;
                dl.AddPanelMenuSubAddPermission(canAdd.ToolTip, ddlUser.SelectedValue, canAdd.Checked);

                CheckBox canAdd1 = (CheckBox)itemSub.FindControl("canAdd1");
                canAdd1.Checked = Allow;
                dl.AddPanelChildMenuSubAddPermission(canAdd1.ToolTip, ddlUser.SelectedValue, canAdd1.Checked);

                CheckBox canUpdate = (CheckBox)itemSub.FindControl("canUpdate");
                canUpdate.Checked = Allow;
                dl.AddPanelMenuSubUpdatePermission(canUpdate.ToolTip, ddlUser.SelectedValue, canUpdate.Checked);

                CheckBox canUpdate1 = (CheckBox)itemSub.FindControl("canUpdate1");
                canUpdate1.Checked = Allow;
                dl.AddPanelChildMenuSubUpdatePermission(canUpdate1.ToolTip, ddlUser.SelectedValue, canUpdate1.Checked);

                CheckBox canDelete = (CheckBox)itemSub.FindControl("canDelete");
                canDelete.Checked = Allow;
                dl.AddPanelMenuSubDeletePermission(canDelete.ToolTip, ddlUser.SelectedValue, canDelete.Checked);

                CheckBox canDelete1 = (CheckBox)itemSub.FindControl("canDelete1");
                canDelete1.Checked = Allow;
                dl.AddPanelChildMenuSubDeletePermission(canDelete1.ToolTip, ddlUser.SelectedValue, canDelete1.Checked);
            }
        }
    }

    protected void lnkCheckAll_Click(object sender, EventArgs e)
    {
        updatePermission(true);
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'All Permission Assign Success.', type: 'success',});", true);
    }

    protected void lnkUnCheckAll_Click(object sender, EventArgs e)
    {
        updatePermission(false);
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$.notice({icon: 'info', text: 'All Permissions removed.', type: 'warning',});", true);
    }


    protected void rptSubMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string SubMenuId = (e.Item.FindControl("hfSubMenuId") as HiddenField).Value;
            Repeater rptChildSubMenu = e.Item.FindControl("rptChildSubMenu") as Repeater;
            rptChildSubMenu.DataSource = dl.getPanelChildUserMenuSubPermission(ddlUser.SelectedValue, SubMenuId, null);
            rptChildSubMenu.DataBind();
        }
    }

    protected void chkCanAccessSubMenu1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkCanAccess = (CheckBox)sender;
        dl.AddPanelChildMenuSubAccessPermission(chkCanAccess.ToolTip, ddlUser.SelectedValue, chkCanAccess.Checked);
    }

    protected void canAdd1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkCanAdd = (CheckBox)sender;
        dl.AddPanelChildMenuSubAddPermission(chkCanAdd.ToolTip, ddlUser.SelectedValue, chkCanAdd.Checked);
    }

    protected void canUpdate1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkCanUpdate = (CheckBox)sender;
        dl.AddPanelChildMenuSubUpdatePermission(chkCanUpdate.ToolTip, ddlUser.SelectedValue, chkCanUpdate.Checked);
    }

    protected void canDelete1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkCanDelete = (CheckBox)sender;
        dl.AddPanelChildMenuSubDeletePermission(chkCanDelete.ToolTip, ddlUser.SelectedValue, chkCanDelete.Checked);
    }
}