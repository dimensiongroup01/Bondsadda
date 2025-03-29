<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Shriram_Dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>API Dashboard</title>
     <link rel="stylesheet" type="text/css" href="/css/style_shriram/css/dashboard.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header class="header">
                <h1>API Dashboard</h1>
                <p class="sub-heading">Easily access and interact with your APIs</p>
            </header>

            <!-- Dashboard Main Grid -->
            <div class="dashboard-grid">
                <!-- Schema API Panel -->
                <div class="dashboard-panel schema-panel">
                    <div class="panel-header">
                        <i class="fas fa-database"></i> 
                        <h3>Schema API</h3>
                    </div>
                    <div class="panel-content">
                        <p>Manage Schema API requests for your data structures.</p>
                        <a href="SchemaIntegration.aspx" class="btn btn-primary">Go to Schema API</a>
                    </div>
                </div>

                <!-- Calculator API Panel -->
                <div class="dashboard-panel calculator-panel">
                    <div class="panel-header">
                        <i class="fas fa-calculator"></i> 
                        <h3>Calculator API</h3>
                    </div>
                    <div class="panel-content">
                        <p>Calculate values and interact with financial data.</p>
                        <a href="CalculatorIntegration.aspx" class="btn btn-secondary">Go to Calculator API</a>
                    </div>
                </div>

                <!-- CKYC API Panel -->
                <div class="dashboard-panel ckyc-panel">
                    <div class="panel-header">
                        <i class="fas fa-id-card"></i>
                        <h3>CKYC API</h3>
                    </div>
                    <div class="panel-content">
                        <p>Handle KYC verification and validation requests.</p>
                        <a href="CKYCIntegration.aspx" class="btn btn-tertiary">Go to CKYC API</a>
                    </div>
                </div>
            </div>

            <!-- Footer Section -->
            <footer>
                <p>&copy; 2025 API Integration Dashboard | Powered by Dimension Developer</p>
            </footer>
        </div>
    </form>
</body>
</html>
