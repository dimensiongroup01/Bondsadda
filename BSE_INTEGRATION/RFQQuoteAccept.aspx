<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQQuoteAccept.aspx.cs" Inherits="BSE_INTEGRATION_RFQQuoteAccept" Async ="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RFQ Quote Accept</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">


    <!-- ✅ Bootstrap Bundle JS (Includes Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // JavaScript Validation
        function validateForm() {
            let isValid = true;

            // Validate RFQ Deal ID (Length = 15, Required)
            let rfqDealID = document.getElementById('txtRFQDealID').value;
            if (rfqDealID.length !== 15) {
                alert('RFQ Deal ID must be 15 characters.');
                isValid = false;
            }

            // Validate RFQ Order Number (Length = 16, Starts with "R", Required)
            let rfqOrderNumber = document.getElementById('txtRFQOrderNumber').value;
            if (rfqOrderNumber.length !== 16 || rfqOrderNumber.charAt(0) !== 'R') {
                alert('RFQ Order Number must be 16 characters and start with "R".');
                isValid = false;
            }

            // Validate ISIN Number (Length = 12, Required)
            let isinNumber = document.getElementById('txtISINNumber').value;
            if (isinNumber.length !== 12) {
                alert('ISIN Number must be 12 characters.');
                isValid = false;
            }

            // Validate Value (Must be numeric, greater than or equal to min value, and in multiple of 100)
            let value = document.getElementById('txtValue').value;
            let minValue = 1000; // Assuming minimum value is 1000
            if (isNaN(value) || value < minValue || value % 100 !== 0) {
                alert('Value must be a number greater than or equal to ' + minValue + ' and in multiples of 100.');
                isValid = false;
            }

             Validate Direct Brokered (if Brokered and Quote Type is OFFER/BID)
            let directBrokered = document.querySelector('input[name="rblDirectBrokered"]:checked');
            let quoteType = document.getElementById('ddlQuoteType').value;
            if (directBrokered && directBrokered.value === "YES" && quoteType === 'OFFER') {
                let sellerBrokerCode = document.getElementById('txtSellerBrokerCode').value;
                if (sellerBrokerCode.length !== 15) {
                    alert('Seller Broker Code is required when Direct Brokered is YES and Quote Type is OFFER.');
                    isValid = false;
                }
            }
            if (directBrokered && directBrokered.value === "YES" && quoteType === 'BID') {
                let buyerBrokerCode = document.getElementById('txtBuyerBrokerCode').value;
                if (buyerBrokerCode.length !== 15) {
                    alert('Buyer Broker Code is required when Direct Brokered is YES and Quote Type is BID.');
                    isValid = false;
                }
            }

            return isValid;
        }
    </script>
       <%--  /* Custom Styling for the Form */--%>
      
    
    <style>
        {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            padding-top: 20px;
        }

        .container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 20px;
        }

        h2 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #343a40;
        }

        .nav-tabs {
            border-bottom: 2px solid #007bff;
        }

        .nav-tabs .nav-link {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 10px 15px;
            font-size: 1rem;
            color: #007bff;
            background-color: #f8f9fa;
        }

        .nav-tabs .nav-link.active {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .tab-content {
            padding-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            color: #495057;
        }

        .form-control {
            font-size: 14px;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            border: none;
            padding: 10px 20px;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
  <%-- <form id="form1" runat="server" onsubmit="return validateForm()">--%>
   <form id="form1" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4 text-warning"><i class="bi bi-box-arrow-in-down me-2"></i>RFQ Quote Accept</h2>

        <!-- RFQ Details Section -->
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-hash text-warning me-2"></i>RFQ Deal ID</label>
                <asp:TextBox ID="txtRFQDealID" runat="server" CssClass="form-control" placeholder="Enter RFQ Deal ID" AutoPostBack="True" OnTextChanged="txtISINNumber_TextChanged" />
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-receipt-cutoff text-warning me-2"></i>RFQ Order Number</label>
                <asp:TextBox ID="txtRFQOrderNumber" runat="server" CssClass="form-control" placeholder="Enter RFQ Order Number starting with 'R'" MaxLength="16" />
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-boxes text-warning me-2"></i>Product</label>
                <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-select">
                    <asp:ListItem Text="ICDM" Value="ICDM" />
                    <asp:ListItem Text="GSEC" Value="GSEC" />
                    <asp:ListItem Text="CP" Value="CP" />
                    <asp:ListItem Text="CD" Value="CD" />
                </asp:DropDownList>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-arrow-left-right text-warning me-2"></i>Quote Type</label>
                <asp:DropDownList ID="ddlQuoteType" runat="server" CssClass="form-select">
                    <asp:ListItem Text="--Select--" Value="" />
                    <asp:ListItem Text="BID" Value="BID" />
                    <asp:ListItem Text="OFFER" Value="OFFER" />
                </asp:DropDownList>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-upc text-warning me-2"></i>ISIN Number</label>
                <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control" placeholder="Enter ISIN Number" MaxLength="12" />
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-cash-coin text-warning me-2"></i>Value</label>
                <asp:TextBox ID="txtValue" runat="server" CssClass="form-control" placeholder="Enter Value" />
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold">
              <i class="bi bi-person-check-fill text-warning me-2"></i>PRO/Client
                </label>
                <asp:DropDownList ID="txtProClientCode" runat="server" CssClass="form-select">
                    <asp:ListItem Text="-- Select --" Value="" />
                    <asp:ListItem Text="PRO" Value="PRO" />
                    <asp:ListItem Text="CLIENT" Value="CLIENT" />
                </asp:DropDownList>

            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-person-badge text-warning me-2"></i>Buyer Client Code</label>
                <asp:TextBox ID="txtBuyerClientCode" runat="server" CssClass="form-control" placeholder="Enter Buyer Client Code" MaxLength="15" />
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-person-video3 text-warning me-2"></i>Seller Client Code</label>
                <asp:TextBox ID="txtSellerClientCode" runat="server" CssClass="form-control" placeholder="Enter Seller Client Code" MaxLength="15" />
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-person-gear text-warning me-2"></i>Seller Broker Code</label>
                <asp:TextBox ID="lblSellerBrokerCode" runat="server" CssClass="form-control" placeholder="Enter Seller Broker Code" MaxLength="15" />
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-person-vcard text-warning me-2"></i>Direct/Brokered</label>
                <asp:RadioButtonList ID="rblDirectBrokered" runat="server" CssClass="form-control">
                    <asp:ListItem Text="BROKERED" Value="BROKERED" />
                    <asp:ListItem Text="DIRECT" Value="DIRECT" />
                </asp:RadioButtonList>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-patch-check text-warning me-2"></i>RFQ Quote Accept</label>
                <asp:RadioButtonList ID="rblRFQQuoteAccept" runat="server" CssClass="form-control">
                    <asp:ListItem Text="ACCEPT" Value="ACCEPT" />
                    <asp:ListItem Text="REJECT" Value="REJECT" />
                </asp:RadioButtonList>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-chat-text text-warning me-2"></i>Responder Comment</label>
                <asp:TextBox ID="txtResponderComment" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-people-fill text-warning me-2"></i>User Type</label>
                <asp:DropDownList ID="lblUserType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Brokered" Value="BROKER" />
                    <asp:ListItem Text="Direct" Value="DIRECT" />
                </asp:DropDownList>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="text-center mt-4">
            <asp:Label ID="Label1" runat="server" CssClass="text-danger fw-bold"></asp:Label><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-warning btn-lg px-5 mt-3" OnClick="btnSubmit_Click" />
        </div>

        <!-- Success/Error Message -->
        <div class="row mt-3">
            <div class="col-md-6 offset-md-3 text-center">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-semibold"></asp:Label>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <asp:Panel ID="pnlRfqModal" runat="server" CssClass="modal fade" ClientIDMode="Static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content shadow rounded">
                <div class="modal-header">
                    <h5 class="modal-title">RFQ Quote Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                            <tr><th>RFQ Deal ID</th><td><asp:Label ID="rfqdealid" runat="server" /></td></tr>
                            <tr><th>RFQ Order Number</th><td><asp:Label ID="rfqordernumber" runat="server" /></td></tr>
                            <tr><th>Product</th><td><asp:Label ID="product" runat="server" /></td></tr>
                            <tr><th>User Type</th><td><asp:Label ID="usertype" runat="server" /></td></tr>
                            <tr><th>Quote Type</th><td><asp:Label ID="quotetype" runat="server" /></td></tr>
                            <tr><th>ISIN Number</th><td><asp:Label ID="isinnumber" runat="server" /></td></tr>
                            <tr><th>Value (₹)</th><td><asp:Label ID="value" runat="server" /></td></tr>
                            <tr><th>Pro Client</th><td><asp:Label ID="proclient" runat="server" /></td></tr>
                            <tr><th>Seller Client Code</th><td><asp:Label ID="sellerclientcode" runat="server" /></td></tr>
                            <tr><th>Direct Brokered</th><td><asp:Label ID="directbrokered" runat="server" /></td></tr>
                            <tr><th>Seller Broker Code</th><td><asp:Label ID="sellerbrokercode" runat="server" /></td></tr>
                            <tr><th>RFQ Quote Accept</th><td><asp:Label ID="rfqquoteaccept" runat="server" /></td></tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnAcceptQuote" runat="server" CssClass="btn btn-success" Text="Accept Quote" OnClick="btnSubmit_Click" UseSubmitBehavior="false" />
                    <asp:Button ID="btnCloseQuote" runat="server" CssClass="btn btn-secondary" Text="Close" OnClick="btnCloseQuote_Click" OnClientClick="return closeModal();" />
                </div>
            </div>
        </div>
    </asp:Panel>
</form>


           
       
</body>
</html>
