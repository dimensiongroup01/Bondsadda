<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="UserPanel_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .text-align {
    text-align: center;
}
 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID ="upnl" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID ="hfOTP" runat="server" />
            <asp:HiddenField ID ="hfEmail" runat="server" />
            <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">
    <div class="row">
        <div class="col-xxl-4 col-xl-6"></div>
    <div class="col-xxl-4 col-xl-6">
                
        <div class="card">
            <div class="card-header align-items-center d-flex">
                
                                    <h4 class="card-title mb-0 flex-grow-1">Change Password</h4>
                                    <div class="flex-shrink-0">
                                        
                                    </div>
                                </div>
            <asp:Panel ID ="pnlpass" runat="server">
                            <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">
                                                

                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">New Password</label>
                                                        <asp:TextBox ID ="txtNewPassword" runat="server"  type="text" class="form-control" placeholder="Enter New Password"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Confirm New Password</label>
                                                        <asp:TextBox ID ="TxtCNewPassword" runat="server"  type="text" class="form-control" placeholder="Enter Confirm Password"></asp:TextBox>
                                                    </div>
                                                </div>


                                                <!--end col-->
                                                
                                                <!--end col-->
                                                <div class="col-lg-12">
                                                    <div class="text-center">
            <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-primary" OnClick="lnkAdd_Click" >Change Password</asp:LinkButton>
                                                        
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <!--end row-->
                                        </div>
                                    </div>
                                    
                                </div><!-- end card -->
                </asp:Panel>
            <asp:Panel ID ="pnlOTP" runat="server">
                <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">
                                                

                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">OTP*</label>
                                                        <asp:TextBox ID ="txtOTP" runat="server"  type="text" class="form-control" placeholder="Enter OTP"></asp:TextBox>
                                                    </div>
                                                </div>

                                                


                                                <!--end col-->
                                                
                                                <!--end col-->
                                                <div class="col-lg-12">
                                                    <div class="text-center">
            <asp:LinkButton ID="lnkSubmot" runat="server" CssClass="btn btn-primary" OnClick="lnkSubmot_Click" >Submit</asp:LinkButton>
                                                        
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <!--end row-->
                                        </div>
                                    </div>
                                    
                                </div>
            </asp:Panel>
                        </div>
        </div>
                <div class="col-xxl-4 col-xl-6"></div>
        </div>
                    </div>
                </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

