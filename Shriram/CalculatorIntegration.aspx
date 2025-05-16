<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CalculatorIntegration.aspx.cs" Inherits="Shriram_CalculatorIntegration" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Calculator API Interaction</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 800px; }
        .card { padding: 20px; border-radius: 10px; }
        #chartContainer { display: none; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center">Calculator API</h2>
            <!-- Bootstrap Nav Tabs -->
            <ul class="nav nav-tabs" id="calculatorTabs">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" href="#inputTab">Input Form</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#chartTab">Chart Visualization</a>
                </li>
            </ul>
            <div class="tab-content mt-3">
                <!-- Input Form Tab -->
                <div id="inputTab" class="tab-pane fade show active">
                    <div class="card shadow">
                        <h4 class="text-center mb-3">Enter Your Investment Details</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Cert Date:</label>
                                    <asp:TextBox ID="txtCertDate" runat="server" CssClass="form-control" Placeholder="Enter Cert Date"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Investment Amount:</label>
                                    <asp:TextBox ID="txtDblInvamt" runat="server" CssClass="form-control" Placeholder="Enter Amount"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Company:</label>
                                    <asp:TextBox ID="txtStrComp" runat="server" CssClass="form-control" Placeholder="Enter Company"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Investment Type:</label>
                                    <asp:TextBox ID="txtStrInvType" runat="server" CssClass="form-control" Placeholder="Enter Investment Type"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">SC Flag:</label>
                                    <asp:TextBox ID="txtStrSCFlag" runat="server" CssClass="form-control" Placeholder="Enter SC Flag"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Tenure (Years):</label>
                                    <asp:TextBox ID="txtStrTenure" runat="server" CssClass="form-control" Placeholder="Enter Tenure in Years"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Scheme:</label>
                                    <asp:TextBox ID="txtScheme" runat="server" CssClass="form-control" Placeholder="Enter Scheme"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Subtype:</label>
                                    <asp:TextBox ID="txtStrSubtype" runat="server" CssClass="form-control" Placeholder="Enter Subtype"></asp:TextBox>
                                </div>
                                 <div class="mb-3">
     <label class="form-label">Subtype:</label>
     <asp:TextBox ID="txtStrGenderCalc" runat="server" CssClass="form-control" Placeholder="Enter Subtype">Gender</asp:TextBox>
 </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnSubmitCalculator" runat="server" Text="Calculate & Show Chart" CssClass="btn btn-primary w-100" OnClientClick="updateChart(); return false;" />
                        </div>
                    </div>
                </div>
                 <div class="response-container">
 <asp:Label ID="litResponse" runat="server" Text="" CssClass="response-label" Visible="true"></asp:Label>
 </div>
                <!-- Chart Tab -->
                <div id="chartTab" class="tab-pane fade">
                    <div id="chartContainer" class="card p-4 shadow">
                        <h4 class="text-center">Investment Growth Chart</h4>
                        <canvas id="calculatorChart"></canvas>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <footer class="text-center mt-4">
                <p>&copy; 2025 API Integration Dashboard | Powered by Dimension Developer</p>
            </footer>
        </div>
    </form>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Chart.js Script -->
    <script>
        function updateChart() {
            var investmentAmount = parseFloat(document.getElementById('<%= txtDblInvamt.ClientID %>').value);
            var tenure = parseFloat(document.getElementById('<%= txtStrTenure.ClientID %>').value);
            if (isNaN(investmentAmount) || investmentAmount <= 0 || isNaN(tenure) || tenure <= 0) {
                alert("Please enter valid values for Investment Amount and Tenure.");
                return false;
            }
            document.getElementById("chartContainer").style.display = "block";
            var labels = [], dataPoints = [], growthRate = 1.1;
            for (var i = 0; i <= tenure; i++) {
                labels.push("Year " + i);
                dataPoints.push(investmentAmount * Math.pow(growthRate, i));
            }
            if (window.chartInstance) { window.chartInstance.destroy(); }
            var ctx = document.getElementById('calculatorChart').getContext('2d');
            window.chartInstance = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Investment Growth',
                        data: dataPoints,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 2,
                        tension: 0.4
                    }]
                },
                options: { responsive: true, scales: { y: { beginAtZero: true } } }
            });
            return false;
        }
    </script>
</body>
</html>