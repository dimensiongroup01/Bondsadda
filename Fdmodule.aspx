<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fdmodule.aspx.cs" Inherits="Fdmodule" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FD Registration Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet" />
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #fdfbfb, #ebedee);
        }

        .navbar-custom {
            background: #ffffff;
            padding: 10px 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand img {
            height: 40px;
        }

        .btn-nav {
            background: linear-gradient(135deg, #007bff, #6610f2);
            color: #fff;
            font-weight: 600;
            padding: 8px 18px;
            border: none;
            border-radius: 25px;
            transition: all 0.3s ease-in-out;
        }

        .btn-nav:hover {
            background: linear-gradient(135deg, #6610f2, #007bff);
            color: #fff;
        }

        .dashboard-top, .main-grid {
            padding: 20px 40px;
        }

        .dashboard-top {
            display: flex;
            justify-content: space-around;
            gap: 20px;
            flex-wrap: wrap;
        }

        .dashboard-card {
            flex: 1 1 200px;
            background: #fff;
            border-radius: 20px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .dashboard-card h5 {
            color: #343a40;
            margin-bottom: 10px;
        }

        .dashboard-card .count {
            font-size: 32px;
            font-weight: bold;
            color: #007bff;
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
            margin-bottom: 20px;
        }

        .form-control,
        .form-control-file {
            border-radius: 12px;
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

        .text-gradient {
            background: linear-gradient(to right, #00558c, #00c6ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-box:hover {
            transform: scale(1.01);
            transition: all 0.3s ease-in-out;
        }
        .hidden {
  display: none;
}

    </style>
    <script>
        function showFDForm() {
            document.getElementById("dashboardSection").classList.add("hidden");
            document.getElementById("fdFormSection").classList.remove("hidden");
        }

        function showDashboard() {
            document.getElementById("fdFormSection").classList.add("hidden");
            document.getElementById("dashboardSection").classList.remove("hidden");
        }

        window.onload = function () {
            new Chart(document.getElementById('fdChart'), {
                type: 'doughnut',
                data: {
                    labels: ['LIC Housing Finance Ltd.', 'Shriram Transport Finance Company Ltd.', 'Bajaj Finance Ltd.', 'PNB Housing Finance Ltd.'],
                    datasets: [{
                        data: [40, 20, 25, 15],
                        backgroundColor: ['#007bff', '#28a745', '#ffc107', '#dc3545']
                    }]
                },
                options: { responsive: true, legend: { position: 'bottom' } }
            });

            new Chart(document.getElementById('lineChart'), {
                type: 'line',
                data: {
                    labels: ['Q1', 'Q2', 'Q3', 'Q4'],
                    datasets: [{
                        label: 'FD Growth',
                        data: [50, 75, 60, 90],
                        borderColor: '#007bff',
                        backgroundColor: 'rgba(0,123,255,0.2)',
                        fill: true,
                        tension: 0.4
                    }]
                }
            });

            new Chart(document.getElementById('userBarChart'), {
                type: 'bar',
                data: {
                    labels: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                    datasets: [{
                        label: 'User Registrations',
                        data: [120, 90, 150, 200, 170, 220],
                        backgroundColor: '#6610f2',
                        borderRadius: 10
                    }]
                }
            });
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-custom fixed-top shadow-sm">
    <div class="container-fluid d-flex justify-content-between align-items-center px-3">
        <a class="navbar-brand" href="index.aspx">
            <img src="img/logo.png" alt="Logo" style="height: 40px;" />
        </a>
        <button type="button" class="btn btn-nav bg-warning text-light fw-semibold" onclick="showFDForm()">
            🚀 FD Registration
        </button>
    </div>
</nav>

        <!-- DASHBOARD SECTION -->
        <div id="dashboardSection">
            <div class="dashboard-top">
                <div class="dashboard-card"><h5>Total Users</h5><div class="count">872</div></div>
                <div class="dashboard-card"><h5>Monthly Growth</h5><div class="count">+28%</div></div>
                <div class="dashboard-card"><h5>Pending Verifications</h5><div class="count">34</div></div>
                <div class="dashboard-card"><h5>Active FDs</h5><div class="count">612</div></div>
            </div>

            <div class="main-grid">
                <div class="form-box">
                    <h2 class="chart-title">User Registrations - Last 6 Months</h2>
                    <canvas id="userBarChart"></canvas>
                </div>
                <div class="chart-box">
                    <h2 class="chart-title">FD Distribution</h2>
                    <canvas id="fdChart"></canvas>
                    <h2 class="chart-title mt-4">Growth Over Time</h2>
                    <canvas id="lineChart"></canvas>
                </div>
            </div>
        </div>

        <!-- FD REGISTRATION SECTION -->
    <div id="fdFormSection" class="container my-4 hidden">
    <button type="button" class="btn btn-sm btn-outline-secondary mb-3" onclick="showDashboard()">
        ← Back to Dashboard
    </button>

    <div class="form-box bg-white p-4 rounded shadow-sm border border-light">
        <h4 class="form-title mb-3 text-primary fw-semibold">
            <i class="fas fa-file-signature me-2 text-danger"></i> FD Registration
        </h4>

        <div class="row g-3">
            <!-- Left Column -->
            <div class="col-md-6">
                <div class="mb-2">
                    <label for="txtName" class="form-label"><i class="fas fa-user me-1 text-primary"></i> Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-sm" placeholder="Enter your full name" />
                </div>

                <div class="mb-2">
                    <label for="txtEmail" class="form-label"><i class="fas fa-envelope me-1 text-primary"></i> Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-sm" TextMode="Email" placeholder="example@email.com" />
                </div>

               <div class="mb-2">
    <label for="txtMobile" class="form-label">
        <i class="fas fa-phone me-1 text-primary"></i> Mobile Number
    </label>

    <asp:TextBox ID="txtMobile" runat="server"
        CssClass="form-control form-control-sm"
        MaxLength="10"
        placeholder="Enter 10-digit mobile number" />

    <!-- Required field validator -->
    <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
        ControlToValidate="txtMobile"
        ErrorMessage="Mobile number is required"
        CssClass="text-danger small d-block"
        Display="Dynamic"
        ValidationGroup="fdGroup" />

    <!-- Regular expression validator for 10-digit Indian mobile numbers -->
    <asp:RegularExpressionValidator ID="revMobile" runat="server"
        ControlToValidate="txtMobile"
        ValidationExpression="^[6-9]\d{9}$"
        ErrorMessage="Enter valid 10-digit Indian mobile number"
        CssClass="text-danger small d-block"
        Display="Dynamic"
        ValidationGroup="fdGroup" />
</div>


                <div class="mb-2">
                    <label for="txtPAN" class="form-label"><i class="fas fa-id-card me-1 text-primary"></i> PAN Number</label>
                    <asp:TextBox ID="txtPAN" runat="server" CssClass="form-control form-control-sm text-uppercase" MaxLength="10" placeholder="ABCDE1234F" />
                </div>

                <div class="mb-2">
                    <label for="ddlFDType" class="form-label"><i class="fas fa-university me-1 text-primary"></i> Select FD Type</label>
                    <asp:DropDownList ID="ddlFDType" runat="server" CssClass="form-select form-select-sm">
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
                <div class="mb-2">
                    <label for="txtAadhaar" class="form-label"><i class="fas fa-address-card me-1 text-primary"></i> Aadhaar Number</label>
                    <asp:TextBox ID="txtAadhaar" runat="server" CssClass="form-control form-control-sm" MaxLength="12" placeholder="XXXX-XXXX-XXXX" />
                </div>

                <div class="mb-2">
                    <label for="fuPAN" class="form-label"><i class="fas fa-upload text-success me-1"></i> Upload PAN Card</label>
                    <asp:FileUpload ID="fuPAN" runat="server" CssClass="form-control form-control-sm" />
                </div>

                <div class="mb-2">
                    <label for="fuAadhaar" class="form-label"><i class="fas fa-upload text-success me-1"></i> Upload Aadhaar Card</label>
                    <asp:FileUpload ID="fuAadhaar" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>
        </div>

        <hr class="my-3" style="border-top: 1px dashed #ccc;" />

        <div class="text-center mt-3  p-3 rounded">
    <asp:Button ID="btnSubmit" runat="server" Text="🚀 Submit Application"
        CssClass="bg-warning btn-sm px-4 py-2 fw-semibold shadow-sm border-0 rounded-pill"
        OnClick="btnSubmit_Click" />
</div>



    </div>
</div>


    </form>
</body>
</html>
