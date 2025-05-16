
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ICDMOrder.aspx.cs" Inherits="BSE_INTEGRATION_ICDMOrder" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ICDM Order</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


    <!-- Flatpickr for Time Picker -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
        }

        /* NavTabs Styling */
        .nav-tabs .nav-link.active {
            background-color: #007bff;
            color: white;
        }

        .nav-tabs .nav-link {
            font-weight: bold;
            color: #007bff;
        }

        .tab-content {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
        }

        /* Card Hover Effect */
        .card {
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .form-control, .form-select {
            font-size: 14px;
            margin-bottom: 15px;
        }

        .form-label {
            font-weight: bold;
        }

        .btn-primary {
            font-size: 16px;
            font-weight: bold;
        }
    </style>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Flatpickr JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
    <script>
        
        document.addEventListener("DOMContentLoaded", function () {
            // Attach onblur events for individual field validations
            document.getElementById('<%= txtISIN.ClientID %>').addEventListener("blur", validateISIN);
                document.getElementById('<%= txtValue.ClientID %>').addEventListener("blur", validateValue);
                document.getElementById('<%= txtPrice.ClientID %>').addEventListener("blur", validatePrice);
                document.getElementById('<%= txtYield.ClientID %>').addEventListener("blur", validateYield);
                document.getElementById('<%= txtBuyerClientId.ClientID %>').addEventListener("blur", validateBuyerClientId);
                document.getElementById('<%= ddlHours.ClientID %>').addEventListener("change", validateExecutionTime);
                document.getElementById('<%= ddlMinutes.ClientID %>').addEventListener("change", validateExecutionTime);

                // Validate on submit button click
                document.getElementById('<%= btnCreateICDM.ClientID %>').addEventListener("click", function (event) {
                    if (!validateForm()) {
                        event.preventDefault();  // Stop form submission if validation fails
                    }
                });

                // Prevent modal from opening if data is incorrect
                document.getElementById('orderModal').addEventListener('show.bs.modal', function (event) {
                    let orderGrid = document.getElementById("gvOrders");  // Ensure GridView has data
                    // Assuming the first row is the header row; so valid data exists if more than 1 row.
                    if (!orderGrid || orderGrid.rows.length <= 1) {
                        alert("No valid order data available.");
                        event.preventDefault();
                    }
                });
            });

        // Individual Field Validation Functions
        function validateISIN() {
            let isin = document.getElementById('<%= txtISIN.ClientID %>').value.trim();
            if (!/^([A-Za-z0-9]{12})$/.test(isin)) {
                alert("❌ Invalid ISIN Number. It must be 12 alphanumeric characters.");
                return false;
            }
            return true;
        }

        function validateValue() {
            let value = document.getElementById('<%= txtValue.ClientID %>').value.trim();
            if (!/^\d+(\.\d{1,2})?$/.test(value) || parseFloat(value) <= 0) {
                alert("❌ Value must be a positive number.");
                return false;
            }
            return true;
        }

        function validatePrice() {
            let price = document.getElementById('<%= txtPrice.ClientID %>').value.trim();
        if (!/^\d+(\.\d{1,2})?$/.test(price) || parseFloat(price) <= 0) {
            alert("❌ Price must be a positive number.");
            return false;
        }
        return true;
    }

    function validateYield() {
        let yieldVal = document.getElementById('<%= txtYield.ClientID %>').value.trim();
        if (!/^\d+(\.\d{1,2})?$/.test(yieldVal) || parseFloat(yieldVal) <= 0) {
            alert("❌ Yield must be a positive number.");
            return false;
        }
        return true;
    }

    function validateBuyerClientId() {
        let buyerClientId = document.getElementById('<%= txtBuyerClientId.ClientID %>').value.trim();
        if (buyerClientId === "") {
            alert("❌ Buyer Client ID cannot be empty.");
            return false;
        }
        return true;
    }

    function validateExecutionTime() {
        let hours = document.getElementById('<%= ddlHours.ClientID %>').value;
        let minutes = document.getElementById('<%= ddlMinutes.ClientID %>').value;
        if (hours === "" || minutes === "") {
            alert("❌ Execution Time must be selected.");
            return false;
        }
        return true;
    }

    // Form Validation on Submit
    function validateForm() {
        let isValid = true;
        let errorMessage = "";

        // Validate ISIN
        let isin = document.getElementById('<%= txtISIN.ClientID %>').value.trim();
        if (!/^([A-Za-z0-9]{12})$/.test(isin)) {
            errorMessage += "❌ Invalid ISIN Number. It must be 12 alphanumeric characters.\n";
            isValid = false;
        }

        // Validate Value
        let value = document.getElementById('<%= txtValue.ClientID %>').value.trim();
        if (!/^\d+(\.\d{1,2})?$/.test(value) || parseFloat(value) <= 0) {
            errorMessage += "❌ Value must be a positive number.\n";
            isValid = false;
        }

        // Validate Price
        let price = document.getElementById('<%= txtPrice.ClientID %>').value.trim();
        if (!/^\d+(\.\d{1,2})?$/.test(price) || parseFloat(price) <= 0) {
            errorMessage += "❌ Price must be a positive number.\n";
            isValid = false;
        }

        // Validate Yield
        let yieldVal = document.getElementById('<%= txtYield.ClientID %>').value.trim();
        if (!/^\d+(\.\d{1,2})?$/.test(yieldVal) || parseFloat(yieldVal) <= 0) {
            errorMessage += "❌ Yield must be a positive number.\n";
            isValid = false;
        }

        // Validate Execution Time (Hours & Minutes)
        let hours = document.getElementById('<%= ddlHours.ClientID %>').value;
        let minutes = document.getElementById('<%= ddlMinutes.ClientID %>').value;
        if (hours === "" || minutes === "") {
            errorMessage += "❌ Execution Time must be selected.\n";
            isValid = false;
        }

    <!-- External JavaScript -->
    <script src="../js/bse_i/timepicker.js"></script>
</head>
    <style>
        .container{
            width:85%;
            margin:0 auto;
        }
       .gold-label {
        font-weight: bold;
        color: #b8860b;
    }
    .input-group-text {
        background: linear-gradient(45deg, #FFD700, #FFA500);
        color: black;
        border: none;
    }
    .form-label {
        font-weight: bold;
    }
    .btn-gold {
        background: linear-gradient(45deg, #FFD700, #FFA500);
        color: black;
        font-weight: bold;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        transition: background 0.3s;
    }
    .btn-gold:hover {
        background: linear-gradient(45deg, #FFA500, #FFD700);
    }
    </style>

<body>
   <form id="form1" runat="server">
    <div class="container p-3">
        <div class="card border shadow-sm rounded-3 p-3">
            <h5 class="mb-3 text-primary fw-semibold">
                <i class="fas fa-file-invoice me-2"></i> ICDM Order Entry
            </h5>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold mb-2 d-block"></asp:Label>

            <div class="row g-3">
    <!-- ISIN -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-barcode me-1"></i>ISIN Number</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-barcode"></i></span>
            <asp:TextBox ID="txtISIN" runat="server" CssClass="form-control" placeholder="Enter ISIN" required></asp:TextBox>
        </div>
    </div>

    <!-- Order Type -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-exchange-alt me-1"></i>Order Type</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-exchange-alt"></i></span>
            <asp:DropDownList ID="ddlOrderType" runat="server" CssClass="form-select">
                <asp:ListItem Text="SELL" Value="1" />
                <asp:ListItem Text="BOTH (CROSS DEAL)" Value="2" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Issue Type -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-file-invoice-dollar me-1"></i>Issue Type</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-file-invoice-dollar"></i></span>
            <asp:DropDownList ID="ddlIssueType" runat="server" CssClass="form-select">
                <asp:ListItem Text="ICDM" Value="ICDM" />
                <asp:ListItem Text="CP" Value="CP" />
                <asp:ListItem Text="CD" Value="CD" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Previous Day Deal -->
    <div class="col-md-4 d-flex align-items-end">
        <div class="form-check">
            <asp:CheckBox ID="chkpreviousdaydeal" runat="server" CssClass="form-check-input" />
            <label class="form-check-label gold-label ms-1"><i class="fas fa-calendar-day me-1"></i>Previous Day Deal</label>
        </div>
    </div>

    <!-- Value -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-rupee-sign me-1"></i>Value</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
            <asp:TextBox ID="txtValue" runat="server" CssClass="form-control" placeholder="Enter Value" required></asp:TextBox>
        </div>
    </div>

    <!-- Price -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-percentage me-1"></i>Price</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-percentage"></i></span>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Price" required></asp:TextBox>
        </div>
    </div>

    <!-- Settle Days -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-calendar-check me-1"></i>Settle Days</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-calendar-check"></i></span>
            <asp:DropDownList ID="ddlSettleDays" runat="server" CssClass="form-select">
                <asp:ListItem Text="T+0" Value="0" />
                <asp:ListItem Text="T+1" Value="1" />
                <asp:ListItem Text="T+2" Value="2" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Mod Accr Int -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-calculator me-1"></i>Mod.Accr.Int</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-calculator"></i></span>
            <asp:TextBox ID="txtModAcrr" runat="server" CssClass="form-control" required></asp:TextBox>
        </div>
    </div>

    <!-- Seller Participant -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-user-tag me-1"></i>Seller Participant Id</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-user-tag"></i></span>
            <asp:TextBox ID="txtSellerParticipantLoginId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFI"></asp:TextBox>
        </div>
    </div>

    <!-- Seller Dealer -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-user-tie me-1"></i>Seller Dealer Id</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-user-tie"></i></span>
            <asp:TextBox ID="txtSellerDealerLoginId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFID1"></asp:TextBox>
        </div>
    </div>

    <!-- Seller Client -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-users me-1"></i>Seller Client Id</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-users"></i></span>
            <asp:TextBox ID="txtSellerClientLoginId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFI"></asp:TextBox>
        </div>
    </div>

    <!-- Buyer Dealer -->
<div class="col-md-4">
    <label class="form-label gold-label"><i class="fas fa-user-shield me-1"></i>Buyer Dealer Id</label>
    <div class="input-group">
        <span class="input-group-text"><i class="fas fa-user-shield"></i></span>
        <asp:TextBox ID="txtBuyerDealerId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFID1"></asp:TextBox>
    </div>
</div>

<!-- Buyer Client -->
<div class="col-md-4">
    <label class="form-label gold-label"><i class="fas fa-user-friends me-1"></i>Buyer Client Id</label>
    <div class="input-group">
        <span class="input-group-text"><i class="fas fa-user-friends"></i></span>
        <asp:TextBox ID="txtBuyerClientId" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>


    <!-- Execution Time -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-clock me-1"></i>Execution Time (HH:MM)</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-clock"></i></span>
            <asp:DropDownList ID="ddlHours" runat="server" CssClass="form-select w-50"></asp:DropDownList>
            <span class="input-group-text">:</span>
            <asp:DropDownList ID="ddlMinutes" runat="server" CssClass="form-select w-50"></asp:DropDownList>
        </div>
    </div>

    <!-- Yield Type -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-chart-line me-1"></i>Yield Type</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-chart-line"></i></span>
            <asp:DropDownList ID="ddlYieldType" runat="server" CssClass="form-select">
                <asp:ListItem Text="YTM" Value="YTM" />
                <asp:ListItem Text="YTP" Value="YTP" />
                <asp:ListItem Text="YTC" Value="YTV" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Is Broker -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-handshake me-1"></i>Is Broker</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-handshake"></i></span>
            <asp:DropDownList ID="ddlIsBroker" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlIsBroker_SelectedIndexChanged">
                <asp:ListItem Text="DIRECT" Value="DIRECT" />
                <asp:ListItem Text="BROKERED" Value="BROKERED" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Yield -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-percentage me-1"></i>Yield</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-percentage"></i></span>
            <asp:TextBox ID="txtYield" runat="server" CssClass="form-control" required></asp:TextBox>
        </div>
    </div>

    <!-- Brokered Name -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-user-circle me-1"></i>Brokered Name</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
            <asp:TextBox ID="txtBrokeredName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
        </div>
    </div>

    <!-- Reference Number -->
    <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-hashtag me-1"></i>Reference Number</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
            <asp:TextBox ID="txtSellerReferenceno" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <!-- Submit Button -->
    <div class="col-12 mt-3">
        <asp:Button ID="btnCreateICDM" runat="server" Text="Create Order" CssClass="btn-gold w-100" OnClick="btnCreateICDM_Click" />
    </div>
</div>

        </div>
    </div>

    <script>
        // Enable tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.forEach(function (tooltipTriggerEl) {
            new bootstrap.Tooltip(tooltipTriggerEl);
        });
    </script>
</form>

</body>
</html>
