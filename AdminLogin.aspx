<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="light" data-sidebar-size="lg" data-sidebar-image="none" data-layout-mode="light" data-body-image="img-1" data-preloader="disable">
<head>
    <meta charset="utf-8" />
    <title>Admin Login | Bonds Adda</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="Image/logo1.png">



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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlLogin" runat="server">
                    <div class="auth-page-wrapper pt-5">
                        <!-- auth page content -->
                        <div class="auth-page-content">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="text-center">


                                            <a href="#" class="d-inline-block auth-logo">

                                                <%--                             <img src="Image/Screenshot%202023-06-08%20183433.png" height="125"/>--%>
                                                <img src="Image/logo.png" height="70" />
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
                                                    <h5 class="text-basic">BONDS ADDA !</h5>
                                                    <%--  <p class="text-muted"></p>--%>
                                                </div>
                                                <div class="p-2 mt-3">
                                                    <div>

                                                        <div class="mb-3">
                                                            <label for="username" class="form-label">Username</label>
                                                            <asp:TextBox ID="txtUserName" runat="server" type="text" class="form-control" placeholder="Enter username"></asp:TextBox>
                                                        </div>

                                                        <div class="mb-3">
                                                            <div class="float-end">
                                                                <asp:LinkButton ID="lnkForget" runat="server" CssClass="text-muted" OnClick="lnkForget_Click">Forgot password?</asp:LinkButton>
                                                            </div>
                                                            <label class="form-label" for="password-input">Password</label>
                                                            <div class="position-relative auth-pass-inputgroup mb-3">
                                                                <asp:TextBox ID="txtPassword" runat="server" type="password" class="form-control pe-5 password-input" placeholder="Enter password"></asp:TextBox>
                                                                <button class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon" type="button" id="password-addon"><i class="ri-eye-fill align-middle"></i></button>
                                                            </div>
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
                                            <p class="mb-0 text-muted">
                                                &copy;
                                <script>document.write(new Date().getFullYear())</script>
                                                BONDS ADDA
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
                <asp:Panel ID="pnlForget" runat="server">
                    <div class="auth-page-wrapper pt-5">

                        <!-- auth page content -->
                        <div class="auth-page-content">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="text-center">


                                            <a href="index-2.html" class="d-inline-block auth-logo">

                                                <%--                                    <img src="drive-download-20230512T063738Z-001/WHITE(S).png" height="100"/>--%>
                                                <img src="Image/logo.png" height="70" />
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
                                                    <h5 class="text-basic">Forgot Password?</h5>
                                                    <%--                                    <p class="text-muted">Reset password with Clann</p>--%>
                                                </div>

                                                <div class="p-2">
                                                    <div>
                                                        <div class="mb-4">
                                                            <label class="form-label">Email</label>
                                                            <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control" placeholder="Enter Email"></asp:TextBox>
                                                        </div>

                                                        <div class="text-center mt-4">
                                                            <asp:LinkButton ID="lnkReset" runat="server" CssClass="btn btn-white w-100" OnClick="lnkReset_Click">Submit</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <!-- end form -->
                                                </div>
                                            </div>
                                            <!-- end card body -->
                                        </div>
                                        <!-- end card -->

                                        <div class="mt-4 text-center">
                                            <p class="mb-0">
                                                Wait, I remember my password... 
                <asp:LinkButton ID="lnkBackLogin" runat="server" CssClass="fw-semibold text-primary text-decoration-underline" OnClick="lnkBackLogin_Click">Click here</asp:LinkButton>
                                            </p>
                                        </div>

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
                                            <p class="mb-0 text-muted">
                                                &copy;
                                <script>document.write(new Date().getFullYear())</script>
                                                BONDS ADDA
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
        <script src="assets/js/pages/password-addon.init.js"></script>
        <!-- prismjs plugin -->
        <script src="assets/libs/prismjs/prism.js"></script>
        <script src="Admin/assets/js/validation.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="assets/js/jquery.notice.js"></script>
        <script>
            var input = document.getElementById("txtUserName");
            var input = document.getElementById("txtPassword");
            input.addEventListener("keypress", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    document.getElementById("lnkLogin").click();
                }
            });
        </script>

        <script>
            var input = document.getElementById("txtEmail");
            input.addEventListener("keypress", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    document.getElementById("lnkReset").click();
                }
            });
        </script>

    </form>
</body>
</html>
