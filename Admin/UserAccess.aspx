<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="UserAccess.aspx.cs" Inherits="Admin_UserAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        tr.bg-primary {
    background-color: lightgray !IMPORTANT;
}
        a#ContentPlaceHolder1_lnkCheckAll {
    margin-top: 20px;
}
        a#ContentPlaceHolder1_lnkUnCheckAll {
    margin-top: 20px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
    <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">USER ACCESS</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">USER ACCESS</a></li>
                                        <li class="breadcrumb-item active">USER ACCESS</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-12">
                            <div class="card">


                                <div class="card-body">
                                    <div class="live-preview">
                                <div class="row">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                     <label class="form-label">User Role</label>
                                                <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control chosen" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlUser_SelectedIndexChanged">
                                                </asp:DropDownList>
                                               
                                            </div>
                                        </div></div>
                                  
                                   <div class="col-sm-2">
                                       <label class="form-label"></label>
                                        <asp:LinkButton ID="lnkCheckAll" runat="server" CssClass="btn btn-success bth" OnClick="lnkCheckAll_Click">
                                            <i class="material-icons">check_circle_outline</i>CHECK ALL</asp:LinkButton>
                                    </div>
                                   <div class="col-sm-2">
                                       <label class="form-label"></label>
                                        <asp:LinkButton ID="lnkUnCheckAll" runat="server" CssClass="btn btn-danger bth" OnClick="lnkUnCheckAll_Click">
                                            <i class="material-icons">highlight_off</i>UN-CHECK ALL</asp:LinkButton>
                                    </div>

                     </div>  
                                        </div>
                                    </div>
                                <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="card table-permission table-responsive">
                         
 <asp:Repeater ID="rptMainMenu" runat="server" OnItemDataBound="rptMainMenu_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table table-hover text-nowrap">
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>

                                    <tr class="bg-primary">
                                        <th>
                                            <i class="<%#Eval("MainMenuIconHtml")%>"></i></th>
                                        <th style="text-align: -webkit-auto;" colspan="4">
                                           <%#Eval("MainMenuHead")%></th>
                                        <th>
                                     <asp:HiddenField ID="hfMainMenuId" runat="server" Value='<%#Eval("MainMenuId")%>' />
                        <asp:CheckBox ID="chkCanAccessMainMenu" runat="server" Checked='<%#Eval("CanAccess")%>' ToolTip='<%#Eval("MainMenuId")%>'
                                                OnCheckedChanged="chkCanAccessMainMenu_CheckedChanged" Text="Access" AutoPostBack="true" />
                                        </th>
                                    </tr>
                                                                        <asp:Repeater ID="rptSubMenu" runat="server" OnItemDataBound="rptSubMenu_ItemDataBound" >
                                        <ItemTemplate>
                                            <tr>
                                                <td></td>
                                                <td style="text-align: -webkit-auto;">
                                                     <%#Eval("SubMenuTitle")%></td>
                                                <td>
                                                    <asp:CheckBox ID="chkCanAccessSubMenu" runat="server" Checked='<%#Eval("CanAccess")%>' ToolTip='<%#Eval("SubMenuId")%>'
                                                        OnCheckedChanged="chkCanAccessSubMenu_CheckedChanged" Text="Access" AutoPostBack="true" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="canAdd" runat="server" Checked='<%#Eval("CanAdd")%>' ToolTip='<%#Eval("SubMenuId")%>'
                                                        Text="Add" OnCheckedChanged="canAdd_CheckedChanged" AutoPostBack="true" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="canUpdate" runat="server" Checked='<%#Eval("CanUpdate")%>' ToolTip='<%#Eval("SubMenuId")%>'
                                                        Text="Update" OnCheckedChanged="canUpdate_CheckedChanged" AutoPostBack="true" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="canDelete" runat="server" Checked='<%#Eval("CanDelete")%>' ToolTip='<%#Eval("SubMenuId")%>'
                                                        Text="Delete" OnCheckedChanged="canDelete_CheckedChanged" AutoPostBack="true" />
                                                </td>

                                            </tr>
                                            <asp:HiddenField ID ="hfSubMenuId" runat="server" Value='<%#Eval("SubMenuId") %>' />
                                            <asp:Repeater ID="rptChildSubMenu" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                <td></td>
                                                <td style="text-align: -webkit-auto;">
                                                     <%#Eval("ChildSubMenuTitle")%></td>
                                                <td>
                                                    <asp:CheckBox ID="chkCanAccessSubMenu1" runat="server" Checked='<%#Eval("CanAccess")%>' ToolTip='<%#Eval("ChildSubMenuId")%>'
                                                        OnCheckedChanged="chkCanAccessSubMenu1_CheckedChanged" Text="Access" AutoPostBack="true" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="canAdd1" runat="server" Checked='<%#Eval("CanAdd")%>' ToolTip='<%#Eval("ChildSubMenuId")%>'
                                                        Text="Add" OnCheckedChanged="canAdd1_CheckedChanged" AutoPostBack="true" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="canUpdate1" runat="server" Checked='<%#Eval("CanUpdate")%>' ToolTip='<%#Eval("ChildSubMenuId")%>'
                                                        Text="Update" OnCheckedChanged="canUpdate1_CheckedChanged" AutoPostBack="true" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="canDelete1" runat="server" Checked='<%#Eval("CanDelete")%>' ToolTip='<%#Eval("ChildSubMenuId")%>'
                                                        Text="Delete" OnCheckedChanged="canDelete1_CheckedChanged" AutoPostBack="true" />
                                                </td>

                                            </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            </ItemTemplate>
                                                                            </asp:Repeater>
                                    </ItemTemplate>
     <FooterTemplate>
         </tbody>
         </table>
     </FooterTemplate>
     </asp:Repeater>

                         

                        </div>
                    </div>
                            </div>
                        </div> <!-- end col -->

                         <!-- end col -->
                    </div>
                    
                    </div>
                </div>
        </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

