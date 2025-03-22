<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="BSE_INTEGRATION_Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - BSE API</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Keyframe Animation for Moving the Form */
        @keyframes moveForm {
            0% { transform: translateX(0); }
            50% { transform: translateX(10px); }
            100% { transform: translateX(0); }
        }

        /* Applying animation to the container */
        .animated-container {
            animation: moveForm 1s ease-in-out infinite;
        }

        /* Card hover effect */
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px); /* Slight lift effect on hover */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Shadow increase */
        }

        /* Logo size */
        .sizelogo {
            width: 250px;
            height: auto;
        }

        /* Media Queries for specific adjustments */
        @media (max-width: 768px) {
            .card {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body class="bg-light text-dark">

    <form id="form1" runat="server">
        <div class="container my-5 p-4 rounded shadow-lg animated-container">
            <!-- Navbar -->
            <div class="d-flex justify-content-between align-items-center  p-3 rounded-top">
                <img src="https://bondsadda.com/img/logo.png" alt="Bondsadda Logo" class="sizelogo" />
                <div>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger text-white" OnClick="btnLogout_Click" />
                </div>
            </div>

            <h2 class="text-center text-3xl font-weight-bold mt-4"><b>"Invest smart, Earn big, with BONDSADDA"</b></h2>
            <p class="text-center text-muted mt-2">Your Dealer ID: <asp:Label ID="lblDealerID" runat="server" class="font-weight-semibold"></asp:Label></p>

            <!-- Dashboard Cards Section -->
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mt-5">
                <!-- UCC Management Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">UCC Management</h5>
                            <p class="card-text">Manage your UCC information.</p>
                            <a href="UCCManagement.aspx" class="btn btn-outline-primary w-100">Go to UCC Management</a>
                        </div>
                    </div>
                </div>

                <!-- ICDM Order Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">ICDM Order</h5>
                            <p class="card-text">Place or manage ICDM orders.</p>
                            <a href="ICDMOrder.aspx" class="btn btn-outline-primary w-100">Go to ICDM Order</a>
                        </div>
                    </div>
                </div>

                <!-- RFQ Order Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">RFQ Order</h5>
                            <p class="card-text">Request for Quote orders.</p>
                            <a href="RFQOrder.aspx" class="btn btn-outline-primary w-100">Go to RFQ Order</a>
                        </div>
                    </div>
                </div>

                <!-- Modify RFQ Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">Modify RFQ</h5>
                            <p class="card-text">Modify your RFQ orders.</p>
                            <a href="RFQModify.aspx" class="btn btn-outline-primary w-100">Modify RFQ</a>
                        </div>
                    </div>
                </div>

                <!-- RFQQuoteAccept Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">RFQQuoteAccept</h5>
                            <p class="card-text">Access real-time market data.</p>
                            <a href="RFQQuoteAccept.aspx" class="btn btn-outline-primary w-100">View Market Data</a>
                        </div>
                    </div>
                </div>
                <!-- RFQDealPropose Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">RFQDealPropose</h5>
                            <p class="card-text">Access real-time market data.</p>
                            <a href="RFQDealPropose.aspx" class="btn btn-outline-primary w-100">View Market Data</a>
                        </div>
                    </div>
                </div>
                 <!-- RFQApprove Card -->
                 <div class="col">
                     <div class="card h-100 shadow-sm">
                         <div class="card-body text-center">
                             <h5 class="card-title">RFQ Approve</h5>
                             <p class="card-text">Access real-time market data.</p>
                             <a href="RFQApprove.aspx" class="btn btn-outline-primary w-100">View Market Data</a>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS (Optional for interactive elements) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
