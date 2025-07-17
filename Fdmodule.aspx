    <%@ Page Language="C#"  AutoEventWireup="true" CodeFile="Fdmodule.aspx.cs" Inherits="Fdmodule" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>FD Registration Dashboard</title>

        <!-- CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <style>
            html, body {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', sans-serif;
                background: linear-gradient(to right, #fdfbfb, #ebedee);
            }

            .navbar-custom {
                background: #ffffff;
                padding: 10px 20px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .btn-nav {
                background: linear-gradient(135deg, #007bff, #6610f2);
                color: #fff;
                font-weight: 600;
                padding: 8px 18px;
                border: none;
                border-radius: 25px;
            }

            .dashboard-top, .main-grid {
                padding: 20px 40px;
            }

            .dashboard-card {
                background: #fff;
                border-radius: 20px;
                padding: 25px;
                text-align: center;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out;
            }

            .dashboard-card:hover {
                transform: translateY(-5px);
            }

            .main-grid {
                display: grid;
                grid-template-columns: 2fr 1.5fr;
                gap: 30px;
            }

            .form-box, .chart-box {
                background: #fff;
                border-radius: 20px;
                padding: 30px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            }

            .chart-title, .form-title {
                text-align: center;
                font-weight: bold;
                color: #343a40;
                
            }

            .form-control:focus {
                box-shadow: 0 0 0 0.15rem rgba(0, 123, 255, 0.25);
            }

            .btn-primary {
                width: 100%;
                padding: 12px;
                border-radius: 30px;
                font-weight: bold;
                font-size: 16px;
                background: linear-gradient(135deg, #007bff, #6610f2);
                border: none;
            }

            .btn-primary:hover {
                background: linear-gradient(135deg, #6610f2, #007bff);
            }

            .hidden {
                display: none;
            }

            footer {
                font-size: 0.875rem;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">

            <!-- NAVBAR -->
            <nav class="navbar navbar-expand-lg navbar-custom shadow-sm">
                <div class="container d-flex justify-content-between align-items-center px-3">
                    <a class="navbar-brand" href="index.aspx">
                        <img src="img/logo.png" alt="Logo" style="height: 40px;" />
                    </a>
                    <button type="button" class="btn btn-nav bg-warning text-light fw-semibold" onclick="showFDForm()">
                        🚀 FD Registration
                    </button>
                </div>
            </nav>

            <!-- DASHBOARD SECTION -->
            <div id="dashboardSection" class="container py-4">
                <div class="row g-3">
                    <div class="col-md-3 col-sm-6 mb-3">
                        <div class="dashboard-card">
                            <h6>Total Users</h6>
                            <div class="count fs-4 fw-bold">872</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-3">
                        <div class="dashboard-card">
                            <h6>Monthly Growth</h6>
                            <div class="count text-success fs-4 fw-bold">+28%</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-3">
                        <div class="dashboard-card">
                            <h6>Pending Verifications</h6>
                            <div class="count text-warning fs-4 fw-bold">34</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-3">
                        <div class="dashboard-card">
                            <h6>Active FDs</h6>
                            <div class="count text-primary fs-4 fw-bold">612</div>
                        </div>
                    </div>
                </div>

                <!-- CHARTS -->
                <div class="row mt-4 g-4">
                    <div class="col-lg-6 mb-4">
                        <div class="chart-box">
                            <h5 class="chart-title">User Registrations - Last 6 Months</h5>
                            <canvas id="userBarChart" class="w-100" height="250"></canvas>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="chart-box">
                            <h5 class="chart-title">FD Distribution</h5>
                            <canvas id="fdChart" class="w-100" height="250"></canvas>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="chart-box">
                            <h5 class="chart-title">Growth Over Time</h5>
                            <canvas id="lineChart" class="w-100" height="250"></canvas>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="chart-box">
                            <h5 class="chart-title">FD Type Comparison</h5>
                            <canvas id="doughnutChart" class="w-100" height="250"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FD REGISTRATION FORM -->
            <div id="fdFormSection" class="container my-4 hidden">
                <button type="button" class="btn btn-outline-secondary mb-3" onclick="showDashboard()">← Back to Dashboard</button>
                <div class="form-box">
                    <h4 class="form-title"><i class="fas fa-file-signature text-danger me-2"></i> FD Registration</h4>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-2">
                                <label for="txtName">Full Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name" />
                            </div>
                            <div class="mb-2">
                                <label for="txtEmail">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="example@email.com" />
                            </div>
                            <div class="mb-2">
                                <label for="txtMobile">Mobile Number</label>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" MaxLength="10" placeholder="Enter 10-digit mobile number" TextMode="SingleLine" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
                            </div>
                            <div class="mb-2">
                                <label for="txtPAN">PAN Number</label>
                                <asp:TextBox ID="txtPAN" runat="server" CssClass="form-control text-uppercase" MaxLength="10" placeholder="ABCDE1234F" />
                            </div>
                            <div class="mb-2">
                                <label for="ddlFDType">Select FD Type</label>
                                <asp:DropDownList ID="ddlFDType" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="-- Select --" Value="" />
                                    <asp:ListItem Text="LIC Housing Finance Ltd." Value="LIC Housing Finance Ltd." />
                                    <asp:ListItem Text="Shriram Transport Finance Company Ltd." Value="Shriram Transport Finance Company Ltd." />
                                    <asp:ListItem Text="Bajaj Finance Ltd." Value="Bajaj Finance Ltd." />
                                    <asp:ListItem Text="PNB Housing Finance Ltd." Value="PNB Housing Finance Ltd." />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-2">
                                <label for="txtAadhaar">Aadhaar Number</label>
                                <asp:TextBox ID="txtAadhaar" runat="server" CssClass="form-control" MaxLength="12" placeholder="XXXX-XXXX-XXXX" />
                            </div>
                            <div class="mb-2">
                                <label for="fuPAN">Upload PAN Card</label>
                                <asp:FileUpload ID="fuPAN" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-2">
                                <label for="fuAadhaar">Upload Aadhaar Card</label>
                                <asp:FileUpload ID="fuAadhaar" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <asp:Button ID="btnSubmit" runat="server" Text="🚀 Submit Application" CssClass="btn btn-warning px-4 py-2 fw-bold shadow-sm rounded-pill" OnClick="btnSubmit_Click" data-toggle="modal" data-target="#fdRegistrationModal" />
                    </div>
                </div>
            </div>

            <!-- FOOTER DISCLAIMER -->
            <footer class="text-center py-4 mt-5 bg-light text-muted">
                <p class="mb-0 px-3">
                    Disclaimer: Fixed Deposit returns shown on BondsAdda are subject to market risks and institutional availability. 
                    BondsAdda does not guarantee fixed returns. Investors are advised to evaluate terms before investing.
                </p>
            </footer>

            <!-- FD Registration Modal -->
<div class="modal fade" id="fdRegistrationModal" tabindex="-1" role="dialog" aria-labelledby="fdRegistrationLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="fdRegistrationLabel">
                    <i class="fas fa-file-signature me-2"></i> FD Registration
                </h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <div class="row">
                    <!-- Left Column -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtName">Full Name</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter your full name" />
                        </div>
                        <div class="form-group">
                            <label for="txtEmail">Email</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Email" placeholder="example@email.com" />
                        </div>
                        <div class="form-group">
                            <label for="txtMobile">Mobile Number</label>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" MaxLength="10"
                                placeholder="Enter 10-digit mobile number"
                                TextMode="SingleLine" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
                        </div>
                        <div class="form-group">
                            <label for="txtPAN">PAN Number</label>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control text-uppercase" MaxLength="10" placeholder="ABCDE1234F" />
                        </div>
                        <div class="form-group">
                            <label for="ddlFDType">Select FD Type</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select --" Value="" />
                                <asp:ListItem Text="LIC Housing Finance Ltd." Value="LIC Housing Finance Ltd." />
                                <asp:ListItem Text="Shriram Transport Finance Company Ltd." Value="Shriram Transport Finance Company Ltd." />
                                <asp:ListItem Text="Bajaj Finance Ltd." Value="Bajaj Finance Ltd." />
                                <asp:ListItem Text="PNB Housing Finance Ltd." Value="PNB Housing Finance Ltd." />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtAadhaar">Aadhaar Number</label>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" MaxLength="12" placeholder="XXXX-XXXX-XXXX" />
                        </div>
                        <div class="form-group">
                            <label for="fuPAN">Upload PAN Card</label>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="fuAadhaar">Upload Aadhaar Card</label>
                            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">❌ Cancel</button>
                <asp:Button ID="Button1" runat="server" Text="🚀 Submit Application" CssClass="btn btn-warning px-4 fw-bold shadow-sm rounded-pill" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</div>
               
            <!-- TOGGLE JS -->
            <script>
                function showFDForm() {
                    document.getElementById("dashboardSection").classList.add("hidden");
                    document.getElementById("fdFormSection").classList.remove("hidden");
                }

                function showDashboard() {
                    document.getElementById("fdFormSection").classList.add("hidden");
                    document.getElementById("dashboardSection").classList.remove("hidden");
                }
            </script>

            <!-- CHART JS SETUP -->
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const charts = {
                        userBarChart: {
                            type: 'bar',
                            data: {
                                labels: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                                datasets: [{
                                    label: 'Users',
                                    data: [120, 150, 180, 220, 300, 350],
                                    backgroundColor: '#ffc107'
                                }]
                            }
                        },
                        fdChart: {
                            type: 'pie',
                            data: {
                                labels: ['Corporate FD', 'Bank FD', 'NBFC FD'],
                                datasets: [{
                                    data: [40, 35, 25],
                                    backgroundColor: ['#0d6efd', '#198754', '#ffc107']
                                }]
                            }
                        },
                        lineChart: {
                            type: 'line',
                            data: {
                                labels: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                                datasets: [{
                                    label: 'Growth %',
                                    data: [5, 10, 15, 25, 30, 40],
                                    borderColor: '#198754',
                                    fill: false
                                }]
                            }
                        },
                        doughnutChart: {
                            type: 'doughnut',
                            data: {
                                labels: ['Shriram', 'Mahindra', 'Bajaj', 'Others'],
                                datasets: [{
                                    data: [120, 90, 60, 40],
                                    backgroundColor: ['#f44336', '#4caf50', '#ff9800', '#9c27b0']
                                }]
                            }
                        }
                    };

                    for (const id in charts) {
                        const canvas = document.getElementById(id);
                        if (canvas) {
                            new Chart(canvas, charts[id]);
                        }
                    }
                });
            </script>

            <!-- FILE SIZE VALIDATION -->
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const maxBytes = 4 * 1024 * 1024;
                    document.querySelector("form").addEventListener("submit", function (e) {
                        const pan = document.getElementById("<%= fuPAN.ClientID %>");
                        const aadhaar = document.getElementById("<%= fuAadhaar.ClientID %>");
                        if (pan.files[0] && pan.files[0].size > maxBytes) {
                            alert("❌ PAN file exceeds 4MB.");
                            e.preventDefault();
                        }
                        if (aadhaar.files[0] && aadhaar.files[0].size > maxBytes) {
                            alert("❌ Aadhaar file exceeds 4MB.");
                            e.preventDefault();
                        }
                    });
                });
            </script>

        </form>
    </body>
    </html>
