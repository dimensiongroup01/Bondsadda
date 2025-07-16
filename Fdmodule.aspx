<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fdmodule.aspx.cs" Inherits="Fdmodule" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FD Registration</title>

    <!-- Bootstrap & Icons -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #fdfbfb, #ebedee);
            overflow-x: hidden;
        }

        .header-wave svg, .footer-wave svg {
            width: 100%;
            height: 120px;
        }

        .form-section {
            display: flex;
            flex-wrap: wrap;
            height: auto;
            padding: 20px 40px;
            gap: 30px;
        }

        .form-box {
            flex: 1.2;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(8px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            animation: fadeInUp 0.6s ease-in-out;
        }

        .logo-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        .logo-header img {
            height: 50px;
        }

        h2.form-title {
            text-align: center;
            font-weight: 700;
            color: #333;
            margin-bottom: 25px;
        }

        .form-group label {
            font-weight: 600;
            font-size: 15px;
            color: #495057;
            transition: color 0.3s;
        }

        .form-group label i {
            margin-right: 6px;
            color: #007bff;
        }

        .form-control {
            border-radius: 12px;
        }

        .form-control:focus {
            border-color: #007bff;
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
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #6610f2, #007bff);
        }

        .error {
            font-size: 0.9em;
            color: red;
        }

        .chart-box {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-around;
        }

        canvas {
            max-width: 100%;
        }

        .person-svg {
            width: 100%;
            max-width: 260px;
            margin-top: 20px;
        }

        @media(max-width: 768px) {
            .form-section {
                flex-direction: column;
                height: auto;
            }

            .chart-box {
                justify-content: flex-start;
                margin-top: 20px;
            }
        }

        @keyframes fadeInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>

    <!-- Top SVG Wave -->
    <div class="header-wave">
        <svg viewBox="0 0 1440 320">
            <path fill="#ffffff" fill-opacity="1" d="M0,96L48,128C96,160,192,224,288,224C384,224,480,160,576,138.7C672,117,768,139,864,165.3C960,192,1056,224,1152,224C1248,224,1344,192,1392,176L1440,160L1440,0L0,0Z"></path>
        </svg>
    </div>

    <!-- Blob Decoration SVG -->
    <svg style="position: absolute; top: 140px; left: -80px; z-index: -1;" width="500" height="500" viewBox="0 0 200 200">
        <path fill="#cce5ff" d="M47.8,-66.3C60.6,-59.1,68.3,-45.4,73.7,-30.9C79,-16.3,82,0.2,76.4,14.3C70.9,28.4,56.8,40.2,43.3,48.8C29.7,57.4,14.9,62.8,1.6,60.4C-11.7,58,-23.3,47.7,-36.3,39.1C-49.4,30.6,-64,23.7,-67.2,13.4C-70.3,3,-62.1,-11,-52.8,-22.1C-43.6,-33.1,-33.4,-41.1,-22.4,-49.2C-11.4,-57.3,0.3,-65.6,13.3,-70C26.2,-74.3,40.4,-74.9,47.8,-66.3Z" transform="translate(100 100)" />
    </svg>

    <form id="form1" runat="server">
        <div class="container-fluid form-section">
            <!-- Left: Form -->
            <div class="form-box">
                <div class="logo-header">
                    <img src="img/logo.png" alt="Logo 1" />
                    <img src="img/logodf.png" alt="Logo 2" />
                </div>

                <h2 class="form-title">FD Registration</h2>

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger mb-3" HeaderText="Please fix the following:" />

                <div class="row">
                    <!-- Column 1 -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtName"><i class="fas fa-user"></i>Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" CssClass="error" Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label for="txtEmail"><i class="fas fa-envelope"></i>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="error" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                                ErrorMessage="Invalid email format" CssClass="error" Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label for="txtPAN"><i class="fas fa-id-card"></i>PAN</label>
                            <asp:TextBox ID="txtPAN" runat="server" CssClass="form-control" MaxLength="10" />
                            <asp:RequiredFieldValidator ID="rfvPAN" runat="server" ControlToValidate="txtPAN" ErrorMessage="PAN is required" CssClass="error" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPAN" runat="server" ControlToValidate="txtPAN"
                                ValidationExpression="[A-Z]{5}[0-9]{4}[A-Z]{1}" ErrorMessage="Invalid PAN format" CssClass="error" Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label for="ddlFDType"><i class="fas fa-list-ul"></i>FD Type</label>
                            <asp:DropDownList ID="ddlFDType" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select FD Type --" Value="" />
                                <asp:ListItem Text="SANCHAY" Value="SANCHAY" />
                                <asp:ListItem Text="SHRI RAM FINANCE" Value="SHRIRAM" />
                                <asp:ListItem Text="BAJAJ" Value="BAJAJ" />
                                <asp:ListItem Text="PNB" Value="PNB" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvFDType" runat="server" ControlToValidate="ddlFDType" InitialValue="" ErrorMessage="Please select FD Type" CssClass="error" Display="Dynamic" />
                        </div>
                    </div>

                    <!-- Column 2 -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtAadhaar"><i class="fas fa-address-card"></i>Aadhaar</label>
                            <asp:TextBox ID="txtAadhaar" runat="server" CssClass="form-control" MaxLength="12" />
                            <asp:RequiredFieldValidator ID="rfvAadhaar" runat="server" ControlToValidate="txtAadhaar" ErrorMessage="Aadhaar is required" CssClass="error" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revAadhaar" runat="server" ControlToValidate="txtAadhaar"
                                ValidationExpression="^\d{12}$" ErrorMessage="Aadhaar must be 12 digits" CssClass="error" Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label for="fuPAN"><i class="fas fa-upload"></i>Upload PAN</label>
                            <asp:FileUpload ID="fuPAN" runat="server" CssClass="form-control-file" />
                        </div>

                        <div class="form-group">
                            <label for="fuAadhaar"><i class="fas fa-upload"></i>Upload Aadhaar</label>
                            <asp:FileUpload ID="fuAadhaar" runat="server" CssClass="form-control-file" />
                        </div>
                        <div class="form-group">
                            <label for="txtMobileNo">Mobile Number</label>
                            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                        </div>

                    </div>
                </div>

                <div class="form-group text-center mt-4">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>

            <!-- Right: Chart & Image -->
            <div class="chart-box">
                <canvas id="fdChart"></canvas>
                <canvas id="lineChart" style="margin-top: 40px;"></canvas>
                <img src="https://www.svgrepo.com/show/364798/person-employee.svg" class="person-svg" alt="Person" />
            </div>
        </div>
    </form>

    <!-- Bottom SVG Wave -->
    <div class="footer-wave">
        <svg viewBox="0 0 1440 320">
            <path fill="#ffffff" fill-opacity="1" d="M0,32L48,58.7C96,85,192,139,288,138.7C384,139,480,85,576,101.3C672,117,768,203,864,218.7C960,235,1056,181,1152,160C1248,139,1344,149,1392,154.7L1440,160L1440,320L0,320Z"></path>
        </svg>
    </div>

    <!-- Chart.js Scripts -->
    <script>
        window.onload = function () {
            new Chart(document.getElementById('fdChart').getContext('2d'), {
                type: 'doughnut',
                data: {
                    labels: ['SANCHAY', 'SHRIRAM', 'BAJAJ', 'PNB'],
                    datasets: [{
                        data: [40, 20, 25, 15],
                        backgroundColor: ['#007bff', '#28a745', '#ffc107', '#dc3545'],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    legend: { position: 'bottom' }
                }
            });

            new Chart(document.getElementById('lineChart').getContext('2d'), {
                type: 'line',
                data: {
                    labels: ['Q1', 'Q2', 'Q3', 'Q4'],
                    datasets: [{
                        label: 'FD Growth Trend',
                        data: [50, 75, 60, 90],
                        borderColor: '#007bff',
                        backgroundColor: 'rgba(0,123,255,0.2)',
                        fill: true,
                        tension: 0.4,
                        borderWidth: 3,
                        pointBackgroundColor: '#007bff',
                        pointBorderColor: '#fff',
                        pointRadius: 6
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: { position: 'top' }
                    },
                    scales: {
                        y: { beginAtZero: true, grid: { color: '#ccc' } },
                        x: { grid: { color: '#eee' } }
                    }
                }
            });
        };
    </script>
</body>
</html>
