using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for DAL
/// </summary>
public class DAL
{
    public DAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }




    #region CheckLogin


    //Panel Users

    public DataTable getPanelUsers(string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelUsers"),
               new SqlParameter("@UserId", UserId),

               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);
    }
    public DataTable getPanelUsersAssignRM(string UserId,bool?RM, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelUsers"),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@RM",RM),
               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);
    }

    public DataTable getPanelUsersRM(string UserId,bool?RM, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelUsersRM"),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@RM",RM),
               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);
    }

    public DataTable getPanelUsersRMs(string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelUsersRM"),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);
    }

    public DataTable getPanelUsersWithoutRM(string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelUsersWithoutRM"),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);
    }
    public DataTable getPanelUserPassword(string Username)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelUserPassword"),
               new SqlParameter("@Username", Username),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);
    }


    public DataTable CheckPanelLogin(string Email, string Password)
    {

        SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@action", "CheckPanelLogin"),
                new SqlParameter("@UserName",Email),

                new SqlParameter("@Password",Password)

            };

        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);
    }


    public DataTable CheckPanelUserPassword(string UserId, string Password)
    {
        SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("@action", "CheckPanelUserPassword"),
                new SqlParameter("@userId",UserId),
                new SqlParameter("@Password",Password)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);

    }


    public bool AddPanelUser(string UserId, string FullName, string Email, string Mobile, string UserName, string Password,string RM,string Image, string Role,string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action","AddPanelUser"),
             new SqlParameter("@UserId",UserId),
             new SqlParameter("@FullName",FullName),
              new SqlParameter("@Email",Email),

            new SqlParameter("@Mobile",Mobile),
             new SqlParameter("@UserName",UserName),
            new SqlParameter("@Password",Password),
            new SqlParameter("@RM",RM),
            new SqlParameter("@Image",Image),
            new SqlParameter("@Role",Role),
            new SqlParameter("@EntryUserId",EntryUserId),
            new SqlParameter("@returnId",0)

        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);

    }
    public bool updatePanelUserPassword(string Password, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action","updatePanelUserPassword"),
             new SqlParameter("@Password",Password),
            new SqlParameter("@UserId",UserId)


        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);

    }
    public bool updatePanelUserActiveStatus(bool IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "updatePanelUserActiveStatus"),
                new SqlParameter("@IsActive", IsActive),

                new SqlParameter("@UserId", UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);
    }

    public bool deletePanelUser(string UserId,string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "deletePanelUser"),

                new SqlParameter("@UserId", UserId),
                new SqlParameter("@EntryUserId",EntryUserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PanelUsers]", CommandType.StoredProcedure, parameter);
    }
    #endregion

    // Manage Panel Menu Main Data Proceedure Here
    #region Manage Panel Menu Main Data Proceedure

    public DataTable getPanelMenuMain(bool? IsActive, string MainMenuId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelMenuMain"),
               new SqlParameter("@IsActive", IsActive),
               new SqlParameter("@MainMenuId", MainMenuId)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuMain]", CommandType.StoredProcedure, parameter);
    }

    public bool AddPanelMenuMain(string MainMenuId, string MainMenuHead, string MainMenuIconHtml, bool IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelMenuMain"),
               new SqlParameter("@MainMenuId", MainMenuId),
               new SqlParameter("@MainMenuHead", MainMenuHead),
               new SqlParameter("@MainMenuIconHtml", MainMenuIconHtml),
               new SqlParameter("@IsActive", IsActive),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuMain]", CommandType.StoredProcedure, parameter);
    }


    public bool updatePanelMenuMainActiveStatus(bool IsActive, string MainMenuId)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "updatePanelMenuMainActiveStatus"),
               new SqlParameter("@IsActive", IsActive),
               new SqlParameter("@MainMenuId", MainMenuId),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuMain]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    // Manage Panel Menu Sub Data Proceedure Here
    #region Manage Panel Menu Sub Data Proceedure


    public DataTable getPanelMenuSubByurl(string SubMenuUrl)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelMenuSubByurl"),
               new SqlParameter("@SubMenuUrl", SubMenuUrl),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuSub]", CommandType.StoredProcedure, parameter);
    }
    public DataTable getPanelMenuSub(bool? IsActive, string MainMenuId, string SubMenuId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelMenuSub"),
               new SqlParameter("@IsActive", IsActive),
               new SqlParameter("@MainMenuId", MainMenuId),
               new SqlParameter("@SubMenuId", SubMenuId)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuSub]", CommandType.StoredProcedure, parameter);
    }

    public bool AddPanelMenuSub(string MainMenuId, string SubMenuId, string SubMenuTitle, string SubMenuUrl, bool IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelMenuSub"),
               new SqlParameter("@MainMenuId", MainMenuId),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@SubMenuTitle", SubMenuTitle),
               new SqlParameter("@SubMenuUrl", SubMenuUrl),
               new SqlParameter("@IsActive", IsActive),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuSub]", CommandType.StoredProcedure, parameter);
    }


    public bool updatePanelMenuSubActiveStatus(bool IsActive, string SubMenuId)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "updatePanelMenuSubActiveStatus"),
               new SqlParameter("@IsActive", IsActive),
               new SqlParameter("@SubMenuId", SubMenuId),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuSub]", CommandType.StoredProcedure, parameter);
    }

    #endregion


    // Manage Panel Menu Main Permission Data Proceedure Here
    #region Manage Panel Menu Main Permission Data Proceedure

    public DataTable getPanelMenuMainPermission(string UserId, bool? CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelMenuMainPermission"),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuMainPermission]", CommandType.StoredProcedure, parameter);
    }

    public DataTable getPanelMemberMenuMain(string UserId, bool? CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelMemberMenuMain"),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuMainPermission]", CommandType.StoredProcedure, parameter);
    }

    public DataTable CheckPanelMenuMainPermission(string UserId, bool? CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "CheckPanelMenuMainPermission"),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuMainPermission]", CommandType.StoredProcedure, parameter);
    }

    public DataTable getPanelUserMenuMainPermission(string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelUserMenuMainPermission"),
               new SqlParameter("@UserId", UserId),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuMainPermission]", CommandType.StoredProcedure, parameter);
    }

    public bool AddPanelMenuMainPermission(string MainMenuId, string UserId, bool CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelMenuMainPermission"),
               new SqlParameter("@MainMenuId", MainMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuMainPermission]", CommandType.StoredProcedure, parameter);
    }


    public bool updatePanelMenuMainPermission(bool CanAccess, string MainMenuPermissionId)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "updatePanelMenuMainPermission"),
               new SqlParameter("@CanAccess", CanAccess),
               new SqlParameter("@MainMenuPermissionId", MainMenuPermissionId),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuMainPermission]", CommandType.StoredProcedure, parameter);
    }

    #endregion


    // Manage Panel Menu Sub Permission Data Proceedure Here
    #region Manage Panel Menu Sub Permission Data Proceedure

    public DataTable getPanelMenuSubPermission(string MainMenuId, string UserId, bool? CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelMenuSubPermission"),
               new SqlParameter("@MainMenuId", MainMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }

    public DataTable getPanelMemberMenuSub(string MainMenuId, string UserId, bool? CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelMemberMenuSub"),
               new SqlParameter("@MainMenuId", MainMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }

    public DataTable getPanelUserMenuSubPermission(string UserId, string MainMenuId, string SubMenuId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelUserMenuSubPermission"),
               new SqlParameter("@MainMenuId", MainMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@SubMenuId", SubMenuId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }


    public bool AddPanelMenuSubAccessPermission(string SubMenuId, string UserId, bool CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelMenuSubAccessPermission"),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }


    public bool AddPanelMenuSubAddPermission(string SubMenuId, string UserId, bool CanAdd)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelMenuSubAddPermission"),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAdd", CanAdd),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }


    public bool AddPanelMenuSubUpdatePermission(string SubMenuId, string UserId, bool CanUpdate)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelMenuSubUpdatePermission"),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanUpdate", CanUpdate),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }

    public bool AddPanelMenuSubDeletePermission(string SubMenuId, string UserId, bool CanDelete)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelMenuSubDeletePermission"),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanDelete", CanDelete),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }


    #endregion

    // Manage Panel Child Menu Sub Data Proceedure Here
    #region Manage Panel Menu Child Data Proceedure


    public DataTable getPanelChildMenuSubByurl(string ChildSubMenuUrl)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelChildMenuSubByurl"),
               new SqlParameter("@ChildSubMenuUrl", ChildSubMenuUrl),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelChildMenuSub]", CommandType.StoredProcedure, parameter);
    }
    public DataTable getPanelChildMenuSub(bool? IsActive, string MainMenuId, string SubMenuId,string ChildSubMenuId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelChildMenuSub"),
               new SqlParameter("@IsActive", IsActive), 
               new SqlParameter("@MainMenuId", MainMenuId),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@ChildSubMenuId",ChildSubMenuId)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelChildMenuSub]", CommandType.StoredProcedure, parameter);
    }

    public bool AddPanelChildMenuSub(string MainMenuId, string SubMenuId,string ChildSubMenuId, string ChildSubMenuTitle, string ChildSubMenuUrl, bool IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelChildMenuSub"),
               new SqlParameter("@MainMenuId", MainMenuId),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@ChildSubMenuId",ChildSubMenuId),
               new SqlParameter("@ChildSubMenuTitle", ChildSubMenuTitle),
               new SqlParameter("@ChildSubMenuUrl", ChildSubMenuUrl),
               new SqlParameter("@IsActive", IsActive),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelChildMenuSub]", CommandType.StoredProcedure, parameter);
    }


    public bool updatePanelChildMenuSubActiveStatus(bool IsActive, string ChildSubMenuId)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "updatePanelChildMenuSubActiveStatus"),
               new SqlParameter("@IsActive", IsActive),
               new SqlParameter("@ChildSubMenuId", ChildSubMenuId),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelChildMenuSub]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    // Manage Panel Menu Child Permission Data Proceedure Here
    #region Manage Panel Menu Child Permission Data Proceedure

    public DataTable getPanelChildMenuSubPermission(string SubMenuId, string UserId, bool? CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelChildMenuSubPermission"),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelChildMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }
    public DataTable CheckSubMenuUrl(string SubMenuId)
    {

        SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@action", "CheckSubMenuUrl"),
                new SqlParameter("@SubMenuId",SubMenuId),

            };

        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelChildMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }
    public DataTable getPanelChildMemberMenuSub(string SubMenuId, string UserId, bool? CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelChildMemberMenuSub"),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelChildMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }

    public DataTable getPanelChildUserMenuSubPermission(string UserId, string SubMenuId,string ChildSubMenuId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getPanelChildUserMenuSubPermission"),
              
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@SubMenuId", SubMenuId),
               new SqlParameter("@ChildSubMenuId",ChildSubMenuId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[spPanelChildMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }


    public bool AddPanelChildMenuSubAccessPermission(string ChildSubMenuId, string UserId, bool CanAccess)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelChildMenuSubAccessPermission"),
               new SqlParameter("@ChildSubMenuId", ChildSubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAccess", CanAccess),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelChildMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }


    public bool AddPanelChildMenuSubAddPermission(string ChildSubMenuId, string UserId, bool CanAdd)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelChildMenuSubAddPermission"),
               new SqlParameter("@ChildSubMenuId", ChildSubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanAdd", CanAdd),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelChildMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }


    public bool AddPanelChildMenuSubUpdatePermission(string ChildSubMenuId, string UserId, bool CanUpdate)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelChildMenuSubUpdatePermission"),
               new SqlParameter("@ChildSubMenuId", ChildSubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanUpdate", CanUpdate),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelChildMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }

    public bool AddPanelChildMenuSubDeletePermission(string ChildSubMenuId, string UserId, bool CanDelete)
    {
        SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@action", "AddPanelChildMenuSubDeletePermission"),
               new SqlParameter("@ChildSubMenuId", ChildSubMenuId),
               new SqlParameter("@UserId", UserId),
               new SqlParameter("@CanDelete", CanDelete),
           };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[spPanelChildMenuSubPermission]", CommandType.StoredProcedure, parameter);
    }


    #endregion


    #region usp_PaymentType

    public DataTable get_PaymentType(string PaymentTypeId,  bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PaymentType"),
                new SqlParameter("@PaymentTypeId", PaymentTypeId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PaymentType]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_PaymentTypeName(string PaymentTypeHead, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PaymentTypeName"),
                new SqlParameter("@PaymentTypeHead", PaymentTypeHead),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PaymentType]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_PaymentTypeActive(string PaymentTypeId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PaymentTypeActive"),
                new SqlParameter("@PaymentTypeId", PaymentTypeId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PaymentType]", CommandType.StoredProcedure, parameter);
    }


    public bool add_PaymentType(string PaymentTypeId, string PaymentTypeHead, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_PaymentType"),
                new SqlParameter("@PaymentTypeId", PaymentTypeId),
                new SqlParameter("@PaymentTypeHead", PaymentTypeHead),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PaymentType]", CommandType.StoredProcedure, parameter);
    }

    public bool update_PaymentType(string PaymentTypeId, string PaymentTypeHead, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_PaymentType"),
                new SqlParameter("@PaymentTypeId", PaymentTypeId),
                new SqlParameter("@PaymentTypeHead", PaymentTypeHead),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PaymentType]", CommandType.StoredProcedure, parameter);
    }

    public bool update_PaymentType_Active_Status(string PaymentTypeId,bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_PaymentType_Active_Status"),

                new SqlParameter("@PaymentTypeId", PaymentTypeId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PaymentType]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_PaymentType(string PaymentTypeId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_PaymentType"),

                new SqlParameter("@PaymentTypeId", PaymentTypeId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PaymentType]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_Tags

    public DataTable get_Tags(string TagsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_Tags"),
                new SqlParameter("@TagsId", TagsId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Tags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_TagsActive(string TagsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_TagsActive"),
                new SqlParameter("@TagsId", TagsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Tags]", CommandType.StoredProcedure, parameter);
    }


    public bool add_Tags(string TagsId, string TagsHead, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Tags"),
                new SqlParameter("@TagsId", TagsId),
                new SqlParameter("@TagsHead", TagsHead),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Tags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Tags(string TagsId, string TagsHead, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_Tags"),
                new SqlParameter("@TagsId", TagsId),
                new SqlParameter("@TagsHead", TagsHead),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Tags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Tags_Active_Status(string TagsId,bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_Tags_Active_Status"),

                new SqlParameter("@TagsId", TagsId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Tags]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_Tags(string TagsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_Tags"),

                new SqlParameter("@TagsId", TagsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Tags]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_Category

    public DataTable get_Category(string CategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_Category"),
                new SqlParameter("@CategoryId", CategoryId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Category]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CategoryName(string CategoryHead, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CategoryName"),
                new SqlParameter("@CategoryHead", CategoryHead),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Category]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CategoryFilter(string CategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_Category"),
                new SqlParameter("@CategoryId", CategoryId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Category]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CategoryActive(string CategoryId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CategoryActive"),
                new SqlParameter("@CategoryId", CategoryId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Category]", CommandType.StoredProcedure, parameter);
    }


    public int add_Category(string CategoryId, string CategoryHead,string CategoryImage, string CategoryIcon,string CategoryFontIcon,string CategorySequence, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Category"),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CategoryHead", CategoryHead),
                new SqlParameter("@CategoryImage",CategoryImage),
                new SqlParameter("@CategoryIcon",CategoryIcon),
                new SqlParameter("@CategoryFontIcon",CategoryFontIcon),
                new SqlParameter("@CategorySequence",CategorySequence),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_Category]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_Category(string CategoryId, string CategoryHead, string CategoryImage, string CategoryIcon,string CategoryFontIcon,string CategorySequence,  string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_Category"),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CategoryHead", CategoryHead),
                new SqlParameter("@CategoryImage",CategoryImage),
                new SqlParameter("@CategoryIcon",CategoryIcon),
                new SqlParameter("@CategoryFontIcon",CategoryFontIcon),
                new SqlParameter("@CategorySequence",CategorySequence),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Category]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Category_Active_Status(string CategoryId,bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_Category_Active_Status"),

                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Category]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_Category(string CategoryId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_Category"),

                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Category]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CategoryTags

    public DataTable get_CategoryTags(string CategoryTagsId,string CategoryId,string TagsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CategoryTags"),
                new SqlParameter("@CategoryTagsId", CategoryTagsId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CategoryTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CategoryTagsActive(string CategoryTagsId, string CategoryId, string TagsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CategoryTagsActive"),
                new SqlParameter("@CategoryTagsId", CategoryTagsId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@TagsId",TagsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CategoryTags]", CommandType.StoredProcedure, parameter);
    }


    public bool add_CategoryTags(string CategoryTagsId,string CategoryId, string TagsId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CategoryTags"),
                new SqlParameter("@CategoryTagsId", CategoryTagsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CategoryTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CategoryTags(string CategoryTagsId, string CategoryId, string TagsId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CategoryTags"),
                new SqlParameter("@CategoryTagsId", CategoryTagsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CategoryTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CategoryTags_Active_Status(string CategoryTagsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CategoryTags_Active_Status"),

                new SqlParameter("@CategoryTagsId", CategoryTagsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CategoryTags]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CategoryTags(string CategoryTagsId,string CategoryId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CategoryTags"),

                new SqlParameter("@CategoryTagsId", CategoryTagsId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CategoryTags]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_Product

    public DataTable get_Product(string ProductId,string CategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_Product"),
                new SqlParameter("@ProductId",ProductId),
                new SqlParameter("@CategoryId", CategoryId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Product]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductActive(string ProductId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductActive"),
                new SqlParameter("@ProductId", ProductId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Product]", CommandType.StoredProcedure, parameter);
    }


    public int add_Product(string ProductId, string CategoryId, string ProductName, string ProductImage, string Yield,string PaymentTypeId, string MaturityDate,string MinInvestment,string CouponRate,string Description, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Product"),
               new SqlParameter("@ProductId",ProductId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@Yield",Yield),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@MinInvestment",MinInvestment),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@Description",Description),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_Product]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_Product(string ProductId, string CategoryId, string ProductName, string ProductImage, string Yield, string PaymentTypeId, string MaturityDate, string MinInvestment, string CouponRate,string Description, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_Product"),
               new SqlParameter("@ProductId",ProductId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@Yield",Yield),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@MinInvestment",MinInvestment),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@Description",Description),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Product]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Product_Active_Status(string ProductId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_Product_Active_Status"),

                new SqlParameter("@ProductId", ProductId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Product]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_Product(string ProductId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_Product"),

                new SqlParameter("@ProductId", ProductId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Product]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_ProductTags

    public DataTable get_ProductTags(string ProductTagsId, string ProductId, string TagsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductTags"),
                new SqlParameter("@ProductTagsId", ProductTagsId),
                new SqlParameter("@ProductId",ProductId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ProductTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductTagsActive(string ProductTagsId, string ProductId, string TagsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductTagsActive"),
                new SqlParameter("@ProductTagsId", ProductTagsId),
                new SqlParameter("@ProductId",ProductId),
                new SqlParameter("@TagsId",TagsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ProductTags]", CommandType.StoredProcedure, parameter);
    }


    public bool add_ProductTags(string ProductTagsId, string ProductId, string TagsId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_ProductTags"),
                new SqlParameter("@ProductTagsId", ProductTagsId),
                new SqlParameter("@ProductId", ProductId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ProductTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_ProductTags(string ProductTagsId, string ProductId, string TagsId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_ProductTags"),
                new SqlParameter("@ProductTagsId", ProductTagsId),
                new SqlParameter("@ProductId", ProductId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ProductTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_ProductTags_Active_Status(string ProductTagsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_ProductTags_Active_Status"),

                new SqlParameter("@ProductTagsId", ProductTagsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ProductTags]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_ProductTags(string ProductTagsId, string ProductId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_ProductTags"),

                new SqlParameter("@ProductTagsId", ProductTagsId),
                new SqlParameter("@ProductId",ProductId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ProductTags]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region Customer


    //Panel Users

    public DataTable getCustomer(string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getCustomer"),
               new SqlParameter("@CustomerId", CustomerId),

               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }
    public DataTable getCustomerRM(string CustomerId,string RMAssignId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getCustomerRM"),
               new SqlParameter("@CustomerId", CustomerId),
               new SqlParameter("@RMAssignId",RMAssignId),
               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }
    public DataTable CheckReferalCodeExists(string CustomerCode)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "CheckReferalCodeExists"),
                new SqlParameter("@CustomerCode", CustomerCode),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }

    public DataTable CheckMobileNumberExist(string CMobile)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "CheckMobileNumberExist"),
                new SqlParameter("@CMobile", CMobile),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_RMList()
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_RMList"),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_PanelRMList()
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PanelRMList"),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }

    public DataTable getCustomerKYC(string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getCustomerKYC"),
               new SqlParameter("@CustomerId", CustomerId),

               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }
    public DataTable getCustomerPassword(string CEmail)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getCustomerPassword"),
               new SqlParameter("@CEmail", CEmail),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }


    public DataTable CheckCustomerLogin(string CEmail)
    {

        SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@action", "CheckCustomerLogin"),
                new SqlParameter("@CEmail",CEmail),

            };

        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }

    public DataTable CheckCustomerPanelLogin(string CEmail, string CPassword)
    {

        SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@action", "CheckCustomerPanelLogin"),
                new SqlParameter("@CEmail",CEmail),

                new SqlParameter("@CPassword",CPassword)

            };

        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }
    public DataTable CheckCustomerPassword(string CEmail, string CPassword)
    {
        SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("@action", "CheckCustomerPassword"),
                new SqlParameter("@CEmail",CEmail),
                new SqlParameter("@CPassword",CPassword)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);

    }

    public DataTable CheckCustomerPasswords(string CPassword)
    {
        SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("@action", "CheckCustomerPasswords"),
                new SqlParameter("@CPassword",CPassword)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);

    }

    public DataTable CheckCustomerPasswordReset(string CustomerId ,string CPassword)
    {
        SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("@action", "CheckCustomerPasswords"),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@CPassword",CPassword)

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);

    }


    public int AddCustomerEmail(string CustomerId, string CEmail)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@action","AddCustomer"),
             new SqlParameter("@CustomerId",CustomerId),
             new SqlParameter("@CEmail",CEmail),
            new SqlParameter("@returnId",returnId)

        };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_Customer]", CommandType.StoredProcedure, param, param.Length - 1);

    }

    public int AddCustomerMobile(string CustomerId, string CMobile)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@action","AddCustomer"),
             new SqlParameter("@CustomerId",CustomerId),
             new SqlParameter("@CMobile",CMobile),
            new SqlParameter("@returnId",returnId)

        };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_Customer]", CommandType.StoredProcedure, param, param.Length - 1);

    }
    //public bool AddCustomer(string CustomerId, string CFullName, string CEmail, string CMobile, string CPassword)
    //{
    //    SqlParameter[] parameter = new SqlParameter[]
    //    {
    //        new SqlParameter("@action","AddCustomer"),
    //         new SqlParameter("@CustomerId",CustomerId),
    //         new SqlParameter("@CFullName",CFullName),
    //          new SqlParameter("@CEmail",CEmail),

    //        new SqlParameter("@CMobile",CMobile),
    //         new SqlParameter("@CPassword",CPassword),
    //        new SqlParameter("@returnId",0)

    //    };
    //    return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);

    //}

    public int AddCustomer(string CustomerId,string CustomerCode, string CFullName, string CEmail, string CMobile, string CPassword,string RMAssignId,string DateOfBirth)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@action","AddCustomer"),
             new SqlParameter("@CustomerId",CustomerId),
             new SqlParameter("@CustomerCode",CustomerCode),
             new SqlParameter("@CFullName",CFullName),
              new SqlParameter("@CEmail",CEmail),

            new SqlParameter("@CMobile",CMobile),
             new SqlParameter("@CPassword",CPassword),
             new SqlParameter("@RMAssignId",RMAssignId),
             new SqlParameter("@DateOfBirth",DateOfBirth),
            new SqlParameter("@returnId",returnId)

        };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_Customer]", CommandType.StoredProcedure, param, param.Length - 1);

    }
    public bool updateCustomerPassword(string CPassword, string CustomerId)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action","updateCustomerPassword"),
             new SqlParameter("@CPassword",CPassword),
            new SqlParameter("@CustomerId",CustomerId)


        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);

    }
    public bool UpdateRMAssignId(string CustomerId, string RMAssignId)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action","UpdateRMAssignId"),
             new SqlParameter("@CustomerId",CustomerId),
            new SqlParameter("@RMAssignId",RMAssignId)


        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);

    }

    public bool UpdateCustomerDetails(string CustomerId,string CFullName, string CMobile,string CEmail)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action","UpdateCustomerDetails"),             
            new SqlParameter("@CustomerId",CustomerId),
            new SqlParameter("@CFullName",CFullName),
            new SqlParameter("@CMobile",CMobile),
            new SqlParameter("@CEmail",CEmail),

        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);

    }
    public bool updateCustomerActiveStatus(bool IsActive, string CustomerId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "updateCustomerActiveStatus"),
                new SqlParameter("@IsActive", IsActive),

                new SqlParameter("@CustomerId", CustomerId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }

    public bool deleteCustomer(string CustomerId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "deleteCustomer"),

                new SqlParameter("@CustomerId", CustomerId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Customer]", CommandType.StoredProcedure, parameter);
    }
    #endregion

    #region usp_KYCDetails

    public DataTable get_KYCDetails(string KYCId, string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action", "get_KYCDetails"),
            new SqlParameter("@KYCId", KYCId),
            new SqlParameter("@CustomerId",CustomerId),
            new SqlParameter("@IsActive",IsActive)

        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_KYCDetails]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_KYCDetailsStatus(string KYCId, string CustomerId,string Status, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action", "get_KYCDetailsStatus"),
            new SqlParameter("@KYCId", KYCId),
            new SqlParameter("@CustomerId",CustomerId),
            new SqlParameter("@Status",Status),
            new SqlParameter("@IsActive",IsActive)

        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_KYCDetails]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_KYCDetailsStatusRM(string KYCId, string CustomerId, string Status,string RMAssignId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action", "get_KYCDetailsStatus"),
            new SqlParameter("@KYCId", KYCId),
            new SqlParameter("@CustomerId",CustomerId),
            new SqlParameter("@Status",Status),
            new SqlParameter("@RMAssignId",RMAssignId),
            new SqlParameter("@IsActive",IsActive)

        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_KYCDetails]", CommandType.StoredProcedure, parameter);
    }



    public bool add_KYCDetails(string KYCId, string CustomerId,  string PANNumber,string PANDescription, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_KYCDetails"),
                new SqlParameter("@KYCId", KYCId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@PANNumber",PANNumber),
                new SqlParameter("@PANDescription",PANDescription),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_KYCDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_KYCDetails(string KYCId, string CustomerId,string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_KYCDetails"),
                new SqlParameter("@KYCId", KYCId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_KYCDetails]", CommandType.StoredProcedure, parameter);
    }
    public bool update_KYCDetailsRe(string KYCId, string CustomerId,string PANNumber, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_KYCDetailsRe"),
                new SqlParameter("@KYCId", KYCId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@PANNumber",PANNumber),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_KYCDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_KYCDetailsReject(string KYCId, string CustomerId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_KYCDetailsReject"),
                new SqlParameter("@KYCId", KYCId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_KYCDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_KYCDetails_Active_Status(string KYCId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_KYCDetails_Active_Status"),

                new SqlParameter("@KYCId", KYCId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_KYCDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_KYCDetails(string KYCId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_KYCDetails"),

                new SqlParameter("@KYCId", KYCId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_KYCDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_DemateAccountDetails

    public DataTable get_DemateAccountDetails(string DemateId, string CustomerId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_DemateAccountDetails"),
                new SqlParameter("@DemateId", DemateId),
                new SqlParameter("@CustomerId",CustomerId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_DemateAccountDetails]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_DemateAccountDetailsStatus(string DemateId, string CustomerId,string DemateStatus)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_DemateAccountDetailsStatus"),
                new SqlParameter("@DemateId", DemateId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@DemateStatus",DemateStatus)

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_DemateAccountDetails]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_DemateAccountDetailsStatusRM(string DemateId, string CustomerId,string RMAssignId, string DemateStatus)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_DemateAccountDetailsStatus"),
                new SqlParameter("@DemateId", DemateId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@RMAssignId",RMAssignId),
                new SqlParameter("@DemateStatus",DemateStatus)

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_DemateAccountDetails]", CommandType.StoredProcedure, parameter);
    }




    public bool add_DemateAccountDetails(string DemateId, string CustomerId, string DemateAccountNumber,string DemateDescription,string ClientId,  string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_DemateAccountDetails"),
                new SqlParameter("@DemateId", DemateId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@DemateAccountNumber",DemateAccountNumber),
                new SqlParameter("@DemateDescription",DemateDescription),
                new SqlParameter("@ClientId",ClientId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_DemateAccountDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_DemateAccountDetails(string DemateId, string CustomerId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_DemateAccountDetails"),
                new SqlParameter("@DemateId", DemateId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_DemateAccountDetails]", CommandType.StoredProcedure, parameter);
    }
    public bool update_DemateAccountDetailsRe(string DemateId, string CustomerId,string DemateAccountNumber,string ClientId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_DemateAccountDetailsRe"),
                new SqlParameter("@DemateId", DemateId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@DemateAccountNumber",DemateAccountNumber),
                new SqlParameter("@ClientId",ClientId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_DemateAccountDetails]", CommandType.StoredProcedure, parameter);
    }



    public bool update_DemateAccountDetailsReject(string DemateId, string CustomerId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_DemateAccountDetailsReject"),
                new SqlParameter("@DemateId", DemateId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_DemateAccountDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_DemateAccountDetails_Active_Status(string DemateId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_DemateAccountDetails_Active_Status"),

                new SqlParameter("@DemateId", DemateId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_DemateAccountDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_DemateAccountDetails(string DemateId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_DemateAccountDetails"),

                new SqlParameter("@DemateId", DemateId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_DemateAccountDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_BankDetails

    public DataTable get_BankDetails(string BankDetailsId, string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_BankDetails"),
                new SqlParameter("@BankDetailsId", BankDetailsId),
                new SqlParameter("@CustomerId",CustomerId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BankDetails]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_BankDetailsStatus(string BankDetailsId, string CustomerId, string BankStatus, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_BankDetailsStatus"),
                new SqlParameter("@BankDetailsId", BankDetailsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@BankStatus",BankStatus),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BankDetails]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_BankDetailsStatusRM(string BankDetailsId, string CustomerId,string BankStatus,string RMAssignId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_BankDetailsStatus"),
                new SqlParameter("@BankDetailsId", BankDetailsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@BankStatus",BankStatus),
                new SqlParameter("@RMAssignId",RMAssignId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BankDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool add_BankDetails(string BankDetailsId, string CustomerId, string BankAccountNumber, string BankHolderName,string BankName, string IFSCCode, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_BankDetails"),
                new SqlParameter("@BankDetailsId", BankDetailsId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@BankAccountNumber",BankAccountNumber),
                new SqlParameter("@BankHolderName",BankHolderName),
                new SqlParameter("@BankName",BankName),
                new SqlParameter("@IFSCCode",IFSCCode),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BankDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_BankDetails(string BankDetailsId, string CustomerId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_BankDetails"),
                new SqlParameter("@BankDetailsId", BankDetailsId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BankDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_BankDetailsReject(string BankDetailsId, string CustomerId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_BankDetailsReject"),
                new SqlParameter("@BankDetailsId", BankDetailsId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BankDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_BankDetails_Active_Status(string BankDetailsId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_BankDetails_Active_Status"),

                new SqlParameter("@BankDetailsId", BankDetailsId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BankDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_BankDetails(string BankDetailsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_BankDetails"),

                new SqlParameter("@BankDetailsId", BankDetailsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BankDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_AdharDetails

    public DataTable get_AdharDetails(string AdharDetailsId, string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
                new SqlParameter("@action", "get_AdharDetails"),
                new SqlParameter("@AdharDetailsId", AdharDetailsId),
                new SqlParameter("@CustomerId",CustomerId),
                  new SqlParameter("@IsActive",IsActive)

        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_AdharDetails]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_AdharDetailsStatus(string AdharDetailsId, string CustomerId,string AdharStatus, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
                new SqlParameter("@action", "get_AdharDetailsStatus"),
                new SqlParameter("@AdharDetailsId", AdharDetailsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@AdharStatus",AdharStatus),
                  new SqlParameter("@IsActive",IsActive)

        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_AdharDetails]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_AdharDetailsStatusRM(string AdharDetailsId, string CustomerId, string AdharStatus,string RMAssignId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
                new SqlParameter("@action", "get_AdharDetailsStatus"),
                new SqlParameter("@AdharDetailsId", AdharDetailsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@AdharStatus",AdharStatus),
                new SqlParameter("@RMAssignId",RMAssignId),
                  new SqlParameter("@IsActive",IsActive)

        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_AdharDetails]", CommandType.StoredProcedure, parameter);
    }



    public bool add_AdharDetails(string AdharDetailsId, string CustomerId, string AdharNumber,string AdharDescription, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_AdharDetails"),
                new SqlParameter("@AdharDetailsId", AdharDetailsId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@AdharNumber",AdharNumber),
                new SqlParameter("@AdharDescription",AdharDescription),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AdharDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_AdharDetails(string AdharDetailsId, string CustomerId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_AdharDetails"),
                new SqlParameter("@AdharDetailsId", AdharDetailsId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AdharDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_AdharDetailsRe(string AdharDetailsId, string CustomerId,string AdharNumber, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_AdharDetailsRe"),
                new SqlParameter("@AdharDetailsId", AdharDetailsId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@AdharNumber",AdharNumber),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AdharDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_AdharDetailsReject(string AdharDetailsId, string CustomerId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_AdharDetailsReject"),
                new SqlParameter("@AdharDetailsId", AdharDetailsId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AdharDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_AdharDetails_Active_Status(string AdharDetailsId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_AdharDetails_Active_Status"),

                new SqlParameter("@AdharDetailsId", AdharDetailsId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AdharDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_AdharDetails(string AdharDetailsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_AdharDetails"),

                new SqlParameter("@AdharDetailsId", AdharDetailsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AdharDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_RatingAgenciesDetail

    public DataTable get_RatingAgenciesDetail(string RatingAgenciesId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_RatingAgenciesDetail"),
                new SqlParameter("@RatingAgenciesId", RatingAgenciesId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_RatingAgenciesDetail]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_RatingAgenciesDetailName(string RatingAgencies, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_RatingAgenciesDetailName"),
                new SqlParameter("@RatingAgencies", RatingAgencies),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_RatingAgenciesDetail]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_RatingAgenciesDetailActive(string RatingAgenciesId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_RatingAgenciesDetailActive"),
                new SqlParameter("@RatingAgenciesId", RatingAgenciesId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_RatingAgenciesDetail]", CommandType.StoredProcedure, parameter);
    }


    public bool add_RatingAgenciesDetail(string RatingAgenciesId, string RatingAgencies, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_RatingAgenciesDetail"),
                new SqlParameter("@RatingAgenciesId", RatingAgenciesId),
                new SqlParameter("@RatingAgencies", RatingAgencies),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RatingAgenciesDetail]", CommandType.StoredProcedure, parameter);
    }

    public bool update_RatingAgenciesDetail(string RatingAgenciesId, string RatingAgencies, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_RatingAgenciesDetail"),
                new SqlParameter("@RatingAgenciesId", RatingAgenciesId),
                new SqlParameter("@RatingAgencies", RatingAgencies),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RatingAgenciesDetail]", CommandType.StoredProcedure, parameter);
    }

    public bool update_RatingAgenciesDetail_Active_Status(string RatingAgenciesId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_RatingAgenciesDetail_Active_Status"),

                new SqlParameter("@RatingAgenciesId", RatingAgenciesId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RatingAgenciesDetail]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_RatingAgenciesDetail(string RatingAgenciesId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_RatingAgenciesDetail"),

                new SqlParameter("@RatingAgenciesId", RatingAgenciesId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RatingAgenciesDetail]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CreditRating

    public DataTable get_CreditRating(string CreditRatingId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CreditRating"),
                new SqlParameter("@CreditRatingId", CreditRatingId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CreditRating]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_CreditRatingName(string CreditRating, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CreditRatingName"),
                new SqlParameter("@CreditRating", CreditRating),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CreditRating]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CreditRatingActive(string CreditRatingId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CreditRatingActive"),
                new SqlParameter("@CreditRatingId", CreditRatingId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CreditRating]", CommandType.StoredProcedure, parameter);
    }


    public bool add_CreditRating(string CreditRatingId, string CreditRating, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CreditRating"),
                new SqlParameter("@CreditRatingId", CreditRatingId),
                new SqlParameter("@CreditRating", CreditRating),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CreditRating]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CreditRating(string CreditRatingId, string CreditRating, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CreditRating"),
                new SqlParameter("@CreditRatingId", CreditRatingId),
                new SqlParameter("@CreditRating", CreditRating),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CreditRating]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CreditRating_Active_Status(string CreditRatingId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CreditRating_Active_Status"),

                new SqlParameter("@CreditRatingId", CreditRatingId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CreditRating]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CreditRating(string CreditRatingId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CreditRating"),

                new SqlParameter("@CreditRatingId", CreditRatingId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CreditRating]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_Products

    public DataTable get_Products(string ProductsId, string CategoryId,string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_Products"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable Get_SecurityDetails(string MaturityType)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "Get_SecurityDetails"),
                new SqlParameter("@MaturityType",MaturityType),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsDate(string ProductsId, string CategoryId, string UserId,string PageSize,string PageIndex, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsDate"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@PageSize",PageSize),
                new SqlParameter("@PageIndex",PageIndex),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable GetProductDetails(string Security)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "GetProductDetails"),
                new SqlParameter("@Security",Security),


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable getSearchedProducts(string SearchText)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@action", "getSearchedProducts"),
            new SqlParameter("@SearchText", SearchText)
        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, param);
    }

    public DataTable getSearchSecurity(string SearchText)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@action", "getSearchSecurity"),
            new SqlParameter("@SearchText", SearchText)
        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, param);
    }
    public DataTable searchProduct(string searchText)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "searchProduct"),
                new SqlParameter("@searchText", searchText),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable Get_ProductsData(string ProductsId, string CategoryId, string UserId, bool? IsActive,int PageIndex,string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "Get_ProductsData"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive),
                  new SqlParameter("@PageIndex",PageIndex),
                  new SqlParameter("@PageSize",PageSize),


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable Get_ProductsDataSerach(string ISINNumber, bool? IsActive, int PageIndex, string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "Get_ProductsDataSerach"),
                new SqlParameter("@ISINNumber",ISINNumber),
                  new SqlParameter("@IsActive",IsActive),
                  new SqlParameter("@PageIndex",PageIndex),
                  new SqlParameter("@PageSize",PageSize),


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable Get_ProductsDataSerachs(string ISINNumber, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "Get_ProductsDataSerachs"),
                new SqlParameter("@ISINNumber",ISINNumber),
                  new SqlParameter("@IsActive",IsActive),


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }


    public DataTable get_ProductsTops(string ProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsTops"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsBullet(string ProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsBullet"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsBulletFilter(string ProductsId, string CategoryId, string UserId,string Security,string ISINNumber, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsBullet"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@Security",Security),
                new SqlParameter("@ISINNumber",ISINNumber),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsStaggered(string ProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsStaggered"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsStaggeredFilter(string ProductsId, string CategoryId, string UserId,string Security,string ISINNumber, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsStaggered"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@Security",Security),
                new SqlParameter("@ISINNumber",ISINNumber),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsCumulative(string ProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsCumulative"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsCumulativeFilter(string ProductsId, string CategoryId, string UserId,string Security,string ISINNumber, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsCumulative"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@Security",Security),
                new SqlParameter("@ISINNumber",ISINNumber),
                  new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsSearch(string ProductsId, string CategoryId, string UserId,string ISINNumber,string ProductName, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsSearch"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName",ProductName),
                new SqlParameter("@IsActive",IsActive)

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable CheckInputData(string ISINNumber)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "CheckInputData"),
                new SqlParameter("@ISINNumber",ISINNumber),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsIn(string ProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsIn"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsFilter(string ProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsFilter"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsTop(string ProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsTop"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsPriceHigh(string ProductsId, string CategoryId, string CreditRatingId,string Price, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsPriceHigh"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@Price",Price),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsPriceLow(string ProductsId, string CategoryId, string CreditRatingId,string Price, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsPriceLow"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@Price",Price),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsYieldHigh(string ProductsId, string CategoryId, string CreditRatingId,string YTM, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsYieldHigh"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@YTM",YTM),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsYieldLow(string ProductsId, string CategoryId, string CreditRatingId,string YTM, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsYieldLow"),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@YTM",YTM),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsActive(string ProductsId,int PageIndex,string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsActive"),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@PageIndex",PageIndex),
                new SqlParameter("@PageSize",PageSize),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsActives(string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsActives"),
                new SqlParameter("@ProductsId", ProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsYieldBt(string ProductsId, int PageIndex, string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsYieldBt"),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@PageIndex",PageIndex),
                new SqlParameter("@PageSize",PageSize),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsYieldBts(string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsYieldBts"),
                new SqlParameter("@ProductsId", ProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsYieldUpper(string ProductsId, int PageIndex, string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsYieldUpper"),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@PageIndex",PageIndex),
                new SqlParameter("@PageSize",PageSize),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsYieldUppers(string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsYieldUppers"),
                new SqlParameter("@ProductsId", ProductsId),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsInvLower(string ProductsId,int PageIndex,string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvLower"),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@Pageindex",PageIndex),
                new SqlParameter("@PageSize",PageSize),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsInvLowerNew(string ProductsId, string PageIndex, string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvLowerNew"),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@Pageindex",PageIndex),
                new SqlParameter("@PageSize",PageSize),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsInvLowers(string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvLowers"),
                new SqlParameter("@ProductsId", ProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsInvBt(string ProductsId, int PageIndex, string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvBt"),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@Pageindex",PageIndex),
                new SqlParameter("@PageSize",PageSize),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsInvBtNew(string ProductsId, string PageIndex, string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvBtNew"),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@Pageindex",PageIndex),
                new SqlParameter("@PageSize",PageSize),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsInvBts(string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvBts"),
                new SqlParameter("@ProductsId", ProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsInvUpper(string ProductsId, int PageIndex, string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvUpper"),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@Pageindex",PageIndex),
                new SqlParameter("@PageSize",PageSize),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsInvUpperNew(string ProductsId, string PageIndex, string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvUpperNew"),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@Pageindex",PageIndex),
                new SqlParameter("@PageSize",PageSize),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsInvUppers(string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvUppers"),
                new SqlParameter("@ProductsId", ProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }


    public int add_Products(string ProductsId, string CategoryId,string ISINNumber,string ProductName, string Security,string CouponRate,string DataStatus,string PutCallDate,string CallDate, string GuaranteedBy,string MaturityDate,string PaymentTypeId, string IPDate,string Price,string YTCYieldSemi,string YTM ,string FacevalueForBond,string ProductImage , string ProductFile,string MaturityType,string MemorandumFile,string Description, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Products"),
               new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName",ProductName),
                new SqlParameter("@Security", Security),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@CallDate",CallDate),
                new SqlParameter("@GuaranteedBy",GuaranteedBy),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@ProductFile",ProductFile),
                new SqlParameter("@MaturityType",MaturityType),
                new SqlParameter("@MemorandumFile",MemorandumFile),
                new SqlParameter("@Description",Description),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_Products]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public int add_ProductsBullet(string ProductsId, string CategoryId, string ISINNumber,string ProductName, string Security, string CouponRate, string DataStatus, string PutCallDate, string CallDate, string GuaranteedBy, string MaturityDate, string PaymentTypeId, string IPDate, string Price, string YTCYieldSemi, string YTM, string FacevalueForBond, string MaturityType, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Products"),
               new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName",ProductName),
                new SqlParameter("@Security", Security),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@CallDate",CallDate),
                new SqlParameter("@GuaranteedBy",GuaranteedBy),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@MaturityType",MaturityType),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_Products]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public int add_ProductsStaggered(string ProductsId, string CategoryId, string ISINNumber,string ProductName, string Security, string CouponRate, string DataStatus, string PutCallDate, string CallDate, string GuaranteedBy, string MaturityDate, string PaymentTypeId, string IPDate, string Price, string YTCYieldSemi, string YTM, string FacevalueForBond, string ProductImage, string ProductFile,string MaturityType,string DateCount, string MemorandumFile,string Description, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Products"),
               new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName",ProductName),
                new SqlParameter("@Security", Security),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@CallDate",CallDate),
                new SqlParameter("@GuaranteedBy",GuaranteedBy),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@ProductFile",ProductFile),
                new SqlParameter("@MaturityType",MaturityType),
                new SqlParameter("@DateCount",DateCount),
                new SqlParameter("@MemorandumFile",MemorandumFile),
                new SqlParameter("@Description",Description),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_Products]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public int add_ProductsStaggeredName(string ProductsId, string CategoryId, string ISINNumber,string ProductName, string Security, string CouponRate, string DataStatus, string PutCallDate, string CallDate, string GuaranteedBy, string MaturityDate, string PaymentTypeId, string IPDate, string Price, string YTCYieldSemi, string YTM, string FacevalueForBond,string MaturityType, string DateCount, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Products"),
               new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName",ProductName),
                new SqlParameter("@Security", Security),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@CallDate",CallDate),
                new SqlParameter("@GuaranteedBy",GuaranteedBy),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@MaturityType",MaturityType),
                new SqlParameter("@DateCount",DateCount),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_Products]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_Products(string ProductsId, string CategoryId, string ISINNumber, string Security,string ProductName, string CouponRate, string DataStatus, string PutCallDate,string CallDate,string GuaranteedBy, string MaturityDate,string PaymentTypeId, string IPDate, string Price, string YTCYieldSemi, string YTM, string FacevalueForBond,string ProductImage,string ProductFile,string MemorandumFile,string MaturityType,string Description, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_Products"),
               new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@Security", Security),
                new SqlParameter("@ProductName",ProductName),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@CallDate",CallDate),
                new SqlParameter("@GuaranteedBy",GuaranteedBy),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@ProductFile",ProductFile),
                new SqlParameter("@MemorandumFile",MemorandumFile),
                new SqlParameter("@MaturityType",MaturityType),
                new SqlParameter("@Description",Description),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public bool update_ProductsStaggered(string ProductsId, string CategoryId, string ISINNumber,string ProductName, string Security, string CouponRate, string DataStatus, string PutCallDate, string CallDate, string GuaranteedBy, string MaturityDate, string PaymentTypeId, string IPDate, string Price, string YTCYieldSemi, string YTM, string FacevalueForBond, string ProductImage, string ProductFile,string MaturityType ,string DateCount,string MemorandumFile,string Description, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_Products"),
               new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName",ProductName),
                new SqlParameter("@Security", Security),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@CallDate",CallDate),
                new SqlParameter("@GuaranteedBy",GuaranteedBy),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@ProductFile",ProductFile),
                new SqlParameter("@MaturityType",MaturityType),
                new SqlParameter("@DateCount",DateCount),
                new SqlParameter("@MemorandumFile",MemorandumFile),
                new SqlParameter("@Description",Description),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public bool Add_ProductsSell(string ProductsId, string CategoryId, string ISINNumber, string ProductName, string Security, string CouponRate, string DataStatus, string PutCallDate,string CallDate,string GuaranteedBy, string MaturityDate, string IPDate, string Price, string YTCYieldSemi, string YTM, string FacevalueForBond, string ProductImage, string ProductFile, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Products"),
               new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@Security",Security),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@CallDate",CallDate),
                new SqlParameter("@GuaranteedBy",GuaranteedBy),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@ProductFile",ProductFile),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Products_Active_Status(string ProductsId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_Products_Active_Status"),

                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Products_ShowData(string ProductsId, bool? ShowData)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_Products_ShowData"),

                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@ShowData",ShowData),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Products_IsInvestNow(string ProductsId, bool? IsInvestNow)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_Products_IsInvestNow"),

                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@IsInvestNow",IsInvestNow),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_Products(string ProductsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_Products"),

                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_RatingAgenciesTags

    public DataTable get_RatingAgenciesTags(string RatingAgenciesTagsId, string ProductsId, string RatingAgenciesId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_RatingAgenciesTags"),
                new SqlParameter("@RatingAgenciesTagsId", RatingAgenciesTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@RatingAgenciesId",RatingAgenciesId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_RatingAgenciesTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_RatingAgenciesTagsActive(string RatingAgenciesTagsId, string ProductsId, string RatingAgenciesId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_RatingAgenciesTagsActive"),
                new SqlParameter("@ProductTagsId", RatingAgenciesTagsId),
                new SqlParameter("@ProductId",ProductsId),
                new SqlParameter("@RatingAgenciesId",RatingAgenciesId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_RatingAgenciesTags]", CommandType.StoredProcedure, parameter);
    }


    public bool add_RatingAgenciesTags(string RatingAgenciesTagsId, string ProductsId, string RatingAgenciesId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_RatingAgenciesTags"),
                new SqlParameter("@RatingAgenciesTagsId", RatingAgenciesTagsId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@RatingAgenciesId",RatingAgenciesId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RatingAgenciesTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_RatingAgenciesTags(string RatingAgenciesTagsId, string ProductsId, string RatingAgenciesId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_RatingAgenciesTags"),
                new SqlParameter("@RatingAgenciesTagsId", RatingAgenciesTagsId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@RatingAgenciesId",RatingAgenciesId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RatingAgenciesTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_RatingAgenciesTags_Active_Status(string RatingAgenciesTagsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_RatingAgenciesTags_Active_Status"),

                new SqlParameter("@ProductTagsId", RatingAgenciesTagsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RatingAgenciesTags]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_RatingAgenciesTags(string RatingAgenciesTagsId, string ProductsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_RatingAgenciesTags"),

                new SqlParameter("@RatingAgenciesTagsId", RatingAgenciesTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RatingAgenciesTags]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CreditRatingTags

    public DataTable get_CreditRatingTags(string CreditRatingTagsId, string ProductsId, string CreditRatingId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CreditRatingTags"),
                new SqlParameter("@CreditRatingTagsId", CreditRatingTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CreditRatingTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CreditRatingTagsFilter(string CreditRatingTagsId, string ProductsId, string CreditRatingId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CreditRatingTagsFilter"),
                new SqlParameter("@CreditRatingTagsId", CreditRatingTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CreditRatingTags]", CommandType.StoredProcedure, parameter);
    }
    public DataTable Get_CreditRatingTagsData(string CreditRatingTagsId, string ProductsId, string CreditRatingId, bool? IsActive,int PageIndex,string PageSize,string CategoryId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "Get_CreditRatingTagsData"),
                new SqlParameter("@CreditRatingTagsId", CreditRatingTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@PageIndex",PageIndex),
                new SqlParameter("@PageSize",PageSize),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@CategoryId",CategoryId),


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CreditRatingTags]", CommandType.StoredProcedure, parameter);
    }
    public DataTable Get_CreditRatingTagsDataNew(string CreditRatingTagsId, string ProductsId, string CreditRatingId, bool? IsActive, string PageIndex, string PageSize, string CategoryId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "Get_CreditRatingTagsDataNew"),
                new SqlParameter("@CreditRatingTagsId", CreditRatingTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@PageIndex",PageIndex),
                new SqlParameter("@PageSize",PageSize),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@CategoryId",CategoryId),


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CreditRatingTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CreditRatingTagsActive(string CreditRatingTagsId, string ProductsId, string CreditRatingId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CreditRatingTagsActive"),
                new SqlParameter("@CreditRatingTagsId", CreditRatingTagsId),
                new SqlParameter("@ProductId",ProductsId),
                new SqlParameter("@CreditRatingId",CreditRatingId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CreditRatingTags]", CommandType.StoredProcedure, parameter);
    }


    public bool add_CreditRatingTags(string CreditRatingTagsId, string ProductsId, string CreditRatingId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CreditRatingTags"),
                new SqlParameter("@CreditRatingTagsId", CreditRatingTagsId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CreditRatingTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CreditRatingTags(string CreditRatingTagsId, string ProductsId, string CreditRatingId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CreditRatingTags"),
                new SqlParameter("@CreditRatingTagsId", CreditRatingTagsId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CreditRatingTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CreditRatingTags_Active_Status(string CreditRatingTagsId,string ProductsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CreditRatingTags_Active_Status"),

                new SqlParameter("@CreditRatingTagsId", CreditRatingTagsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CreditRatingTags]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CreditRatingTags(string CreditRatingTagsId, string ProductsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CreditRatingTags"),

                new SqlParameter("@CreditRatingTagsId", CreditRatingTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CreditRatingTags]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_ProductsTags

    public DataTable get_ProductsTags(string ProductsTagsId, string ProductsId, string TagsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsTags"),
                new SqlParameter("@ProductsTagsId", ProductsTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ProductsTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsTagsFilter(string ProductsTagsId, string ProductsId, string TagsId,string CategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsTagsFilter"),
                new SqlParameter("@ProductsTagsId", ProductsTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ProductsTags]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsTagsFilterData(string ProductsTagsId, string ProductsId, string TagsId, string CategoryId, bool? IsActive,int PageIndex,string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsTagsFilterData"),
                new SqlParameter("@ProductsTagsId", ProductsTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@PageIndex",PageIndex),
                new SqlParameter("@PageSize",PageSize),


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ProductsTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsTagsFilterNew(string ProductsTagsId, string ProductsId, string TagsId, string CategoryId, bool? IsActive, string PageIndex, string PageSize)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsTagsFilterNew"),
                new SqlParameter("@ProductsTagsId", ProductsTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@PageIndex",PageIndex),
                new SqlParameter("@PageSize",PageSize),


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ProductsTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ProductsTagsActive(string ProductsTagsId, string ProductsId, string TagsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsTagsActive"),
                new SqlParameter("@ProductTagsId", ProductsTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@TagsId",TagsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ProductsTags]", CommandType.StoredProcedure, parameter);
    }


    public bool add_ProductsTags(string ProductsTagsId, string ProductsId, string TagsId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_ProductsTags"),
                new SqlParameter("@ProductsTagsId", ProductsTagsId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ProductsTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_ProductsTags(string ProductsTagsId, string ProductsId, string TagsId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_ProductsTags"),
                new SqlParameter("@ProductsTagsId", ProductsTagsId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ProductsTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_ProductsTags_Active_Status(string ProductsTagsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_ProductsTags_Active_Status"),

                new SqlParameter("@ProductTagsId", ProductsTagsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ProductsTags]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_ProductsTags(string ProductsTagsId, string ProductsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_ProductsTags"),

                new SqlParameter("@ProductsTagsId", ProductsTagsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ProductsTags]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_BlogNews

    public DataTable get_BlogNews(string BlogId, string BlogCategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
           new SqlParameter("@action", "get_BlogNews"),
           new SqlParameter("@BlogId",BlogId),
           new SqlParameter("@BlogCategoryId", BlogCategoryId),
           new SqlParameter("@IsActive",IsActive)

        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BlogNews]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_BlogNewsCategory(string BlogId, string BlogCategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
           new SqlParameter("@action", "get_BlogNewsCategory"),
           new SqlParameter("@BlogId",BlogId),
           new SqlParameter("@BlogCategoryId", BlogCategoryId),
           new SqlParameter("@IsActive",IsActive)

        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BlogNews]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_BlogNewsTop(string BlogId, string BlogCategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
           new SqlParameter("@action", "get_BlogNewsTop"),
           new SqlParameter("@BlogId",BlogId),
           new SqlParameter("@BlogCategoryId", BlogCategoryId),
           new SqlParameter("@IsActive",IsActive)

        };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BlogNews]", CommandType.StoredProcedure, parameter);
    }


    public int add_BlogNews(string BlogId, string BlogCategoryId, string BlogImage, string BlogDate, string AuthorBy, string BlogTitle, string BlogSubTitle,string MetaDescripton, string Description,  string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_BlogNews"),
               new SqlParameter("@BlogId",BlogId),
                new SqlParameter("@BlogCategoryId", BlogCategoryId),
                new SqlParameter("@BlogImage", BlogImage),
                new SqlParameter("@BlogDate",BlogDate),
                new SqlParameter("@AuthorBy",AuthorBy),
                new SqlParameter("@BlogTitle",BlogTitle),
                new SqlParameter("@BlogSubTitle",BlogSubTitle),
                new SqlParameter("@MetaDescription",MetaDescripton),
                new SqlParameter("@Description",Description),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId),
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_BlogNews]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_BlogNews(string BlogId, string BlogCategoryId, string BlogImage, string BlogDate, string AuthorBy, string BlogTitle, string BlogSubTitle,string MetaDescription, string Description, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_BlogNews"),
               new SqlParameter("@BlogId",BlogId),
                new SqlParameter("@BlogCategoryId", BlogCategoryId),
                new SqlParameter("@BlogImage", BlogImage),
                new SqlParameter("@BlogDate",BlogDate),
                new SqlParameter("@AuthorBy",AuthorBy),
                new SqlParameter("@BlogTitle",BlogTitle),
                new SqlParameter("@BlogSubTitle",BlogSubTitle),
                new SqlParameter("@MetaDescription",MetaDescription),
                new SqlParameter("@Description",Description),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogNews]", CommandType.StoredProcedure, parameter);
    }

    public bool update_BlogNews_Active_Status(string BlogId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_BlogNews_Active_Status"),

                new SqlParameter("@BlogId", BlogId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogNews]", CommandType.StoredProcedure, parameter);
    }

    public bool update_BlogNews_CheckTopBlog_Status(string BlogId, bool? CheckTopBlog, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_BlogNews_CheckTopBlog_Status"),

                new SqlParameter("@BlogId", BlogId),
                new SqlParameter("@CheckTopBlog",CheckTopBlog),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogNews]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_BlogNews(string BlogId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_BlogNews"),

                new SqlParameter("@BlogId", BlogId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogNews]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region ContactDetails


    //Panel Users

    public DataTable getContactDetails(string ContactDetailsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getContactDetails"),
               new SqlParameter("@ContactDetailsId", ContactDetailsId),

               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ContactDetails]", CommandType.StoredProcedure, parameter);
    }
    

    public bool AddContactDetails(string ContactDetailsId, string ContactFullName, string ContactEmail, string ContactMobile, string ContactSubject, string ContactMessage)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action","AddContactDetails"),
            new SqlParameter("@ContactDetailsId",ContactDetailsId),
            new SqlParameter("@ContactFullName",ContactFullName),
            new SqlParameter("@ContactEmail",ContactEmail),
            new SqlParameter("@ContactMobile",ContactMobile),
            new SqlParameter("@ContactSubject",ContactSubject),
            new SqlParameter("@ContactMessage",ContactMessage)

        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ContactDetails]", CommandType.StoredProcedure, parameter);

    }


    public bool UpdateContactDetails(string ContactDetailsId, string ContactFullName,string ContactEmail, string ContactMobile, string ContactSubject,string ContactMessage)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action","UpdateContactDetails"),
            new SqlParameter("@ContactDetailsId",ContactDetailsId),
            new SqlParameter("@ContactFullName",ContactFullName),
            new SqlParameter("@ContactEmail",ContactEmail),
            new SqlParameter("@ContactMobile",ContactMobile),
            new SqlParameter("@ContactSubject",ContactSubject),
            new SqlParameter("@ContactMessage",ContactMessage)

        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ContactDetails]", CommandType.StoredProcedure, parameter);

    }
    public bool updateContactDetailsActiveStatus(bool IsActive, string ContactDetailsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "updateContactDetailsActiveStatus"),
                new SqlParameter("@IsActive", IsActive),

                new SqlParameter("@ContactDetailsId", ContactDetailsId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ContactDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool deleteContactDetails(string ContactDetailsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "deleteContactDetails"),

                new SqlParameter("@ContactDetailsId", ContactDetailsId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ContactDetails]", CommandType.StoredProcedure, parameter);
    }
    #endregion

    #region usp_Subscribe

    public DataTable getSubscribe(string SubscribeId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getSubscribe"),
                new SqlParameter("@SubscribeId", SubscribeId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Subscribe]", CommandType.StoredProcedure, parameter);
    }



    public bool AddSubscribe(string SubscribeId, string SubscribeEmail)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "AddSubscribe"),
                new SqlParameter("@SubscribeId", SubscribeId),
                new SqlParameter("@SubscribeEmail", SubscribeEmail),
               
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Subscribe]", CommandType.StoredProcedure, parameter);
    }

    public bool updateSubscribeActiveStatus(string SubscribeId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "updateSubscribeActiveStatus"),

                new SqlParameter("@SubscribeId", SubscribeId),
                new SqlParameter("@IsActive",IsActive),
               
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Subscribe]", CommandType.StoredProcedure, parameter);
    }

    public bool deleteSubscribe(string SubscribeId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "deleteSubscribe"),

                new SqlParameter("@SubscribeId", SubscribeId),
       
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Subscribe]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_BlogCategory

    public DataTable get_BlogCategory(string BlogCategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_BlogCategory"),
                new SqlParameter("@BlogCategoryId", BlogCategoryId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BlogCategory]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_BlogCategoryActive(string BlogCategoryId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_BlogCategoryActive"),
                new SqlParameter("@BlogCategoryId", BlogCategoryId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BlogCategory]", CommandType.StoredProcedure, parameter);
    }


    public bool add_BlogCategory(string BlogCategoryId, string BlogCategoryHead, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_BlogCategory"),
                new SqlParameter("@BlogCategoryId", BlogCategoryId),
                new SqlParameter("@BlogCategoryHead", BlogCategoryHead),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogCategory]", CommandType.StoredProcedure, parameter);
    }

    public bool update_BlogCategory(string BlogCategoryId, string BlogCategoryHead, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_BlogCategory"),
                new SqlParameter("@BlogCategoryId", BlogCategoryId),
                new SqlParameter("@BlogCategoryHead", BlogCategoryHead),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogCategory]", CommandType.StoredProcedure, parameter);
    }

    public bool update_BlogCategory_Active_Status(string BlogCategoryId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_BlogCategory_Active_Status"),

                new SqlParameter("@BlogCategoryId", BlogCategoryId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogCategory]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_BlogCategory(string BlogCategoryId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_BlogCategory"),

                new SqlParameter("@BlogCategoryId", BlogCategoryId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogCategory]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_BlogTags

    public DataTable get_BlogTags(string BlogTagsId, string BlogId, string TagsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_BlogTags"),
                new SqlParameter("@BlogTagsId", BlogTagsId),
                new SqlParameter("@BlogId",BlogId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BlogTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_BlogTagsData(string TagsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_BlogTagsData"),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BlogTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_BlogNewsTags(string BlogTagsId,string BlogId,string BlogCategoryId, string TagsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_BlogNewsTags"),
                new SqlParameter("@BlogTagsId",BlogTagsId),
                new SqlParameter("@BlogId",BlogId),
                new SqlParameter("@BlogCategoryId",BlogCategoryId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BlogTags]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_BlogTagsActive(string BlogTagsId, string BlogId, string TagsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_BlogTagsActive"),
                new SqlParameter("@BlogTagsId", BlogTagsId),
                new SqlParameter("@BlogId",BlogId),
                new SqlParameter("@TagsId",TagsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_BlogTags]", CommandType.StoredProcedure, parameter);
    }


    public bool add_BlogTags(string BlogTagsId, string BlogId, string TagsId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_BlogTags"),
                new SqlParameter("@BlogTagsId", BlogTagsId),
                new SqlParameter("@BlogId", BlogId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_BlogTags(string BlogTagsId, string BlogId, string TagsId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_BlogTags"),
                new SqlParameter("@BlogTagsId", BlogTagsId),
                new SqlParameter("@BlogId", BlogId),
                new SqlParameter("@TagsId",TagsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogTags]", CommandType.StoredProcedure, parameter);
    }

    public bool update_BlogTags_Active_Status(string BlogTagsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_BlogTags_Active_Status"),

                new SqlParameter("@BlogTagsId", BlogTagsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogTags]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_BlogTags(string BlogTagsId, string BlogId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_BlogTags"),

                new SqlParameter("@BlogTagsId", BlogTagsId),
                new SqlParameter("@BlogId",BlogId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_BlogTags]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_PartnerDetails

    public DataTable get_PartnerDetails(string PartnerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PartnerDetails"),
                new SqlParameter("@PartnerId", PartnerId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PartnerDetails]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_PartnerDetailsActive(string PartnerId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PartnerDetailsActive"),
                new SqlParameter("@PartnerId", PartnerId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PartnerDetails]", CommandType.StoredProcedure, parameter);
    }


    public int add_PartnerDetails(string PartnerId, string PFirstName, string PMiddleName, string PLastName,string PEmail,string PMobile,string PAddress,string PAppartment,string PCity,string PState, string PCountryId,string PPostalCode, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_PartnerDetails"),
                new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@PFirstName", PFirstName),
                new SqlParameter("@PMiddleName",PMiddleName),
                new SqlParameter("@PLastName",PLastName),
                new SqlParameter("@PEmail", PEmail),
                new SqlParameter("@PMobile",PMobile),
                new SqlParameter("@PAddress",PAddress),
                new SqlParameter("@PAppartment", PAppartment),
                new SqlParameter("@PCity",PCity),
                new SqlParameter("@PState",PState),
                new SqlParameter("@PCountryId",PCountryId),
                new SqlParameter("@PPostalCode",PPostalCode),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_PartnerDetails]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_PartnerDetails(string PartnerId, string PFirstName, string PMiddleName, string PLastName, string PEmail, string PMobile, string PAddress, string PAppartment, string PCity, string PState, string PCountryId, string PPostalCode, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_PartnerDetails"),
               new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@PFirstName", PFirstName),
                new SqlParameter("@PMiddleName",PMiddleName),
                new SqlParameter("@PLastName",PLastName),
                new SqlParameter("@PEmail", PEmail),
                new SqlParameter("@PMobile",PMobile),
                new SqlParameter("@PAddress",PAddress),
                new SqlParameter("@PAppartment", PAppartment),
                new SqlParameter("@PCity",PCity),
                new SqlParameter("@PState",PState),
                new SqlParameter("@PCountryId",PCountryId),
                new SqlParameter("@PPostalCode",PPostalCode),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_PartnerDetails_Active_Status(string PartnerId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_PartnerDetails_Active_Status"),

                new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_PartnerDetails(string PartnerId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_PartnerDetails"),

                new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_PartnerBankDetails

    public DataTable get_PartnerBankDetails(string PBankId, string PartnerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PartnerBankDetails"),
                new SqlParameter("@PBankId", PBankId),
                new SqlParameter("@PartnerId",PartnerId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PartnerBankDetails]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_PartnerBankDetailsActive(string PBankId, string PartnerId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PartnerBankDetailsActive"),
                new SqlParameter("@PBankId", PBankId),
                new SqlParameter("@PartnerId",PartnerId),
               
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PartnerBankDetails]", CommandType.StoredProcedure, parameter);
    }


    public bool add_PartnerBankDetails(string PBankId, string PartnerId,string PBankHolderName,string PBankName,string PBankBranch,string PBankCity,string PAccountNumber,string PMICRCode, string PIFSCCode,string PAdharImage,string PPANImage, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_PartnerBankDetails"),
                new SqlParameter("@PBankId", PBankId),
                new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@PBankHolderName", PBankHolderName),
                new SqlParameter("@PBankName", PBankName),
                new SqlParameter("@PBankBranch", PBankBranch),
                new SqlParameter("@PBankCity",PBankCity),
                new SqlParameter("@PAccountNumber", PAccountNumber),
                new SqlParameter("@PMICRCode", PMICRCode),
                new SqlParameter("@PIFSCCode", PIFSCCode),
                new SqlParameter("@PAdharImage", PAdharImage),
                new SqlParameter("@PPANImage", PPANImage),

                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerBankDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_PartnerBankDetails(string PBankId, string PartnerId, string PBankHolderName, string PBankName, string PBankBranch, string PBankCity, string PAccountNumber, string PMICRCode, string PIFSCCode, string PAdharImage, string PPANImage, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_PartnerBankDetails"),
               new SqlParameter("@PBankId", PBankId),
                new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@PBankHolderName", PBankHolderName),
                new SqlParameter("@PBankName", PBankName),
                new SqlParameter("@PBankBranch", PBankBranch),
                new SqlParameter("@PBankCity",PBankCity),
                new SqlParameter("@PAccountNumber", PAccountNumber),
                new SqlParameter("@PMICRCode", PMICRCode),
                new SqlParameter("@PIFSCCode", PIFSCCode),
                new SqlParameter("@PAdharImage", PAdharImage),
                new SqlParameter("@PPANImage", PPANImage),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerBankDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_PartnerBankDetails_Active_Status(string PartnerId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_PartnerBankDetails_Active_Status"),
                new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerBankDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_PartnerBankDetails(string PBankId, string PartnerId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_PartnerBankDetails"),

                new SqlParameter("@PBankId", PBankId),
                new SqlParameter("@PartnerId",PartnerId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerBankDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_PartnerDemateDetails

    public DataTable get_PartnerDemateDetails(string PDemateId, string PartnerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PartnerDemateDetails"),
                new SqlParameter("@PDemateId", PDemateId),
                new SqlParameter("@PartnerId",PartnerId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PartnerDemateDetails]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_PartnerDemateDetailsActive(string PDemateId, string PartnerId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PartnerDemateDetailsActive"),
                new SqlParameter("@PDemateId", PDemateId),
                new SqlParameter("@PartnerId",PartnerId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PartnerDemateDetails]", CommandType.StoredProcedure, parameter);
    }


    public bool add_PartnerDemateDetails(string PDemateId, string PartnerId, string PDPName, string PDPId, string PClientId,string PFullDPClientId,string PDemateTypeId,  string PDescription, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_PartnerDemateDetails"),
                new SqlParameter("@PDemateId", PDemateId),
                new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@PDPName", PDPName),
                new SqlParameter("@PDPId", PDPId),
                new SqlParameter("@PClientId", PClientId),
                new SqlParameter("@PFullNameClientId",PFullDPClientId),
                new SqlParameter("@PDemateTypeId",PDemateTypeId),
                new SqlParameter("@PDescription",PDescription),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerDemateDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_PartnerDemateDetails(string PDemateId, string PartnerId, string PDPName, string PDPId, string ClientId,string PFullDPClientId,string PDemateTypeId, string PDescription, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_PartnerDemateDetails"),
               new SqlParameter("@PDemateId", PDemateId),
                new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@PDPName", PDPName),
                new SqlParameter("@PDPId", PDPId),
                new SqlParameter("@ClientId", ClientId),
                new SqlParameter("@PDescription",PDescription),
                new SqlParameter("@PFullDPClientId",PFullDPClientId),
                new SqlParameter("@PDemateTypeId",PDemateTypeId),
                new SqlParameter("@UserId",UserId),
             
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerDemateDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_PartnerDemateDetails_Active_Status(string PartnerId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_PartnerDemateDetails_Active_Status"),

                new SqlParameter("@PartnerId", PartnerId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerDemateDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_PartnerDemateDetails(string PDemateId, string PartnerId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_PartnerDemateDetails"),

                new SqlParameter("@PDemateId", PDemateId),
                new SqlParameter("@PartnerId",PartnerId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PartnerDemateDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_Country

    public DataTable get_Country(string CountryId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_Country"),
                new SqlParameter("@CountryId", CountryId),
                

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Country]", CommandType.StoredProcedure, parameter);
    }
    #endregion

    #region usp_AskQuestion

    public DataTable get_AskQuestion(string AskQuestionId,string ProductsId,string FAQCategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_AskQuestion"),
                new SqlParameter("@AskQuestionId", AskQuestionId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@FAQCategoryId",FAQCategoryId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_AskQuestion]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_AskQuestionTop(string AskQuestionId, string ProductsId, string FAQCategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_AskQuestionTop"),
                new SqlParameter("@AskQuestionId", AskQuestionId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@FAQCategoryId",FAQCategoryId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_AskQuestion]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_AskQuestionActive(string AskQuestionId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_AskQuestionActive"),
                new SqlParameter("@AskQuestionId", AskQuestionId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_AskQuestion]", CommandType.StoredProcedure, parameter);
    }


    public int add_AskQuestion(string AskQuestionId,string ProductsId,string FAQCategoryId, string Question,string Answer, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_AskQuestion"),
                new SqlParameter("@AskQuestionId", AskQuestionId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@FAQCategoryId",FAQCategoryId),
                new SqlParameter("@Question", Question),
                new SqlParameter("@Answer",Answer),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId),
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_AskQuestion]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_AskQuestion(string AskQuestionId,string ProductsId,string FAQCategoryId, string Question,string Answer, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_AskQuestion"),
                new SqlParameter("@AskQuestionId", AskQuestionId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@FAQCategoryId",FAQCategoryId),
                new SqlParameter("@Question", Question),
                new SqlParameter("@Answer",Answer),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AskQuestion]", CommandType.StoredProcedure, parameter);
    }

    public bool update_AskQuestion_Active_Status(string AskQuestionId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_AskQuestion_Active_Status"),

                new SqlParameter("@AskQuestionId", AskQuestionId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AskQuestion]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_AskQuestion(string AskQuestionId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_AskQuestion"),

                new SqlParameter("@AskQuestionId", AskQuestionId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AskQuestion]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_FAQProducts

    public DataTable get_FAQProducts(string FAQProductsId, string ProductsId,string CategoryId, string AskQuestionId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_FAQProducts"),
                new SqlParameter("@FAQProductsId", FAQProductsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@AskQuestionId",AskQuestionId),
                new SqlParameter("@IsActive",IsActive)

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_FAQProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_FAQProductsActive(string FAQProductsId, string ProductsId, string AskQuestionId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_FAQProductsActive"),
                new SqlParameter("@FAQProductsId", FAQProductsId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@AskQuestionId",AskQuestionId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_FAQProducts]", CommandType.StoredProcedure, parameter);
    }


    public bool add_FAQProducts(string FAQProductsId, string ProductsId,string CategoryId, string AskQuestionId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_FAQProducts"),
                new SqlParameter("@FAQProductsId", FAQProductsId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@AskQuestionId",AskQuestionId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_FAQProducts]", CommandType.StoredProcedure, parameter);
    }

    public bool update_FAQProducts(string FAQProductsId, string ProductsId,string CategoryId, string AskQuestionId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_FAQProducts"),
                new SqlParameter("@FAQProductsId", FAQProductsId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@AskQuestionId",AskQuestionId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_FAQProducts]", CommandType.StoredProcedure, parameter);
    }

    public bool update_FAQProducts_Active_Status(string AskQuestionId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_FAQProducts_Active_Status"),
                new SqlParameter("@AskQuestionId", AskQuestionId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_FAQProducts]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_FAQProducts(string FAQProductsId, string AskQuestionId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_FAQProducts"),

                new SqlParameter("@FAQProductsId", FAQProductsId),
                new SqlParameter("@AskQuestionId",AskQuestionId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_FAQProducts]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_Video

    public DataTable get_Video(string VideoId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_Video"),
                new SqlParameter("@VideoId", VideoId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Video]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_VideoOne(string VideoId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_VideoOne"),
                new SqlParameter("@VideoId", VideoId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Video]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_VideoActive(string VideoId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_VideoActive"),
                new SqlParameter("@VideoId", VideoId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Video]", CommandType.StoredProcedure, parameter);
    }


    public bool add_Video(string VideoId, string VideoPath, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Video"),
                new SqlParameter("@VideoId", VideoId),
                new SqlParameter("@VideoPath", VideoPath),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Video]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Video(string VideoId, string VideoPath, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_Video"),
                new SqlParameter("@VideoId", VideoId),
                new SqlParameter("@VideoPath", VideoPath),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Video]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Video_Active_Status(string VideoId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_Video_Active_Status"),

                new SqlParameter("@VideoId", VideoId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Video]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_Video(string VideoId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_Video"),

                new SqlParameter("@VideoId", VideoId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Video]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_RMAssign

    public DataTable get_RMAssign(string RMAssignId,string UserId,string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_RMAssign"),
                new SqlParameter("@RMAssignId", RMAssignId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_RMAssign]", CommandType.StoredProcedure, parameter);
    }
    public DataTable GetRM(string RMAssignId, string UserId, string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "GetRM"),
                new SqlParameter("@RMAssignId", RMAssignId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_RMAssign]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_RMAssignFilter(string RMAssignId, string UserId, string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_RMAssign"),
                new SqlParameter("@RMAssignId", RMAssignId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CustomerId",CustomerId),
                  new SqlParameter("@IsActive",IsActive)



            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_RMAssign]", CommandType.StoredProcedure, parameter);
    }


    public int add_RMAssign(string RMAssignId,  string CustomerId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_RMAssign"),
                new SqlParameter("@RMAssignId", RMAssignId),
             
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@returnId",returnId),
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_RMAssign]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_RMAssign(string RMAssignId, string UserId,string CustomerId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_RMAssign"),
                new SqlParameter("@RMAssignId", RMAssignId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CustomerId",CustomerId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RMAssign]", CommandType.StoredProcedure, parameter);
    }

    public bool ReAssignRM(string RMAssignId, string UserId, string CustomerId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "ReAssignRM"),
                new SqlParameter("@RMAssignId", RMAssignId),
                new SqlParameter("@ReAssignRM",UserId),
                new SqlParameter("@CustomerId",CustomerId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RMAssign]", CommandType.StoredProcedure, parameter);
    }

    public bool update_RMAssign_Active_Status(string RMAssignId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_RMAssign_Active_Status"),

                new SqlParameter("@RMAssignId", RMAssignId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RMAssign]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_RMAssign(string RMAssignId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_RMAssign"),

                new SqlParameter("@RMAssignId", RMAssignId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_RMAssign]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_AddDeal

    public DataTable get_AddDeal(string DealId,string ProductsId, string CustomerId,string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_AddDeal"),
                new SqlParameter("@DealId", DealId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_AddDeal]", CommandType.StoredProcedure, parameter);
    }


    public bool add_AddDeal(string DealId,string ProductsId,string CustomerId, string DealDate, string PaymentDate,string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_AddDeal"),
                new SqlParameter("@DealId", DealId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@DealDate",DealDate),
                new SqlParameter("@PaymentDate",PaymentDate),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AddDeal]", CommandType.StoredProcedure, parameter);
    }

    public bool update_AddDeal(string DealId, string ProductsId, string CustomerId, string DealDate, string PaymentDate,string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_AddDeal"),
                new SqlParameter("@DealId", DealId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@DealDate",DealDate),
                new SqlParameter("@PaymentDate",PaymentDate),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AddDeal]", CommandType.StoredProcedure, parameter);
    }

    public bool update_AddDeal_Active_Status(string DealId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_AddDeal_Active_Status"),
                new SqlParameter("@DealId", DealId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AddDeal]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_AddDeal(string DealId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_AddDeal"),
                new SqlParameter("@DealId", DealId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_AddDeal]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_FAQCategory

    public DataTable get_FAQCategory(string FAQCategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_FAQCategory"),
                new SqlParameter("@FAQCategoryId", FAQCategoryId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_FAQCategory]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_FAQCategoryActive(string FAQCategoryId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_FAQCategoryActive"),
                new SqlParameter("@FAQCategoryId", FAQCategoryId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_FAQCategory]", CommandType.StoredProcedure, parameter);
    }


    public bool add_FAQCategory(string FAQCategoryId, string FAQCategoryHead, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_FAQCategory"),
                new SqlParameter("@FAQCategoryId", FAQCategoryId),
                new SqlParameter("@FAQCategoryHead", FAQCategoryHead),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_FAQCategory]", CommandType.StoredProcedure, parameter);
    }

    public bool update_FAQCategory(string FAQCategoryId, string FAQCategoryHead, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_FAQCategory"),
                new SqlParameter("@FAQCategoryId", FAQCategoryId),
                new SqlParameter("@FAQCategoryHead", FAQCategoryHead),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_FAQCategory]", CommandType.StoredProcedure, parameter);
    }

    public bool update_FAQCategory_Active_Status(string FAQCategoryId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_FAQCategory_Active_Status"),

                new SqlParameter("@FAQCategoryId", FAQCategoryId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_FAQCategory]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_FAQCategory(string FAQCategoryId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_FAQCategory"),

                new SqlParameter("@FAQCategoryId", FAQCategoryId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_FAQCategory]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_ReAssignLog

    public DataTable get_ReAssignLog(string ReAssignLogId, string UserId, string CustomerId, string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ReAssignLog"),
                new SqlParameter("@ReAssignLogId", ReAssignLogId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@EntryUserId",EntryUserId)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ReAssignLog]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_ReAssignLogTop(string ReAssignLogId, string UserId, string CustomerId, string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ReAssignLogTop"),
                new SqlParameter("@ReAssignLogId", ReAssignLogId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@EntryUserId",EntryUserId)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_ReAssignLog]", CommandType.StoredProcedure, parameter);
    }


    public bool add_ReAssignLog(string ReAssignLogId,  string CustomerId, string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_ReAssignLog"),
                new SqlParameter("@ReAssignLogId", ReAssignLogId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@EntryUserId",EntryUserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ReAssignLog]", CommandType.StoredProcedure, parameter);
    }
    public bool add_ReAssignRMLog(string ReAssignLogId, string UserId, string CustomerId, string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_ReAssignRMLog"),
                new SqlParameter("@ReAssignLogId", ReAssignLogId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@EntryUserId",EntryUserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ReAssignLog]", CommandType.StoredProcedure, parameter);
    }

    public bool update_ReAssignLog(string ReAssignLogId, string UserId, string CustomerId,string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_ReAssignLog"),
                new SqlParameter("@ReAssignLogId", ReAssignLogId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@EntryUserId",EntryUserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ReAssignLog]", CommandType.StoredProcedure, parameter);
    }

    public bool Update_RMAssignLog(string ReAssignLogId,  string CustomerId, string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "Update_RMAssignLog"),
               new SqlParameter("@ReAssignLogId",ReAssignLogId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@EntryUserId",EntryUserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ReAssignLog]", CommandType.StoredProcedure, parameter);
    }

    public bool update_ReAssignLog_Active_Status(string ReAssignLogId, bool? IsActive, string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_ReAssignLog_Active_Status"),
                new SqlParameter("@ReAssignLogId", ReAssignLogId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@EntryUserId",EntryUserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ReAssignLog]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_ReAssignLog(string ReAssignLogId, string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_ReAssignLog"),
                new SqlParameter("@ReAssignLogId", ReAssignLogId),
                new SqlParameter("@EntryUserId",EntryUserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_ReAssignLog]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_SellBond

    public DataTable get_SellBond(string SellBondId, string CustomerId,string CategoryId,string PaymentTypeId,string SCreditRating,string SRatingAgencies, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_SellBond"),
                new SqlParameter("@SellBondId",SellBondId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@SCreditRating",SCreditRating),
                new SqlParameter("@SRatingAgencies",SRatingAgencies),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_SellBond]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_SellBondStatus(string SellBondId, string CustomerId,string CategoryId,string PaymentTypeId,string SCreditRating,string SRatingAgencies, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_SellBondStatus"),
                new SqlParameter("@SellBondId",SellBondId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@SCreditRating",SCreditRating),
                new SqlParameter("@SRatingAgencies",SRatingAgencies),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_SellBond]", CommandType.StoredProcedure, parameter);
    }

    public bool add_SellBond(string SellBondId, string CustomerId,string CategoryId, string SISINNumber, string SProductName, string SCouponRate, string SPutCallDate, string SMaturityDate,string PaymentTypeId, string SIPDate, string SPriceRate, string SYTCYieldSemi, string SYTM, string SFacevalueForBond,string DataStatus,string SCreditRating,string SRatingAgencies, string SProductImage, string SProductFile,string SCallDate,string SGuaranteedBy, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_SellBond"),
               new SqlParameter("@SellBondId",SellBondId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@SISINNumber",SISINNumber),
                new SqlParameter("@SProductName", SProductName),
                new SqlParameter("@SCouponRate",SCouponRate),
                new SqlParameter("@SPutCallDate",SPutCallDate),
                new SqlParameter("@SMaturityDate",SMaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@SIPDate",SIPDate),
                new SqlParameter("@SPriceRate",SPriceRate),
                new SqlParameter("@SYTCYieldSemi",SYTCYieldSemi),
                new SqlParameter("@SYTM",SYTM),
                new SqlParameter("@SFacevalueForBond",SFacevalueForBond),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@SCreditRating",SCreditRating),
                new SqlParameter("@SRatingAgencies",SRatingAgencies),
                new SqlParameter("@SProductImage",SProductImage),
                new SqlParameter("@SProductFile",SProductFile),
                new SqlParameter("@SCallDate",SCallDate),
                new SqlParameter("@SGuaranteedBy",SGuaranteedBy),
                new SqlParameter("@UserId",UserId),

            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_SellBond]", CommandType.StoredProcedure, parameter);
    }

    public bool update_SellBond(string SellBondId, string CustomerId,string CategoryId, string SISINNumber, string SProductName, string SCouponRate, string SPutCallDate, string SMaturityDate,string PaymentTypeId, string SIPDate, string SPriceRate, string SYTCYieldSemi, string SYTM, string SFacevalueForBond,string DataStatus,string SCreditRating,string SRatingAgencies, string SProductImage, string SProductFile, string SCallDate, string SGuaranteedBy, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_SellBond"),
               new SqlParameter("@SellBondId",SellBondId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@SISINNumber",SISINNumber),
                new SqlParameter("@SProductName", SProductName),
                new SqlParameter("@SCouponRate",SCouponRate),
                new SqlParameter("@SPutCallDate",SPutCallDate),
                new SqlParameter("@SMaturityDate",SMaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@SIPDate",SIPDate),
                new SqlParameter("@SPriceRate",SPriceRate),
                new SqlParameter("@SYTCYieldSemi",SYTCYieldSemi),
                new SqlParameter("@SYTM",SYTM),
                new SqlParameter("@SFacevalueForBond",SFacevalueForBond),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@SCreditRating",SCreditRating),
                new SqlParameter("@SRatingAgencies",SRatingAgencies),
                new SqlParameter("@SProductImage",SProductImage),
                new SqlParameter("@SProductFile",SProductFile),
                new SqlParameter("@SCallDate",SCallDate),
                new SqlParameter("@SGuaranteedBy",SGuaranteedBy),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_SellBond]", CommandType.StoredProcedure, parameter);
    }
    public bool update_SellBondStatus(string SellBondId)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
               new SqlParameter("@action", "update_SellBondStatus"),
               new SqlParameter("@SellBondId",SellBondId),
        };
       return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_SellBond]", CommandType.StoredProcedure, parameter);
    }

    public bool update_SellBondStatusReject(string SellBondId)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
               new SqlParameter("@action", "update_SellBondStatusReject"),
               new SqlParameter("@SellBondId",SellBondId),
        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_SellBond]", CommandType.StoredProcedure, parameter);
    }
    public bool update_SellBond_Active_Status(string SellBondId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_SellBond_Active_Status"),

                new SqlParameter("@SellBondId", SellBondId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_SellBond]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_SellBond(string SellBondId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_SellBond"),

                new SqlParameter("@SellBondId", SellBondId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_SellBond]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CashFlowChart

    public DataTable get_CashFlowChart(string CashFlowChartId,string ProductsId,string CustomerId,string PaymentTypeId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowChart"),
                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }
    public DataTable CheckLastDayOFMonth(string ProductsId)
    {

        SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@action", "CheckLastDayOFMonth"),
            new SqlParameter("@ProductsId",ProductsId),
            };

        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_QuarterlyDate(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_QuarterlyDate"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_HalfYearlyDate(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_HalfYearlyDate"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MonthlyDate(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MonthlyDate"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_YearlyDatess(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_YearlyDates"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_YearlyDate(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_YearlyDate"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastQuarterlyDate(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastQuarterlyDate"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_LastHalfYearlyDate(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastHalfYearlyDate"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastMonthlyDate(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastMonthlyDate"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_QuarterlyDateList(string Maturity, string IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_QuarterlyDateList"),
                new SqlParameter("@Maturity", Maturity),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_HalfYearlyDateList(string Maturity, string IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_HalfYearlyDateList"),
                new SqlParameter("@Maturity", Maturity),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MonthlyDateList(string Maturity, string IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MonthlyDateList"),
                new SqlParameter("@Maturity", Maturity),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_YearlyDateList(string Maturity, string IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_YearlyDateList"),
                new SqlParameter("@Maturity", Maturity),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastYearlyDateList(string Maturity, string IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastYearlyDateList"),
                new SqlParameter("@Maturity", Maturity),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }


    public DataTable get_LastQuarterlyDateList(string Maturity, string IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastQuarterlyDateList"),
                new SqlParameter("@Maturity", Maturity),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_LastHalfYearlyDateList(string Maturity, string IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastHalfYearlyDateList"),
                new SqlParameter("@Maturity", Maturity),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastMonthlyDateList(string Maturity, string IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastMonthlyDateList"),
                new SqlParameter("@Maturity", Maturity),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastDateMonthly(DateTime SattleDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastDateMonthly"),
                new SqlParameter("@SattleDate", SattleDate),
                
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastDateHalfYearly(DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastDateHalfYearly"),
                new SqlParameter("@IPDate", IPDate),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastDateQuarterly(DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastDateQuarterly"),
                new SqlParameter("@IPDate", IPDate),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_CashFlowChartActive(string CashFlowChartId, string ProductsId, string CustomerId, string PaymentTypeId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowChartActive"),
                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }


    public int add_CashFlowChart(string CashFlowChartId, string ProductsId, string CustomerId, string PaymentType,string FSattlementDate,string FFaceValueForDeal,string FQuantity,string FPrincipalAmount,string FTotalAssuredInterest,string FGrossConsideration, string UserId, string LastIPDate,string NumberBond)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CashFlowChart"),
                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@PaymentType",PaymentType),
                new SqlParameter("@FSattlementDate",FSattlementDate),
                new SqlParameter("@FFaceValueForDeal", FFaceValueForDeal),
                new SqlParameter("@FQuantity",FQuantity),
                new SqlParameter("@FPrincipalAmount",FPrincipalAmount),
                new SqlParameter("@FTotalAssuredInterest", FTotalAssuredInterest),
                new SqlParameter("@FGrossConsideration",FGrossConsideration),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@LastIPDate",LastIPDate),
                new SqlParameter("@NumberBond",NumberBond),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_CashFlowChart(string CashFlowChartId, string ProductsId, string CustomerId, string PaymentTypeId, string SattlementDate, string FFaceValueForDeal, string FQuantity, string FPrincipalAmount, string FTotalAssuredInterest, string FGrossConsideration, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CashFlowChart"),
                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@SattlementDate",SattlementDate),
                new SqlParameter("@FFaceValueForDeal", FFaceValueForDeal),
                new SqlParameter("@FQuantity",FQuantity),
                new SqlParameter("@FPrincipalAmount",FPrincipalAmount),
                new SqlParameter("@FTotalAssuredInterest", FTotalAssuredInterest),
                new SqlParameter("@FGrossConsideration",FGrossConsideration),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CashFlowChart_Active_Status(string CashFlowChartId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CashFlowChart_Active_Status"),

                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CashFlowChart(string CashFlowChartId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CashFlowChart"),

                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CashFlowChartDetails

    public DataTable get_CashFlowChartDetails(string CFlowChartDetailsId, string CashFlowChartId, string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowChartDetails"),
               new SqlParameter("@CFlowChartDetailsId", CFlowChartDetailsId),
                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChartDetails]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_CashFlowChartDetailsChart(string CFlowChartDetailsId, string CashFlowChartId, string CustomerId,string ProductsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowChartDetails"),
               new SqlParameter("@CFlowChartDetailsId", CFlowChartDetailsId),
                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChartDetails]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CashFlowChartDetailsActive(string CFlowChartDetailsId, string CashFlowChartId, string CustomerId ,string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowChartDetailsActive"),
               new SqlParameter("@CFlowChartDetailsId", CFlowChartDetailsId),
                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChartDetails]", CommandType.StoredProcedure, parameter);
    }


    public bool add_CashFlowChartDetails(string CFlowChartDetailsId, string CashFlowChartId,string MonthDayValue, string CustomerId, string InterestDate, string InterestValue, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CashFlowChartDetails"),
               new SqlParameter("@CFlowChartDetailsId", CFlowChartDetailsId),
                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@MonthDayValue",MonthDayValue),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@InterestDate", InterestDate),
                new SqlParameter("@InterestValue", InterestValue),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowChartDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CashFlowChartDetails(string CFlowChartDetailsId, string CashFlowChartId,string MonthDayValue, string CustomerId, string InterestDate, string InterestValue, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CashFlowChartDetails"),
               new SqlParameter("@CFlowChartDetailsId", CFlowChartDetailsId),
                new SqlParameter("@CashFlowChartId", CashFlowChartId),
                new SqlParameter("@MonthDayValue",MonthDayValue),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@InterestDate", InterestDate),
                new SqlParameter("@InterestValue", InterestValue),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowChartDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CashFlowChartDetails_Interest(string CFlowChartDetailsId,  string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CashFlowChartDetails_Interest"),
               new SqlParameter("@CFlowChartDetailsId", CFlowChartDetailsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowChartDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CashFlowChartDetails_Active_Status(string CFlowChartDetailsId,string CashFlowChartId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CashFlowChartDetails_Active_Status"),
                new SqlParameter("@CFlowChartDetailsId", CFlowChartDetailsId),
                new SqlParameter("@CashFlowChartId",CashFlowChartId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowChartDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CashFlowChartDetails(string CFlowChartDetailsId, string CashFlowChartId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CashFlowChartDetails"),

                new SqlParameter("@CFlowChartDetailsId", CFlowChartDetailsId),
                new SqlParameter("@CashFlowChartId",CashFlowChartId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowChartDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CashFlowView

    public DataTable get_CashFlowView(string CashFlowViewId,string CustomerId,string ProductsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowView"),
                new SqlParameter("@CashFlowViewId", CashFlowViewId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowView]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_CashFlowViewRM(string CashFlowViewId, string CustomerId, string ProductsId,string RMAssignId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowView"),
                new SqlParameter("@CashFlowViewId", CashFlowViewId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@RMAssignId",RMAssignId),
                new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowView]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CashFlowViewActive(string CashFlowViewId, string CustomerId, string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowViewActive"),
                new SqlParameter("@CashFlowViewId", CashFlowViewId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@ProductsId",ProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowView]", CommandType.StoredProcedure, parameter);
    }


    public bool add_CashFlowView(string CashFlowViewId, string CustomerId, string ProductsId,string PaymentType, string SattlementDate, string LastIpdate, string FaceValueForDeal,string TotalConsiderationAmount,string Quantity,string PrincipalAmount,string TotalAssuredInterest,string GrossConsideration,string PriceRate)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CashFlowView"),
                new SqlParameter("@CashFlowViewId", CashFlowViewId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@PaymentType",PaymentType),
                new SqlParameter("@SattlementDate", SattlementDate),
                new SqlParameter("@LastIpdate",LastIpdate),
                new SqlParameter("@FaceValueForDeal",FaceValueForDeal),
                new SqlParameter("@TotalConsiderationAmount",TotalConsiderationAmount),
                new SqlParameter("@Quantity",Quantity),
                new SqlParameter("@PrincipalAmount",PrincipalAmount),
                new SqlParameter("@TotalAssuredInterest",TotalAssuredInterest),
                new SqlParameter("@GrossConsideration",GrossConsideration),
                new SqlParameter("@PriceRate",PriceRate),

            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowView]", CommandType.StoredProcedure, parameter);
    }

    public int add_CashFlowViews(string CashFlowViewId, string CustomerId, string ProductsId, string PaymentType, string SattlementDate, string LastIpdate, string FaceValueForDeal, string TotalConsiderationAmount, string Quantity, string PrincipalAmount, string TotalAssuredInterest, string GrossConsideration, string PriceRate)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CashFlowView"),
                new SqlParameter("@CashFlowViewId", CashFlowViewId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@PaymentType",PaymentType),
                new SqlParameter("@SattlementDate", SattlementDate),
                new SqlParameter("@LastIpdate",LastIpdate),
                new SqlParameter("@FaceValueForDeal",FaceValueForDeal),
                new SqlParameter("@TotalConsiderationAmount",TotalConsiderationAmount),
                new SqlParameter("@Quantity",Quantity),
                new SqlParameter("@PrincipalAmount",PrincipalAmount),
                new SqlParameter("@TotalAssuredInterest",TotalAssuredInterest),
                new SqlParameter("@GrossConsideration",GrossConsideration),
                new SqlParameter("@PriceRate",PriceRate),
                new SqlParameter("@returnId",returnId),
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_CashFlowView]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_CashFlowView(string CashFlowViewId, string CustomerId, string ProductsId, string PaymentType, string SattlementDate, string LastIpdate, string FaceValueForDeal,string TotalConsiderationAmount, string Quatity, string PrincipalAmount, string TotalAssuredInterest, string GrossConsideration,string PriceRate ,string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CashFlowView"),
                new SqlParameter("@CashFlowViewId", CashFlowViewId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@PaymentType",PaymentType),
                new SqlParameter("@SattlementDate", SattlementDate),
                new SqlParameter("@LastIpdate",LastIpdate),
                new SqlParameter("@FaceValueForDeal",FaceValueForDeal),
                new SqlParameter("@TotalConsiderationAmount",TotalConsiderationAmount),
                new SqlParameter("@Quatity",Quatity),
                new SqlParameter("@PrincipalAmount",PrincipalAmount),
                new SqlParameter("@TotalAssuredInterest",TotalAssuredInterest),
                new SqlParameter("@GrossConsideration",GrossConsideration),
                new SqlParameter("@PriceRate",PriceRate),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowView]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CashFlowView_Active_Status(string CashFlowViewId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CashFlowView_Active_Status"),

                new SqlParameter("@CashFlowViewId", CashFlowViewId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowView]", CommandType.StoredProcedure, parameter);
    }
    public bool CashFlowViewStatus(string CashFlowViewId, string UpdateId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "CashFlowViewStatus"),

                new SqlParameter("@CashFlowViewId", CashFlowViewId),
                new SqlParameter("@UpdateId",UpdateId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowView]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CashFlowView(string CashFlowViewId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CashFlowView"),

                new SqlParameter("@CashFlowViewId", CashFlowViewId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowView]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CloseDeal

    public DataTable get_CloseDeal(string CloseDealId, string ProductsId, string CustomerId,string CashFlowViewId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CloseDeal"),
                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@CashFlowViewId",CashFlowViewId),
                new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CloseDealCumulative(string CloseDealId, string ProductsId, string CustomerId, string CashFlowViewId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CloseDealCumulative"),
                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@CashFlowViewId",CashFlowViewId),
                new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }
    public DataTable CheckLastDayOFMonths(string ProductsId)
    {
        
        SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@action", "CheckLastDayOFMonths"),
            new SqlParameter("@ProductsId",ProductsId),
            };

        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_QuarterlyDates(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_QuarterlyDates"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_HalfYearlyDates(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_HalfYearlyDates"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MonthlyDates(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MonthlyDates"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_YearlyDates(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_YearlyDates"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_YearlyDatesss(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_YearlyDates"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowChart]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastQuarterlyDates(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastQuarterlyDates"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_LastHalfYearlyDates(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastHalfYearlyDates"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastMonthlyDates(DateTime SattleDate, DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastMonthlyDates"),
                new SqlParameter("@SattleDate", SattleDate),
                new SqlParameter("@IPDate",IPDate),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastDateMonthlys(DateTime SattleDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastDateMonthlys"),
                new SqlParameter("@SattleDate", SattleDate),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastDateHalfYearlys(DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastDateHalfYearlys"),
                new SqlParameter("@IPDate", IPDate),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_LastDateQuarterlys(DateTime IPDate)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_LastDateQuarterlys"),
                new SqlParameter("@IPDate", IPDate),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_CloseDealActive(string CloseDealId, string ProductsId, string CustomerId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CloseDealActive"),
                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }


    public int add_CloseDeal(string CloseDealId, string ProductsId, string CustomerId,string CashFlowViewId, string DFrequencyType, string DSattlementDate, string DFaceValueForDeal, string DQuantity, string DPrincipalAmount, string DTotalAssuredInterest, string DGrossConsideration, string UserId, string DLastIPDate,string DTotalConsiderationAmount)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@action", "add_CloseDeal"),
                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@CashFlowViewId",CashFlowViewId),
                new SqlParameter("@DFrequencyType",DFrequencyType),
                new SqlParameter("@DSattlementDate",DSattlementDate),
                new SqlParameter("@DFaceValueForDeal", DFaceValueForDeal),
                new SqlParameter("@DQuantity",DQuantity),
                new SqlParameter("@DPrincipalAmount",DPrincipalAmount),
                new SqlParameter("@DTotalAssuredInterest", DTotalAssuredInterest),
                new SqlParameter("@DGrossConsideration",DGrossConsideration),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@DLastIPDate",DLastIPDate),
                new SqlParameter("@DTotalConsiderationAmount",DTotalConsiderationAmount),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_CloseDeal(string CloseDealId, string ProductsId, string CustomerId,string CashFlowViewId, string DFrequencyType, string DSattlementDate, string DFaceValueForDeal, string DQuantity, string DPrincipalAmount, string DTotalAssuredInterest, string DGrossConsideration,string TotalConsiderationAmount, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CloseDeal"),
                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@CashFlowViewId",CashFlowViewId),
                new SqlParameter("@DFrequencyType",DFrequencyType),
                new SqlParameter("@DSattlementDate",DSattlementDate),
                new SqlParameter("@DFaceValueForDeal", DFaceValueForDeal),
                new SqlParameter("@DQuantity",DQuantity),
                new SqlParameter("@DPrincipalAmount",DPrincipalAmount),
                new SqlParameter("@DTotalAssuredInterest", DTotalAssuredInterest),
                new SqlParameter("@DGrossConsideration",DGrossConsideration),
                new SqlParameter("@TotalConsiderationAmount",TotalConsiderationAmount),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CloseDeal_Active_Status(string CloseDealId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CloseDeal_Active_Status"),

                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CloseDeal(string CloseDealId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CloseDeal"),

                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CloseDeal]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CloseDealInterestDetails

    public DataTable get_CloseDealInterestDetails(string CloseDealInterestId, string CloseDealId, string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CloseDealInterestDetails"),
               new SqlParameter("@CloseDealInterestId", CloseDealInterestId),
                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDealInterestDetails]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_CloseDealInterestDetailsActive(string CloseDealInterestId, string CloseDealId, string CustomerId, string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CloseDealInterestDetailsActive"),
               new SqlParameter("@CloseDealInterestId", CloseDealInterestId),
                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CloseDealInterestDetails]", CommandType.StoredProcedure, parameter);
    }



    public bool add_CloseDealInterestDetails(string CloseDealInterestId, string CloseDealId, string CMonthDayValue, string CustomerId, string CInterestDate, string CInterestValue, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CloseDealInterestDetails"),
               new SqlParameter("@CloseDealInterestId", CloseDealInterestId),
                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@CMonthDayValue",CMonthDayValue),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@CInterestDate", CInterestDate),
                new SqlParameter("@CInterestValue", CInterestValue),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CloseDealInterestDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CloseDealInterestDetails(string CloseDealInterestId, string CloseDealId, string CMonthDayValue, string CustomerId, string CInterestDate, string CInterestValue, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CloseDealInterestDetails"),
                new SqlParameter("@CloseDealInterestId", CloseDealInterestId),
                new SqlParameter("@CloseDealId", CloseDealId),
                new SqlParameter("@CMonthDayValue",CMonthDayValue),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@CInterestDate", CInterestDate),
                new SqlParameter("@CInterestValue", CInterestValue),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CloseDealInterestDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CloseDealInterestDetails_Interest(string CloseDealInterestId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CloseDealInterestDetails_Interest"),
               new SqlParameter("@CloseDealInterestId", CloseDealInterestId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CloseDealInterestDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CloseDealInterestDetails_Active_Status(string CloseDealInterestId, string CloseDealId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CloseDealInterestDetails_Active_Status"),
                new SqlParameter("@CloseDealInterestId", CloseDealInterestId),
                new SqlParameter("@CloseDealId",CloseDealId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CloseDealInterestDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CloseDealInterestDetails(string CloseDealInterestId, string CloseDealId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CloseDealInterestDetails"),

                new SqlParameter("@CloseDealInterestId", CloseDealInterestId),
                new SqlParameter("@CloseDealId",CloseDealId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CloseDealInterestDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CashFlow

    public DataTable get_CashFlow(string CashFlowId, string CustomerId, string ProductsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlow"),
                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@IsActive",IsActive)
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlow]", CommandType.StoredProcedure, parameter);
    }


    public DataTable get_CashFlowActive(string CashFlowId, string CustomerId, string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowActive"),
                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@ProductsId",ProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlow]", CommandType.StoredProcedure, parameter);
    }


    public bool add_CashFlow(string CashFlowId, string CustomerId, string ProductsId, string HPaymentType, string HFaceValueForDeal)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CashFlow"),
                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@HPaymentType",HPaymentType),
                new SqlParameter("@HFaceValueForDeal",HFaceValueForDeal),

            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlow]", CommandType.StoredProcedure, parameter);
    }
    public int add_CashFlows(string CashFlowId, string CustomerId, string ProductsId, string HPaymentType, string HFaceValueForDeal)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CashFlow"),
                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@HPaymentType",HPaymentType),
                new SqlParameter("@HFaceValueForDeal",HFaceValueForDeal),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_CashFlow]", CommandType.StoredProcedure, param, param.Length - 1);
    }
    public bool update_CashFlow_Active_Status(string CashFlowId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CashFlow_Active_Status"),

                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlow]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CashFlow(string CashFlowId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CashFlow"),

                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlow]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_CashFlowViewDetails

    public DataTable get_CashFlowViewDetails(string CashFlowViewDetailsId, string CashFlowId, string CustomerId,string ProductsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowViewDetails"),
               new SqlParameter("@CashFlowViewDetailsId", CashFlowViewDetailsId),
                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@IsActive",IsActive)

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowViewDetails]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_CashFlowViewDetailsChart(string CashFlowViewDetailsId, string CashFlowId, string CustomerId, string ProductsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowViewDetailsChart"),
               new SqlParameter("@CashFlowViewDetailsId", CashFlowViewDetailsId),
                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowViewDetails]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_CashFlowViewDetailsActive(string CashFlowViewDetailsId, string CashFlowId, string CustomerId, string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_CashFlowViewDetailsActive"),
               new SqlParameter("@CashFlowViewDetailsId", CashFlowViewDetailsId),
                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_CashFlowViewDetails]", CommandType.StoredProcedure, parameter);
    }


    public bool add_CashFlowViewDetails(string CashFlowViewDetailsId, string CashFlowId, string HMonthDayValue, string CustomerId,string ProductsId, string HInterestDate, string HInterestValue, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_CashFlowViewDetails"),
               new SqlParameter("@CashFlowViewDetailsId", CashFlowViewDetailsId),
                new SqlParameter("@CashFlowId", CashFlowId),
                new SqlParameter("@HMonthDayValue",HMonthDayValue),
                new SqlParameter("@CustomerId", CustomerId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@HInterestDate", HInterestDate),
                new SqlParameter("@HInterestValue", HInterestValue),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowViewDetails]", CommandType.StoredProcedure, parameter);
    }


    public bool update_CashFlowViewDetails_Interest(string CashFlowViewDetailsId, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_CashFlowViewDetails_Interest"),
               new SqlParameter("@CashFlowViewDetailsId", CashFlowViewDetailsId),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowViewDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool update_CashFlowViewDetails_Active_Status(string CashFlowViewDetailsId, string CashFlowId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_CashFlowViewDetails_Active_Status"),
                new SqlParameter("@CashFlowViewDetailsId", CashFlowViewDetailsId),
                new SqlParameter("@CashFlowId",CashFlowId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowViewDetails]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_CashFlowViewDetails(string CashFlowViewDetailsId, string CashFlowId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_CashFlowViewDetails"),

                new SqlParameter("@CashFlowViewDetailsId", CashFlowViewDetailsId),
                new SqlParameter("@CashFlowId",CashFlowId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_CashFlowViewDetails]", CommandType.StoredProcedure, parameter);
    }

    #endregion


    // Maturity Type Staggered 

    #region usp_MaturityTypeProducts

    public DataTable get_MaturityTypeProducts(string MProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProducts"),
                new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable MCheckLastDayOFMonth(string MProductsId)
    {

        SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@action", "MCheckLastDayOFMonth"),
            new SqlParameter("@MProductsId",MProductsId),
            };

        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable CheckInputDateEOM(string IPDate)
    {

        SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@action", "CheckInputDateEOM"),
            new SqlParameter("@IPDate",IPDate),
            };

        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_MaturityTypeProductsSearch(string MProductsId, string CategoryId, string UserId, string ISINNumber, string ProductName, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsSearch"),
                new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName",ProductName),
                new SqlParameter("@IsActive",IsActive)

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable CheckInputDatas(string ISINNumber)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "CheckInputData"),
                new SqlParameter("@ISINNumber",ISINNumber),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsIn(string MProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsIn"),
                new SqlParameter("@ProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsFilter(string MProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsFilter"),
                new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_MaturityTypeProductsTop(string MProductsId, string CategoryId, string UserId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsTop"),
                new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@UserId",UserId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsPriceHigh(string MProductsId, string CategoryId, string CreditRatingId, string Price, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsPriceHigh"),
                new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@Price",Price),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsPriceLow(string MProductsId, string CategoryId, string CreditRatingId, string Price, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsPriceLow"),
                new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@Price",Price),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsYieldHigh(string MProductsId, string CategoryId, string CreditRatingId, string YTM, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsYieldHigh"),
                new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@YTM",YTM),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsYieldLow(string MProductsId, string CategoryId, string CreditRatingId, string YTM, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsYieldLow"),
                new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@CreditRatingId",CreditRatingId),
                new SqlParameter("@YTM",YTM),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsActive(string MProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsActive"),
                new SqlParameter("@MProductsId", MProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsYieldBt(string MProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsYieldBt"),
                new SqlParameter("@MProductsId", MProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsYieldUpper(string MProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsYieldUpper"),
                new SqlParameter("@MProductsId", MProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeProductsInvLower(string MProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsInvLower"),
                new SqlParameter("@MProductsId", MProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_MaturityTypeProductsInvBt(string MProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsInvBt"),
                new SqlParameter("@MProductsId", MProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_MaturityTypeProductsInvUpper(string MProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeProductsInvUpper"),
                new SqlParameter("@MProductsId", MProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }


    public int add_MaturityTypeProducts(string MProductsId, string CategoryId, string ISINNumber, string ProductName, string Security, string CouponRate, string DataStatus, string PutCallDate, string MaturityDate, string PaymentTypeId, string IPDate, string Price, string YTCYieldSemi, string YTM, string FacevalueForBond, string ProductImage, string ProductFile,string MaturityType,string DateCount,string CallDate, string GuaranteedBy, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_MaturityTypeProducts"),
               new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@Security",Security),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@ProductFile",ProductFile),
                new SqlParameter("@MaturityType",MaturityType),
                new SqlParameter("@DateCount",DateCount),
                new SqlParameter("@CallDate",CallDate),
                new SqlParameter("@GuaranteedBy",GuaranteedBy),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId)
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_MaturityTypeProducts(string MProductsId, string CategoryId, string ISINNumber, string ProductName, string Security, string CouponRate, string DataStatus, string PutCallDate, string MaturityDate, string PaymentTypeId, string IPDate, string Price, string YTCYieldSemi, string YTM, string FacevalueForBond, string ProductImage, string ProductFile,string MaturityType,string DateCount,string CallDate,string GuaranteedBy, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_MaturityTypeProducts"),
               new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@Security",Security),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@PaymentTypeId",PaymentTypeId),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@ProductFile",ProductFile),
                new SqlParameter("@MaturityType",MaturityType),
                new SqlParameter("@DateCount",DateCount),
                new SqlParameter("@CallDate",CallDate),
                new SqlParameter("@GuaranteedBy",GuaranteedBy),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public bool Add_MaturityTypeProductsSell(string MProductsId, string CategoryId, string ISINNumber, string ProductName, string Security, string CouponRate, string DataStatus, string PutCallDate, string MaturityDate, string IPDate, string Price, string YTCYieldSemi, string YTM, string FacevalueForBond, string ProductImage, string ProductFile,string MaturityType,string DateCount, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_MaturityTypeProducts"),
               new SqlParameter("@MProductsId",MProductsId),
                new SqlParameter("@CategoryId", CategoryId),
                new SqlParameter("@ISINNumber",ISINNumber),
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@Security",Security),
                new SqlParameter("@CouponRate",CouponRate),
                new SqlParameter("@DataStatus",DataStatus),
                new SqlParameter("@PutCallDate",PutCallDate),
                new SqlParameter("@MaturityDate",MaturityDate),
                new SqlParameter("@IPDate",IPDate),
                new SqlParameter("@Price",Price),
                new SqlParameter("@YTCYieldSemi",YTCYieldSemi),
                new SqlParameter("@YTM",YTM),
                new SqlParameter("@FacevalueForBond",FacevalueForBond),
                new SqlParameter("@ProductImage",ProductImage),
                new SqlParameter("@ProductFile",ProductFile),
                new SqlParameter("@MaturityType",MaturityDate),
                new SqlParameter("@DateCount",DateCount),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public bool update_MaturityTypeProducts_Active_Status(string MProductsId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_MaturityTypeProducts_Active_Status"),

                new SqlParameter("@MProductId", MProductsId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_MaturityTypeProducts(string MProductsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_MaturityTypeProducts"),

                new SqlParameter("@MProductsId", MProductsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_MaturityTypeProducts]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_MaturityTypeValue

    public DataTable get_MaturityTypeValue(string MaturityTypeValueId,string ProductsId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeValue"),
                new SqlParameter("@MaturityTypeValueId", MaturityTypeValueId),
                new SqlParameter("@ProductsId",ProductsId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeValue]", CommandType.StoredProcedure, parameter);
    }

    public DataTable get_MaturityTypeValueActive(string MaturityTypeValueId,string ProductsId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_MaturityTypeValueActive"),
                new SqlParameter("@MaturityTypeValueId", MaturityTypeValueId),
                new SqlParameter("@ProductsId",ProductsId),

            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeValue]", CommandType.StoredProcedure, parameter);
    }


    public bool add_MaturityTypeValue(string MaturityTypeValueId,string ProductsId, string MaturityTypeDateValue,string MaturityTypePercentage,string MaturityTypeRemark, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_MaturityTypeValue"),
                new SqlParameter("@MaturityTypeValueId", MaturityTypeValueId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@MaturityTypeDateValue", MaturityTypeDateValue),
                new SqlParameter("@MaturityTypePercentage",MaturityTypePercentage),
                new SqlParameter("@MaturityTypeRemark",MaturityTypeRemark),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_MaturityTypeValue]", CommandType.StoredProcedure, parameter);
    }

    public int add_MaturityTypeValueStaggered(string MaturityTypeValueId, string ProductsId, string MaturityTypeDateValue, string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_MaturityTypeValueStaggered"),
                new SqlParameter("@MaturityTypeValueId", MaturityTypeValueId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@MaturityTypeDateValue", MaturityTypeDateValue),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@returnId",returnId),
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_MaturityTypeValue]", CommandType.StoredProcedure, param, param.Length - 1);
      
    }

    public bool update_MaturityTypeValuePercentage(string MaturityTypeValueId,string MaturityTypePercentage, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_MaturityTypeValuePercentage"),
                new SqlParameter("@MaturityTypeValueId", MaturityTypeValueId),
                new SqlParameter("@MaturityTypePercentage", MaturityTypePercentage),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_MaturityTypeValue]", CommandType.StoredProcedure, parameter);
    }

    public bool update_MaturityTypeValue(string MaturityTypeValueId,string ProductsId, string MaturityTypeDateValue, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_MaturityTypeValue"),
                new SqlParameter("@MaturityTypeValueId", MaturityTypeValueId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@MaturityTypeDateValue", MaturityTypeDateValue),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_MaturityTypeValue]", CommandType.StoredProcedure, parameter);
    }

    public DataTable CheckMaturityTypeValue(string ProductsId, string MaturityTypeDateValue)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "CheckMaturityTypeValue"),
               new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@MaturityTypeDateValue", MaturityTypeDateValue),
              
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_MaturityTypeValue]", CommandType.StoredProcedure, parameter);
    }


    public bool update_MaturityTypeValue_Active_Status(string MaturityTypeValueId,string ProductsId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_MaturityTypeValue_Active_Status"),

                new SqlParameter("@MaturityTypeValueId", MaturityTypeValueId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_MaturityTypeValue]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_MaturityTypeValue(string MaturityTypeValueId,string ProductsId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_MaturityTypeValue"),

                new SqlParameter("@MaturityTypeValueId", MaturityTypeValueId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_MaturityTypeValue]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_HProductImage

    public DataTable get_HProductImage(string HProductImageId,string ProductName,string CategoryId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_HProductImage"),
                new SqlParameter("@HProductImageId", HProductImageId),
                new SqlParameter("@ProductName",ProductName),
                new SqlParameter("@CategoryId",CategoryId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_HProductImage]", CommandType.StoredProcedure, parameter);
    }
    public DataTable get_ProductsImageName(string CategoryId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_ProductsImageName"),
                new SqlParameter("@CategoryId",CategoryId),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Products]", CommandType.StoredProcedure, parameter);
    }

    public bool add_HProductImage(string HProductImageId, string ProductName, string CategoryId, string HProductImagePath, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_HProductImage"),
                new SqlParameter("@HProductImageId", HProductImageId),
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@HProductImagePath",HProductImagePath),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_HProductImage]", CommandType.StoredProcedure, parameter);
    }

    public bool update_HProductImage(string HProductImageId, string ProductName, string CategoryId, string HProductImagePath, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_Category"),
                new SqlParameter("@HProductImageId", HProductImageId),
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@CategoryId",CategoryId),
                new SqlParameter("@HProductImagePath",HProductImagePath),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_HProductImage]", CommandType.StoredProcedure, parameter);
    }

    public bool update_HProductImage_Active_Status(string HProductImageId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_HProductImage_Active_Status"),

                new SqlParameter("@HProductImageId", HProductImageId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_HProductImage]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_HProductImage(string HProductImageId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_HProductImage"),

                new SqlParameter("@HProductImageId", HProductImageId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_HProductImage]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region LeadForm


    //Panel Users

    public DataTable getLeadForm(string LeadFormId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "getLeadForm"),
               new SqlParameter("@LeadFormId", LeadFormId),

               new SqlParameter("@IsActive", IsActive),
            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_LeadForm]", CommandType.StoredProcedure, parameter);
    }

    

    public bool AddLeadForm(string LeadFormId, string FirstName, string LastName, string Email, string Mobile, string Message)
    {

        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action","AddLeadForm"),
             new SqlParameter("@LeadFormId",LeadFormId),
             new SqlParameter("@FirstName",FirstName),
             new SqlParameter("@LastName",LastName),
              new SqlParameter("@Email",Email),

            new SqlParameter("@Mobile",Mobile),
             new SqlParameter("@Message",Message),

        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_LeadForm]", CommandType.StoredProcedure, parameter);

    }


    public bool UpdateLeadForm(string LeadFormId, string FirstName, string LastName, string Email, string Mobile, string Message)
    {
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@action","UpdateLeadFormDetails"),
             new SqlParameter("@LeadFormId",LeadFormId),
             new SqlParameter("@FirstName",FirstName),
             new SqlParameter("@LastName",LastName),
              new SqlParameter("@Email",Email),

            new SqlParameter("@Mobile",Mobile),
             new SqlParameter("@Message",Message),

        };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_LeadForm]", CommandType.StoredProcedure, parameter);

    }
    public bool updateLeadFormActiveStatus(bool IsActive, string LeadFormId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "updateLeadFormActiveStatus"),
                new SqlParameter("@IsActive", IsActive),

                new SqlParameter("@LeadFormId", LeadFormId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_LeadForm]", CommandType.StoredProcedure, parameter);
    }

    public bool deleteLeadForm(string LeadFormId,string EntryUserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "deleteLeadForm"),

                new SqlParameter("@LeadFormId", LeadFormId),
                new SqlParameter("@EntryUserId",EntryUserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_LeadForm]", CommandType.StoredProcedure, parameter);
    }
    #endregion


    #region usp_Investment

    public DataTable get_Investment(string InvestmentId, string ProductsId, string CustomerId,string RMAssignId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_Investment"),
                new SqlParameter("@InvestmentId", InvestmentId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@RMAssignId",RMAssignId),
                new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_Investment]", CommandType.StoredProcedure, parameter);
    }



    public bool add_Investment(string InvestmentId, string ProductsId, string CustomerId,string CustomerMobile,string SecurityName,string InvestmentType, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_Investment"),
                new SqlParameter("@InvestmentId", InvestmentId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@CustomerMobile",CustomerMobile),
                new SqlParameter("@SecurityName",SecurityName),
                new SqlParameter("@InvestmentType",InvestmentType),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Investment]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Investment(string InvestmentId, string ProductsId, string CustomerId, string CustomerMobile, string SecurityName, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_Investment"),
                new SqlParameter("@InvestmentId", InvestmentId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                new SqlParameter("@CustomerMobile",CustomerMobile),
                new SqlParameter("@SecurityName",SecurityName),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Investment]", CommandType.StoredProcedure, parameter);
    }

    public bool update_Investment_Active_Status(string InvestmentId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_Investment_Active_Status"),

                new SqlParameter("@InvestmentId", InvestmentId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Investment]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_Investment(string InvestmentId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_Investment"),

                new SqlParameter("@InvestmentId", InvestmentId),
               
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_Investment]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    #region usp_SearchProduct

    public DataTable get_SearchProduct(string SearchProductId,string ProductsId,string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_SearchProduct"),
                new SqlParameter("@SearchProductId", SearchProductId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_SearchProduct]", CommandType.StoredProcedure, parameter);
    }

    public bool add_SearchProduct(string SearchProductId, string ProductsId, string CustomerId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_SearchProduct"),
                new SqlParameter("@SearchProductId", SearchProductId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@CustomerId",CustomerId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_SearchProduct]", CommandType.StoredProcedure, parameter);
    }


    public bool update_SearchProduct_Active_Status(string SearchProductId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_SearchProduct_Active_Status"),

                new SqlParameter("@SearchProductId", SearchProductId),
                new SqlParameter("@IsActive",IsActive),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_SearchProduct]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_SearchProduct(string SearchProductId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_SearchProduct"),

                new SqlParameter("@SearchProductId", SearchProductId),
              
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_SearchProduct]", CommandType.StoredProcedure, parameter);
    }

    #endregion

    // Deal Confirmation

    #region usp_DealConfirmation

    public DataTable get_DealConfirmation(string DealConfirmationId,string ProductsId,string CustomerId, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_DealConfirmation"),
                new SqlParameter("@DealConfirmationId", DealConfirmationId),
                new SqlParameter("@ProductsId",ProductsId),
                new SqlParameter("@UserId",CustomerId),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_DealConfirmation]", CommandType.StoredProcedure, parameter);
    }

    public int add_DealConfirmation(string DealConfirmationId, string ProductsId, string DRate, string DDealDate, string DSattlementDate, string DNoOfDays, string DQuantity, string DPrincipalAmount, string DAccuredInterest, string DStampDuty, string DConsiderationStamp, string DDealValue,string DLastIPDate,string DGrossConsideration,  string UserId)
    {
        int returnId = 0;
        SqlParameter[] param = new SqlParameter[]
            {
               new SqlParameter("@action", "add_DealConfirmation"),
                new SqlParameter("@DealConfirmationId", DealConfirmationId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@DRate",DRate),
                new SqlParameter("@DDealDate",DDealDate),
                new SqlParameter("@DSattlementDate",DSattlementDate),
                new SqlParameter("@DNoOfDays",DNoOfDays),
                new SqlParameter("@DQuantity",DQuantity),
                new SqlParameter("@DPrincipalAmount",DPrincipalAmount),
                new SqlParameter("@DAccuredInterest",DAccuredInterest),
                new SqlParameter("@DStampDuty",DStampDuty),
                new SqlParameter("@DConsiderationStamp",DConsiderationStamp),
                new SqlParameter("@DDealValue",DDealValue),
                new SqlParameter("@UserId",UserId),
                new SqlParameter("@DLastIPDate",DLastIPDate),
                new SqlParameter("@DGrossConsideration",DGrossConsideration),
                new SqlParameter("@returnId",returnId),
            };
        return SqlDBHelper.ExecuteNonQueryParamIntTemp("[dbo].[usp_DealConfirmation]", CommandType.StoredProcedure, param, param.Length - 1);
    }

    public bool update_DealConfirmation(string DealConfirmationId, string ProductsId, string DRate, string DDealDate, string DSattlementDate, string DNoOfDays, string DQuantity, string DPrincipalAmount, string DAccuredInterest, string DStampDuty, string DConsiderationStamp, string DDealValue,string DLastIPDate,string DGrossConsideration, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_DealConfirmation"),
               new SqlParameter("@DealConfirmationId", DealConfirmationId),
                new SqlParameter("@ProductsId", ProductsId),
                new SqlParameter("@DRate",DRate),
                new SqlParameter("@DDealDate",DDealDate),
                new SqlParameter("@DSattlementDate",DSattlementDate),
                new SqlParameter("@DNoOfDays",DNoOfDays),
                new SqlParameter("@DQuantity",DQuantity),
                new SqlParameter("@DPrincipalAmount",DPrincipalAmount),
                new SqlParameter("@DAccuredInterest",DAccuredInterest),
                new SqlParameter("@DStampDuty",DStampDuty),
                new SqlParameter("@DConsiderationStamp",DConsiderationStamp),
                new SqlParameter("@DDealValue",DDealValue),
                new SqlParameter("@DLastIPDate",DLastIPDate),
                new SqlParameter("@DGrossConsideration",DGrossConsideration),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_DealConfirmation]", CommandType.StoredProcedure, parameter);
    }

    public bool update_DealConfirmation_Active_Status(string DealConfirmationId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_DealConfirmation_Active_Status"),

                new SqlParameter("@DealConfirmationId", DealConfirmationId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_DealConfirmation]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_DealConfirmation(string DealConfirmationId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_DealConfirmation"),

                new SqlParameter("@DealConfirmationId", DealConfirmationId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_DealConfirmation]", CommandType.StoredProcedure, parameter);
    }

    #endregion


    #region usp_PANKRA

    public DataTable get_PANKRA(string PANKRAId,string UserId,string PanNumber, bool? IsActive)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "get_PANKRA"),
                new SqlParameter("@PANKRAId", PANKRAId),
                new SqlParameter("@UserId", UserId),
                new SqlParameter("@PanNumber", PanNumber),
                  new SqlParameter("@IsActive",IsActive)


            };
        return SqlDBHelper.ExecuteParamerizedSelectCommand("[dbo].[usp_PANKRA]", CommandType.StoredProcedure, parameter);
    }

    public bool add_PANKRA(string PANKRAId, string AccessToken,string TokenType,string ExpiryDate,string Code,string TransactionId,string SubCode,string PanNumber,string Pan_Kra_Status,string Pan_Kra_Status_Description,string Kra_Status,string Pan_Kra_Agency,string Details,string TimeStamp, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "add_PANKRA"),
                new SqlParameter("@PANKRAId", PANKRAId),
                new SqlParameter("@AccessToken", AccessToken),
                new SqlParameter("@TokenType", TokenType),
                new SqlParameter("@ExpiryDate", ExpiryDate),
                new SqlParameter("@Code", Code),
                new SqlParameter("@TransactionId", TransactionId),
                new SqlParameter("@SubCode", SubCode),
                new SqlParameter("@PanNumber", PanNumber),
                new SqlParameter("@Pan_Kra_Status", Pan_Kra_Status),
                new SqlParameter("@Pan_Kra_Status_Description", Pan_Kra_Status_Description),
                new SqlParameter("@Kra_Status", Kra_Status),
                new SqlParameter("@Pan_Kra_Agency", Pan_Kra_Agency),
                new SqlParameter("@Details", Details),
                new SqlParameter("@TimeStamp", TimeStamp),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PANKRA]", CommandType.StoredProcedure, parameter);
    }

    public bool update_PANKRA(string PANKRAId, string PanNumber, string UserId)
    {

        SqlParameter[] parameter = new SqlParameter[]
            {
               new SqlParameter("@action", "update_PANKRA"),
                new SqlParameter("@PANKRAId", PANKRAId),
                new SqlParameter("@PanNumber", PanNumber),
                new SqlParameter("@UserId",UserId),
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PANKRA]", CommandType.StoredProcedure, parameter);
    }

    public bool update_PANKRA_Active_Status(string PANKRAId, bool? IsActive, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "update_PANKRA_Active_Status"),

                new SqlParameter("@PANKRAId", PANKRAId),
                new SqlParameter("@IsActive",IsActive),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PANKRA]", CommandType.StoredProcedure, parameter);
    }

    public bool delete_PANKRA(string PANKRAId, string UserId)
    {
        SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action", "delete_PANKRA"),

                new SqlParameter("@PANKRAId", PANKRAId),
                new SqlParameter("@UserId",UserId)
            };
        return SqlDBHelper.ExecuteNonQuery("[dbo].[usp_PANKRA]", CommandType.StoredProcedure, parameter);
    }

    #endregion
}







