<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerDetails.aspx.cs" Inherits="UserPanel_CustomerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .card-header {
    text-align: center;
}
        h2.card-title.mb-3 {
    font-size: 25px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID ="hfOTP" runat="server" />
                            <asp:HiddenField ID ="hfEmail" runat="server" />
    <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">PROFILE</h4>

                                <div class="page-title-right">
                                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-primary" OnClick="lnkEdit_Click" >UPDATE</asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>
                                <div class="tab-content pt-4 text-muted">
                                    <div class="tab-pane active" id="overview-tab" role="tabpanel">
                                        <div class="row">
                                            <div class="col-xxl-4"></div>
                                            <div class="col-xxl-4">
                                                <asp:Panel ID ="pnlView" runat="server">

                                                <div class="card">
                                                    <div class="card-header">
                                                        <h2 class="card-title mb-3">Profile Info</h2>
                                                        </div>
                                                        <div class="cord-body p-3">
                                                        <div class="table-responsive">
                                                            <table class="table table-borderless mb-0">
                                                                <tbody>
                                                                    <tr>
                                                                        <th class="ps-0" scope="row">Full Name :</th>
                                <td><asp:Label ID="lblFullName" runat="server" class="text-muted"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th class="ps-0" scope="row">Mobile :</th>
                               <td> <asp:Label ID="lblMobile" runat="server" class="text-muted"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th class="ps-0" scope="row">E-mail :</th>
                                <td ><asp:Label ID="lblEmail" runat="server" class="text-muted"></asp:Label></td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div><!-- end card body -->
                                                </div><!-- end card -->
                                                    </asp:Panel>
                                                </div>
                                             <div class="col-xxl-4"></div>
                                            </div>
                                        <div class="row">
                                            <div class="col-xxl-2"></div>
                                            
                                                <div class="col-xxl-8">
                                                    <asp:Panel ID="pnlUpdate" runat="server">
                                                <div class="card">
                                                                                    <div class="card-header">
                                    <ul class="nav nav-tabs-custom rounded card-header-tabs border-bottom-0" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#personalDetails" role="tab">
                                                <i class="fas fa-home"></i> Personal Details
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#changePassword" role="tab">
                                                <i class="far fa-user"></i> Change Password
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                                <div class="card-body p-4">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="personalDetails" role="tabpanel">
                                            <form action="javascript:void(0);">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="firstnameInput" class="form-label">Full Name*</label>
                                                            <asp:TextBox ID="txtFullName" runat="server" type="text" class="form-control" placeholder="Enter your fullName"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    
                                                    <!--end col-->
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="phonenumberInput" class="form-label">Phone Number*</label>
                                                            <asp:TextBox ID ="txtMobile" runat="server" type="text" class="form-control"  placeholder="Enter your phone number"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="phonenumberInput" class="form-label">Email*</label>
                                                            <asp:TextBox ID ="txtEmail" runat="server" class="form-control"  placeholder="Enter your email"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    

                                                    <!--end col-->
                                                    <div class="col-lg-12">
                                                        <div class="hstack gap-2 justify-content-end">
                                                            <asp:LinkButton ID ="lnkUpdate" runat="server" class="btn btn-primary" OnClick="lnkUpdate_Click">Updates</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkCancel" runat="server" class="btn btn-soft-danger" OnClick="lnkCancel_Click">Cancel</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                </div>
                                                <!--end row-->
                                            </form>
                                        </div>
                                        <!--end tab-pane-->
                                        <div class="tab-pane" id="changePassword" role="tabpanel">
                                            <form action="javascript:void(0);">
                                                                                                    <asp:Panel ID ="pnlpass" runat="server">
                                                <div class="row g-2">

                                                    <!--end col-->
                                                    <div class="col-lg-4">
                                                        <div>
                                                            <label for="newpasswordInput" class="form-label">New Password*</label>
                                                            <asp:TextBox ID ="txtNewPassword" runat="server" class="form-control"  placeholder="Enter new password"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-lg-4">
                                                        <div>
                                                            <label for="confirmpasswordInput" class="form-label">Confirm Password*</label>
                                                            <asp:TextBox ID="txtConfirmPass" runat="server" class="form-control"  placeholder="Confirm password"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <!--end col-->
                                                    <div class="col-lg-12">
                                                        <div class="text-end">
                                                            <asp:LinkButton ID="lnkChange" runat="server" class="btn btn-primary" OnClick="lnkChange_Click">Change Password</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <!--end col-->

                                                </div>
                                                                                                                                                                </asp:Panel>
                                                </form>
                                                  <form action="javascript:void(0);">
                                                <div class="row g-2">
                                                    <asp:Panel ID ="pnlPassOTP" runat="server">
                                                    <div class="col-lg-4">
                                                        <div>
                                                            <label for="newpasswordInput" class="form-label">OTP*</label>
                                                            <asp:TextBox ID ="txtOTP" runat="server" class="form-control"  placeholder="Enter OTP"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <div class="text-end">
                                                            <asp:LinkButton ID="lnkPassOTP" runat="server" class="btn btn-primary" OnClick="lnkPassOTP_Click">Change Password</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                        </asp:Panel>
                                                </div>
                                                <!--end row-->
                                            </form>
                                            
                                        </div>
                                        <!--end tab-pane-->
                                       
                                        <!--end tab-pane-->
                                    </div>
                                </div>
                                                    <!--end card-body-->
                                                </div><!-- end card -->
                                                        </asp:Panel>
                                            </div>
                                           <div class="col-xxl-2"></div>
                                            </div>
                                        </div>
                                    </div>
                </div> <!-- container-fluid -->
            </div>
            <!-- End Page-content -->


            
        </div>
                              </ContentTemplate>
                                            </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
         <script>
             $('.numbers').keypress(function (e) {
                 if (String.fromCharCode(e.keyCode).match(/[^0-9]/g)) return false;
             });
         </script>
    <script>
        function limitKeypress(event, value, maxLength) {
            if (value != undefined && value.toString().length >= maxLength) {
                event.preventDefault();
            }
        }
    </script>
</asp:Content>

