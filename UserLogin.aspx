<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<!DOCTYPE html>

<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="light" data-sidebar-size="lg" data-sidebar-image="none" data-layout-mode="light" data-body-image="img-1" data-preloader="disable">
<head>
        <meta charset="utf-8" />
    <title>UserLogin | Dimention Group</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="../Image/Screenshot%202023-06-08%20183433b.png">
  

    <!-- jsvectormap css -->
    <link href="assets/libs/jsvectormap/css/jsvectormap.min.css" rel="stylesheet" type="text/css" />

    <!--Swiper slider css-->
    <link href="assets/libs/swiper/swiper-bundle.min.css" rel="stylesheet" type="text/css" />

    <!-- Layout config Js -->
    <script src="assets/js/layout.js"></script>
    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />
    <!-- custom Css-->
    <link href="assets/css/custom.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/notice.css" rel="stylesheet" />
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css" />
    <style>

        .auth-page-content {
    margin-top: 65px;
}
        a#lnkLogin {
    background-color: darkgray;
}
        a#lnkReset {
    background-color: darkgray;
}
        a#lnkRegister {
    background: lightgray;
}
        a#lnkOTPSubmit {
                background: lightgray;
}
        a#lnkPassword {
                            background: lightgray;
}
    </style>
</head>
<body>
    <form id ="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:HiddenField ID ="hfOTP" runat="server" />
               <asp:Panel ID ="pnlLogin" runat="server">
                   <asp:HiddenField ID ="hfPassword" runat="server" />
    <div class="auth-page-wrapper pt-5">
        <!-- auth page content -->
        <div class="auth-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                                            <div class="text-center">

                            
                                <a href="index-2.html" class="d-inline-block auth-logo">

<%--                                    <img src="drive-download-20230512T063738Z-001/WHITE(S).png" height="100"/>--%>
                                                                 <img src="Image/Screenshot%202023-06-08%20183433.png" height="125"/>
                                </a>
                            
                        </div>
                    
                    </div>
                </div>
                <!-- end row -->

                <div class="row justify-content-center">
                    
                                        <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card mt-3 card-bg-fill">

                            <div class="card-body p-4">
                                <div class="text-center mt-0">
                                    <h5 class="text-basic">BONDS ADDA </h5>
                                   <%--  <p class="text-muted"></p>--%>
                                </div>
                                <div class="p-2 mt-3">
                                    <div>

                                        <div class="mb-3">
                                            <label for="username" class="form-label">Mobile/Email</label>
                                            <asp:TextBox ID ="txtEmail" runat="server" type="text" class="form-control" placeholder="Enter Mobile/Email"></asp:TextBox>
                                        </div>

                                        

                                        

                                        <div class="mt-3">
        <asp:LinkButton ID="lnkLogin" runat="server" CssClass="btn btn-white w-100" OnClick="lnkLogin_Click">Login</asp:LinkButton>
                                        </div>

                                        
                                    </div>
                                </div>
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card -->

                        

                    </div>

                    
             
                    </div>

                

                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end auth page content -->

        <!-- footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <p class="mb-0 text-muted">&copy;
                                <script>document.write(new Date().getFullYear())</script> DIMENTION GROUP
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->
    </div>
                </asp:Panel>

                    

    <!-- end auth-page-wrapper -->
            <asp:Panel ID ="pnlOTP" runat="server">
            <div class="auth-page-wrapper pt-5">

        <!-- auth page content -->
        <div class="auth-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">

                            
                                <a href="index-2.html" class="d-inline-block auth-logo">

<%--                                    <img src="drive-download-20230512T063738Z-001/WHITE(S).png" height="100"/>--%>
                                                                <img src="Image/Screenshot%202023-06-08%20183433.png" height="125"/>
                                </a>
                            
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card mt-4 card-bg-fill">

                            <div class="card-body p-4">
                                <div class="text-center mt-2">
                                    <h5 class="text-basic">Enter OTP</h5>
<%--                                    <p class="text-muted">Reset password with Clann</p>--%>


                                </div>

                                <div class="p-2">
                                    <div>
                                        <div class="mb-4">
                                            <label class="form-label">OTP</label>
                                            <asp:TextBox ID="txtOTP" runat="server" class="form-control" placeholder="Enter OTP"></asp:TextBox>
                                        </div>

                                        <div class="text-center mt-4">
            <asp:LinkButton ID="lnkOTPSubmit" runat="server" CssClass="btn btn-white w-100" OnClick="lnkOTPSubmit_Click">Submit</asp:LinkButton>
                                        </div>
                                    </div><!-- end form -->
                                </div>

            <asp:LinkButton ID="lnkBackToPassword" runat="server" CssClass="btn btn-white w-100" OnClick="lnkBackToPassword_Click">Login using password</asp:LinkButton>
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card -->

                        

                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end auth page content -->

        <!-- footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <p class="mb-0 text-muted">&copy;
                                <script>document.write(new Date().getFullYear())</script>DIMENTION GROUP
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->
    </div>
                </asp:Panel>

                    <asp:Panel ID ="pnlPassword" runat="server">
            <div class="auth-page-wrapper pt-5">

        <!-- auth page content -->
        <div class="auth-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">

                            
                                <a href="index-2.html" class="d-inline-block auth-logo">

<%--                                    <img src="drive-download-20230512T063738Z-001/WHITE(S).png" height="100"/>--%>
                                                                <img src="Image/Screenshot%202023-06-08%20183433.png" height="125"/>
                                </a>
                            
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card mt-4 card-bg-fill">

                            <div class="card-body p-4">
                                <div class="text-center mt-2">
                                    <h5 class="text-basic">Enter Password</h5>
<%--                                    <p class="text-muted">Reset password with Clann</p>--%>


                                </div>

                                <div class="p-2">
                                    <div>
                                        <div class="mb-4">
                                            <label class="form-label">Password</label>
                                            <asp:TextBox ID="txtPassword" runat="server"  type="email" class="form-control" placeholder="Enter OTP"></asp:TextBox>
                                        </div>

                                        <div class="text-center mt-4">
            <asp:LinkButton ID="lnkPassword" runat="server" CssClass="btn btn-white w-100" OnClick="lnkPassword_Click">Submit</asp:LinkButton>
                                        </div>
                                    </div><!-- end form -->
                                </div>


                        <asp:LinkButton ID="BackToOTP" runat="server" CssClass="btn btn-white w-100" OnClick="BackToOTP_Click">Login using OTP</asp:LinkButton>
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card -->

                        

                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end auth page content -->

        <!-- footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <p class="mb-0 text-muted">&copy;
                                <script>document.write(new Date().getFullYear())</script>DIMENTION GROUP
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->
    </div>
                </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>


    <!-- JAVASCRIPT -->
    <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/libs/simplebar/simplebar.min.js"></script>
    <script src="assets/libs/node-waves/waves.min.js"></script>
    <script src="assets/libs/feather-icons/feather.min.js"></script>
    <script src="assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
    <script src="assets/js/plugins.js"></script>
    <!-- prismjs plugin -->
    <script src="assets/libs/prismjs/prism.js"></script>
            <script src="assets/js/validation.js"></script>
    <script src="assets/js/app.js"></script>
        <script src="assets/js/jquery.notice.js"></script>
            </form>
</body>
</html>
